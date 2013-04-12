WO.workouts.create = {
  init: function() {
    $("#workout_workout_date").datepicker({'dateFormat': 'DD MM dd, yy'});
    $("#workout_time").timepicker({ 'scrollDefaultNow': true });
    $("#workout_exercises_attributes_0_lift_id").autocomplete({
      source: "/lifts.json"
    });
  }
};