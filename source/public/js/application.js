$(document).ready(function() {
  var count = 0
  $("#new_survey").on('click', '#new_question_button', function(event){
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

  // $(".new_question").on('click', function(event){
  //   // console.log('you clicked it');
  //   $.ajax({
  //     url: '/options/new',
  //     type: 'GET'
  //   }).done(function(response){
  //     var $target = $(event.target);
  //     // console.log('hi');
  //     //add response to new_question div that contained the target
  //     var $closestQuestion = $target.closest('.new_question');
  //     $closestQuestion.append('hi');
  //     // $closestQuestion.append(response);
  //     // var $closestOptionButton =
  //     // $closestQuestion.before('.new_option_button', response);
  //   });
  // });
});
