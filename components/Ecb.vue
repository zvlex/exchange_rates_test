<template lang="jade">
    span {{ result }}
</template>

<script>
  export default {
    data() {
      return {
        result: 0,

        api: {
          source: 'ecb',
          url: 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml'
        }
      }
    },

    events: {
      'signal:getCurrency': function(currency) {
        var self = this;

        this.$http.get('/exchange_rates', { url: this.api.url, source: this.api.source }).then(function(response) {
          
          Vue.nextTick(function() {
            self.$set('result', response.data[currency])
          })

        }, function(response) {
          console.log(response)
        })
      }
    }
  }
</script>
