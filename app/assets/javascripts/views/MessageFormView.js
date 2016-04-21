var app = app || {};

app.MessageFormView = Backbone.View.extend({

  el: '#magic-form',

  events: {
    'click button': 'createMessage'
  },

  render: function() {
    var messageFormViewTemplate = $('#messageFormViewTemplate').html();
    this.$el.html( messageFormViewTemplate );
  },

  createMessage: function() {
    var message = new app.Message();
    var messageSubject = this.$el.find('.message-new-subject').val();
    var messageContent = this.$el.find('.message-new-content').val();

    message.set({
      subject: messageSubject,
      content: messageContent
    });

    message.save().done(function() {
      console.log('Finished save');
      // using fetch (instead of add) because 'add' isn't triggered with 'add' (??!)
      app.messages.fetch();
    });


    this.$el.find('.message-new-subject').val('');
    this.$el.find('.message-new-content').val('');


  }
});
