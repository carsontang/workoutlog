WO.workouts.index = {
  init: function() {
    $('.calendar td').click(function(evt){

      if (evt.target !== this) {
        // clicked on a descendant, forward user
        return;
      }
      var date = $(this).find(".date-info").text();
      window.location.replace("/workouts/new?date=" + date);
    });
  }
}