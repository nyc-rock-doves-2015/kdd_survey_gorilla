$(document).ready(function() {
  var count = 0;
  $('#new_question_button').on('click', function(e){
    // $(e.target).preventDefault();
    count ++;
    var name = "question[" + count + "]"
    $('.new_question').last().append("<input type='text' name='" + name + "' placeholder='question'>");
  });
});
