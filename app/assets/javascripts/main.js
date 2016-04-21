var app = app || {};

$(document).ready(function() {

  // Backbone
  app.messages = new app.Messages();
  app.messages.fetch();

  window.setInterval(function() {
    app.messages.fetch();
  }, 4000);

  app.router = new app.AppRouter();
  Backbone.history.start();





  // Rest of App
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

    $(this).parent().parent().find('.subgoal-checkbox__display').hide();
    $(this).parent().parent().find('.subgoal-checkbox__input').show();

  });

  // When "save" button for subgoal is clicked
  $('.subgoal-save__link').on('click', function(event) {
    // event.preventDefault();
    $(this).hide();
    $(this).siblings('.subgoal-edit__link').show();

    $(this).parent().parent().find('.subgoal-title__input').hide();
    var newText = $(this).parent().parent().find('.subgoal-title__input').val();
    $(this).parent().parent().find('.subgoal-title__text').text(newText).show();

    $(this).parent().parent().find('.subgoal-checkbox__input').hide();

    var newCompleted = $(this).parent().parent().find('.subgoal-checkbox__input').is(':checked');

    console.log(newCompleted);
    $(this).parent().parent().find('.subgoal-checkbox__display').prop('checked', newCompleted);
    $(this).parent().parent().find('.subgoal-checkbox__display').show();

  });

  // Toggle Subgoals Section
  $('.subgoals__toggle').on('click', function() {
    $('#subgoals-list').toggle();
    $('.subgoals__toggle-icon').toggleClass('fa-arrow-down');
  });

  // Toggle Messages Section
  $('.messages__toggle').on('click', function() {
    $('#magic-messages').toggle();
    $('.messages__toggle-icon').toggleClass('fa-arrow-down');
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


$('.goal-achieved__btn').on('click', function(e) {
  e.preventDefault();
  goal_id = window.location.href.split("/").pop()
  $.ajax({
    url: goal_id+"/achieved",
    type: "POST",
    data: {id : goal_id},
    success: function() {
      $('.goal-show__goal-status').text("Status: Congratulations, you've achieved your goal");
      $('.goal-achieved__btn').hide;
    }
  });

});


//   $('#cat').on('click', function(e){
//     $(event.preventDefault());
//
//     if($('#cat').data('cat-id') === $('#goal_cat').data('goal_cat_id')){
//       console.log("yippee!");
//       $('#categories-list').append('cat_id');
//
//     // console.log($('cat').data('cat_id'));
// }
// $(event.preventDefault());
//
//   });

});
