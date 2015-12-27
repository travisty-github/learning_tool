var SubjectsController = Paloma.controller('Subjects');

// Executes when Rails SubjectsController#test is executed.
SubjectsController.prototype.test = function(){
  $('document').ready(function() {

    // Show answer, hide answer button and show correct/false buttons
    $('.test-btn-answer').click(function() {
      $(this).prevAll('.test-answer').removeClass('hidden');
      $(this).nextAll('button').removeClass('hidden');
      $(this).addClass('hidden');
    });
  });
};
