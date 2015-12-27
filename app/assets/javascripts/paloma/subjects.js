var SubjectsController = Paloma.controller('Subjects');

// Executes when Rails SubjectsController#test is executed.
SubjectsController.prototype.test = function(){
  alert('inside controller');
  // $('document').ready = function() {
  //   alert('ready');
  // }
};
