var SubjectsController = Paloma.controller('Subjects');

// Executes when Rails SubjectsController#test is executed.
SubjectsController.prototype.test = function(){

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
      // AJAX response
      var subject_id = $(this).parents('.subject').attr('id');
      var chunk_id = $(this).parent().attr('id');
      var response = {correct: true};
      $.post("/subjects/" + subject_id + "/test/" + chunk_id, response);
    });

    // Incorrect answer
    $('.test-btn-incorrect').click(function() {
      // Hide all buttons
      $(this).addClass('hidden');
      $(this).prev().addClass('hidden');
      // AJAX response
      var subject_id = $(this).parents('.subject').attr('id');
      var chunk_id = $(this).parent().attr('id');
      var response = {answer_correct: false};
      $.post("/subjects/" + subject_id + "/test/" + chunk_id, response);
    });
};

SubjectsController.prototype.index = function(){};
SubjectsController.prototype.answer = function(){};
SubjectsController.prototype.new = function(){};
SubjectsController.prototype.create = function(){};
