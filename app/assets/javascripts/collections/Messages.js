var app = app || {};

app.Messages = Backbone.Collection.extend({
  // url: '/goals/:id/messages',
  url: function() {
    // return this.document.url() + '/messages';
    return document.location.pathname + 'messages';
  },

  model: app.Message,

  initialize: function() {
    this.on('add', function(message) {
      var messageView = new app.MessageView({ model: message });
      messageView.render();
    });

  }
});
