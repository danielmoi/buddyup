var app = app || {};

app.MessageView = Backbone.View.extend({
  tagName: 'div',
  className: 'message-each__container',

  render: function() {
    var subject = this.model.get('subject');
    var content = this.model.get('content');
    var timestamp = this.model.get('created_at');

    $p = $('<p>');
    $p.text( "Subject: " + subject );
    $p.addClass('message-each__subject');
    $p.appendTo(this.$el);

    $p = $('<p>');
    $p.text( "Content: " + content );
    $p.addClass('message-each__content');
    $p.appendTo(this.$el);

    $p = $('<p>');
    $p.text( "Sent: " + timestamp );
    $p.addClass('message-each__timestamp');
    $p.appendTo(this.$el);

    this.$el.prependTo('#magic-messages');
  }
});
