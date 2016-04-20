var app = app || {};

app.AppRouter = Backbone.Router.extend({
  routes: {
    '': 'index'
  },
  index: function() {
    console.log('YESSSSS');
    var appView = new app.AppView();
    appView.render();
  },
  messageMagic: function() {
    console.log('WHAT');
  }
});
