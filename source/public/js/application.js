$(document).ready(function() {
  var count = 0
  $('#new_survey').on('click', '#new_question_button', function(event){
    $.ajax({
      url: '/surveys',
      type: 'POST'
    }).done(function(response){
      $target = $(event.target);
      console.log($target);
      var $response = $(response);
      count ++;
      $response.children()[0].name = "question[" + count + "]";
      $response.insertBefore('#new_question_button');
    });
  });

  var count = 0
  $('#new_survey').on('click', '.new_option_button', function(event){
    $.ajax({
      url: '/options/new',
      type: 'GET'
    }).done(function(response){
      var $target = $(event.target);
      var $response = $(response);
      count ++;
      var $closestOption = $target.parents('.new_question').find('.new_option').last()
      $closestOption.children()[0].name = "option[" + count + "]";
      $response.insertBefore($closestOption);
    });
  });
});
