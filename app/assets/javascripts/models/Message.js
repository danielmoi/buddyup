var app = app || {};

app.Message = Backbone.Model.extend({
  urlRoot: '/goals/:id/messages'
});
