class WorkoutsController < ApplicationController
  before_filter :authenticate_user!
  # GET /workouts
  # GET /workouts.json
  def index
    @workouts_by_date = current_user.workouts.group_by do |workout|
      Date.new(workout.workout_date.year, workout.workout_date.month, workout.workout_date.day)
    end
    
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
    # TODO: When you hit Back on browser after you've clicked a date on the calendar, you don't
    # return to the calendar.

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workouts }
      format.js
    end
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @workout = Workout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/new
  # GET /workouts/new.json
  def new
    if params[:date]
      @workout = current_user.workouts.build(:workout_date => params[:date])
    else
      @workout = current_user.workouts.build
    end
    @exercise = @workout.exercises.build
    @exercise.exercise_sets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout }
    end
  end

  # GET /workouts/1/edit
  def edit
    @workout = Workout.find(params[:id])
  end

  # POST /workouts
  # POST /workouts.json
  def create
    # debugger
    # TODO: Clean up this params mess and make sure workouts#update allows multiple lift edit
    # TODO: Editing workouts should allow you to update workouts
    # TODO: Switch times to local time
    set_workout_date(params)
    remove_workout_time(params)
    set_lift_ids(params)
    
    @workout = current_user.workouts.build(params[:workout])

    respond_to do |format|
      if @workout.save
        flash[:success] = "Workout created"
        format.html { redirect_to workouts_path, notice: "Workout was successfully created." }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.json
  def update
    params[:workout][:workout_date] = "#{params[:workout][:workout_date]} #{params[:workout][:time]}"
    params[:workout] = params[:workout].slice(:workout_date, :exercises_attributes)
    @lift_name = params[:workout][:exercises_attributes]["0"][:lift_id]
    params[:workout][:exercises_attributes]["0"][:lift_id] = Lift.find_by_lift_name(@lift_name).id
    @workout = Workout.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_lift_id(id, params)
    lift_name = params[:workout][:exercises_attributes]["#{id}"][:lift_id]
    params[:workout][:exercises_attributes]["#{id}"][:lift_id] = Lift.find_by_lift_name(lift_name).id
  end

  def set_lift_ids(params)
    params[:workout][:exercises_attributes].each do |id, lift_name|
      set_lift_id(id, params)
    end
  end

  # A little hack to combine inputs from jQuery datepicker and timepicker
  def set_workout_date(params)
    params[:workout][:workout_date] = "#{params[:workout][:workout_date]} #{params[:workout][:time]}"
  end

  # Because Workout does not include :time as an attribute,
  # params[:workout] must remove :time
  def remove_workout_time(params)
    params[:workout] = params[:workout].slice(:workout_date, :exercises_attributes)
  end
end
