var app = app || {};

app.MessageView = Backbone.View.extend({
  tagName: 'div',

  render: function() {
    var subject = this.model.get('subject');
    console.log('SDFLKJ');
    this.$el.text( subject );
    this.$el.prependTo('#magic-messages');
  }
});
