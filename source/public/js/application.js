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

  var option_counter = 0
  $('#new_survey').on('click', '.new_option_button', function(event){
    $.ajax({
      url: '/options/new',
      type: 'GET'
    }).done(function(response){
      var $target = $(event.target);
      var $response = $(response);
      option_counter ++;
      var $closestOptionWrapper = $target.parents('.new_question').find('.new_option_wrapper')
      var $closestQuestionNameStr = $target.parents('.new_question').children()[0].name
      $response[0].name = $closestQuestionNameStr + "[" + option_counter + "]";
      $closestOptionWrapper.append($response);
    //   $response.insertBefore($closestOption);
    });
  });
});
