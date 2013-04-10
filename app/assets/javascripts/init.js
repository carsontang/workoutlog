// Naming scheme:
// Each Rails controller has a corresponding JavaScript controller in the folder of the same name.
// The __init.js code initializes all the JavaScript controllers. They are named with two underscores
// so that they are lexographically earlier than the controllers' other functions.

WO = {};

WO.init = function() {
  WO.application.init();
  WO.workouts.init();
}