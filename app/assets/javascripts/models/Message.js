var app = app || {};

app.Message = Backbone.Model.extend({

  url: function() {
    // return this.document.url() + '/messages';
    return document.location.pathname + '/messages';
  }

});
