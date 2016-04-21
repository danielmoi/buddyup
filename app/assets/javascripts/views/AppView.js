var app = app || {};

app.AppView = Backbone.View.extend({

  el: '#backbone-container',

  render: function() {
    var appViewTemplate = $('#appViewTemplate').html();
    this.$el.html( appViewTemplate );

    var messageFormView = new app.MessageFormView();
    messageFormView.render();

  }
});
