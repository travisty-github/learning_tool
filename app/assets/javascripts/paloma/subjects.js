var SubjectsController = Paloma.controller('Subjects');

// Executes when Rails SubjectsController#test is executed.
SubjectsController.prototype.test = function(){
  $('document').ready(function() {

    // Show answer, hide answer button and show correct/incorrect buttons
    $('.test-btn-answer').click(function() {
      $(this).prevAll('.test-answer').removeClass('hidden');
      $(this).nextAll('button').removeClass('hidden');
      $(this).addClass('hidden');
    });

    // Correct answer
    $('.test-btn-correct').click(function() {
      $(this).parent().addClass('correct-answer-well');
      $(this).parent().removeClass('well');
      // Hide all buttons
      $(this).addClass('hidden');
      $(this).next().addClass('hidden');
      // TODO AJAX response
    });

    // Incorrect answer
    $('.test-btn-incorrect').click(function() {
      // Hide all buttons
      $(this).addClass('hidden');
      $(this).prev().addClass('hidden');
      // TODO AJAX response
    });
  });
};
