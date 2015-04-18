$(document).ready(function() {
  // $('#new_question_button').on('click', function(e){
  //  ("<input type='text' name='" + name + "' placeholder='question'>");
  // });
  var count = 0
  $("#new_question_button").on('click', function(){
    $.ajax({
      url: '/surveys',
      type: 'POST'
    }).done(function(response){
      var $response = $(response);
      count ++;
      $response.children()[0].name = "question[" + count + "]";
      $('.new_question').last().append($response)
      // console.log(response)
    });
  });

  $("#new_survey").on('click', '#new_option_button', function(event){
    // console.log($(event.target));
    $.ajax({
      url: '/options/new',
      type: 'GET'
    }).done(function(response){
      // console.log(response);
      var $closestQuestion = $('.new_option').closest('.new_question').last();
      $closestQuestion.append(response);
    });
  });
});
