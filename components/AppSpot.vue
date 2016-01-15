<template lang="jade">
    span {{ result }}
</template>

<script>
  export default {

    data() {
      return {
        result: 0,
        targetTo: undefined,

        api: {
          source: 'appspot',
          url: 'http://currency-api.appspot.com/api/',
          default_from: 'EUR',
          format: 'json',
        }
      }
    },

    computed: {
      fullUrl: function() {
        return this.api.url + this.api.default_from + '/' + this.targetTo + '.' + this.api.format;
      }
    },

    events: {
      'signal:getCurrency': function(currency) {
        var self = this;

        this.$set('targetTo', currency);

        this.$http.get('/exchange_rates', { url: this.fullUrl, source: this.api.source }).then(function(response) {
          var data = JSON.parse(response.data);

          Vue.nextTick(function() {
            self.$set('result', data.rate);
          })

        }, function(response) {
          console.log(response);
        })
      }
    }
  }
</script>
