export default {
  methods: {
    format_currency(amount) {
      return '$' + (amount / 1).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
    }
  }
}
