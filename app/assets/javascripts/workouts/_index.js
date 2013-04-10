WO.workouts.index = {
  init: function() {
    $('.calendar td').click(function(){
      var date = $(this).find(".date-info").text();
      window.location.replace("/workouts/new?date=" + date);
    });
  }
}