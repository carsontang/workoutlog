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
    @workout = current_user.workouts.build(params[:workout])
    # @workout = Workout.new(params[:workout])

    respond_to do |format|
      if @workout.save
        flash[:success] = "Workout created"
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
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
end
