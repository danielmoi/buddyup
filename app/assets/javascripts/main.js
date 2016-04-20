$(document).ready(function() {
  $('.subgoal-title__input').hide();

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

  // Add newly created subgoals
  $('#new_subgoal').on('ajax:success', function (something, response) {
    $('#subgoals-list').prepend(response);
  });

  // Hide deleted subgoals
  $('.subgoal-delete__container').on('ajax:success', function(something, response) {
    $(this).parent().hide();
  });

  // When "edit" button for subgoal is clicked
  $('.subgoal-edit__link').on('click', function(event) {
    event.preventDefault();
    $(this).hide();
    $(this).siblings('.subgoal-save__link').show();

    $(this).parent().parent().find('.subgoal-title__text').hide();
    $(this).parent().parent().find('.subgoal-title__input').show();
  });

  // When "save" button for subgoal is clicked
  $('.subgoal-save__link').on('click', function(event) {
    event.preventDefault();
    $(this).hide();
    $(this).siblings('.subgoal-edit__link').show();

    $(this).parent().parent().find('.subgoal-title__input').hide();
    $(this).parent().parent().find('.subgoal-title__text').show();

  });


});
