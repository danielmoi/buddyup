var app = app || {};

app.AppView = Backbone.View.extend({
  el: '#backbone-container',
  render: function() {
    console.log('inside AppView');
    var appViewTemplate = $('#appViewTemplate').html();
    this.$el.html( appViewTemplate );
  }
});
