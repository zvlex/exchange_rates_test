<template lang="jade">
  div.jumbotron
    table.table.table-striped
      thead
        tr
          td= 'From: EUR'
          td= 'openexchangerates.org'
          td= 'appspot.com'
          td= 'ecb.int'
      tbody
        tr
          td
            select( v-model='currencyName' )
              option( v-for="currency in currencies" )
                {{ currency }}
          td
            open-exchange-rates
          td
            app-spot
          td
            ecb
</template>

<script>
  import AppSpot from './AppSpot.vue'
  import Ecb from './Ecb.vue'
  import OpenExchangeRates from './OpenExchangeRates.vue'

  export default {
    components: {
      OpenExchangeRates,
      AppSpot,
      Ecb
    },

    data() {
      return {
        currencyName: undefined,
        currencies: ['AUD', 'USD', 'NOK', 'RUB']
      }
    },

    watch: {
      currencyName: function(value) {
        this.$broadcast('signal:getCurrency', value)
      }
    }
  }
</script>
