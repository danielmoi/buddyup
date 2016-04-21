var app = app || {};

app.MessageFormView = Backbone.View.extend({

  el: '#magic-form',

  render: function() {
    var messageFormViewTemplate = $('#messageFormViewTemplate').html();
    this.$el.html( messageFormViewTemplate );
  }
});
