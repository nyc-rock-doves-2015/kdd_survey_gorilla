$(document).ready(function() {
  // $('#new_question_button').on('click', function(e){
  //  ("<input type='text' name='" + name + "' placeholder='question'>");
  // });
  var count = 0

    $("#new_question_button").on('click', function(event){
    var $event = $(event.target);
    $.ajax({
      url: '/surveys',
      type: 'POST'
    }).done(function(response){
      var $response = $(response);
      count ++;
      $response.children()[0].name = "question[" + count + "]";
       $('.new_question').last().append($response)
      // console.log(response)
    })
  })
});
