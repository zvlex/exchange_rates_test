<template lang="jade">
  span {{ result }}
</template>

<script>
  export default {
    data() {
      return {
        result: 0,

        api: {
          source: 'open_exchange_rates',
          token: 'ebe2d1027c5141d6b89d12f2cb23d23a',
          url: 'https://openexchangerates.org/api/latest.json?app_id='
        }
      }
    },

    computed: {
      fullUrl: function() {
        return this.api.url + this.api.token
      }
    },

    events: {
      'signal:getCurrency': function(currency) {
        var self = this;

        this.$http.get('/exchange_rates', { url: this.fullUrl, source: this.api.source }).then(function(response) {
          var data = JSON.parse(response.data);

          var result = self.calculateEUR(data.rates[currency], data.rates.EUR);

          Vue.nextTick(function() {
            self.$set('result', result);
          })

        }, function(response) {
          console.log(response)
        })
      }
    },

    methods: {
      calculateEUR: function(currency, eur) {
        return Number(currency * (1 / parseFloat(eur))).toFixed(4)
      }
    }
  }
</script>
