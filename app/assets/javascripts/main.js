$(document).ready(function() {

  $('.menu-toggle__container').on('click', function(e) {
    console.log('click');
    $('.nav__container').toggle();
    $('.fa-caret-down').toggleClass('fa-caret-up');
  });

  $('.goal-each__more-info').on('click', function(e) {
    console.log($(this).parent().parent());
    e.preventDefault();
    $(this).parent().parent().find('.goal-each__initiator-country').toggle();
    $(this).parent().parent().find('.goal-each__goal-description').toggle();
  });



  $('.btn__buddy-up--before').on('click', function(e) {
    e.preventDefault();
    console.log('clicked');
    $('.modal__container').show();
    $('.modal-goal').text($(this).attr('goal'));
    $('.modal-initiator').text($(this).attr('initiator'));
    $('.btn__buddy-up--confirm').attr({
      href: "/goals/" + $(this).attr('goal_id') + "/buddyup"
    });
  });

  $('#new_subgoal').on('ajax:success', function (something, response) {
    $('#subgoals-list').prepend(response);
  });

  $('#amount').on('click', function(e){
    console.log("hello from function");
    if (parseInt($('#goal_amount').val()) < 50){
      console.log("hello from if");
      $(event.preventDefault());
      $('.modal__container').show();
      $('.btn__buddy-up--confirm');
    }
  });


  // $('#amount').on('click', function(e){
  //   console.log("hello from function");
  //   if (parseInt($('#goal_amount').val()) < 50){
  //     console.log("hello from if");
  //   $(alert("Please pledge a minimum of $50"));
  //   $(event.preventDefault());
  // }
  // });

});
