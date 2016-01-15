window.Vue = require('vue')
Vue.use(require('vue-resource'));

var App = require('./components/App.vue')

new Vue({
  el: 'body',

  components: {
    app: App
  }
})
