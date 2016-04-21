var app = app || {};

app.Messages = Backbone.Collection.extend({
  // url: '/goals/:id/messages',
  url: function() {
    // return this.document.url() + '/messages';
    return document.location.pathname + '/messages';
  },

  model: app.Message,

  initialize: function() {
    this.on('add', function(message) {
      // console.log('Add event triggered in Collection');
      var messageView = new app.MessageView({ model: message });
      messageView.render();
    });

  }
});
