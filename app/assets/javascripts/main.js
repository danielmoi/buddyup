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

  $('.amount').on('click', function(n){
    
  });


});
