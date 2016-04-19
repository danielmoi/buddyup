$(document).ready(function() {

  $('.header-hamburger__container').on('click', function(e) {
    console.log('click');
    $('.nav__container').toggle();
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



});
