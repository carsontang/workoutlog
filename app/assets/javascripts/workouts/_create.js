WO.workouts.create = {
  init: function() {
    //$("#workout_workout_date").datepicker({'dateFormat': 'DD MM dd, yy'});
    //$("#workout_time").timepicker({ 'scrollDefaultNow': true });
    $("#workout_workout_date").datetimepicker({
      controlType: 'select',
      dateFormat: 'DD MM dd, yy',
      timeFormat: 'hh:mm tt'
    });
    $("#workout_exercises_attributes_0_lift_id").autocomplete({
      source: "/lifts.json"
    });
    $("form").on("click", ".add_fields", function(event) {
      var time = new Date().getTime();
      var regexp = new RegExp($(this).data('id'), 'g');
      $(this).before($(this).data('fields').replace(regexp, time));
      event.preventDefault();
    });
  }
};