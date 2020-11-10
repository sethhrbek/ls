<template>
  <div class="bg-grey-light pt-32 max-w-3xl flex flex-col justify-center mx-auto font-sans leading-normal tracking-normal">
    <h1 class="text-xl py-10">LEAGUES</h1>
    <div class="text-base">
      <table class="w-full border border-lightGray">
        <thead class="text-left">
          <th>Name</th>
          <th>Sponsorship Price</th>
          <th>Latitude</th>
          <th>Longitude</th>
          <th>Actions</th>
        </thead>
        <tr class="p-8 border border-lightGray" v-for="league in leagues" :key="league.id">
          <td>{{ league.name }}</td>
          <td>{{ format_currency(league.price) }}</td>
          <td>{{ league.latitude }}</td>
          <td>{{ league.longitude }}</td>
          <td><button>Edit</button></td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      leagues: [],
      loading: true
    }
  },
  methods: {
    format_currency(amount) {
      return '$' + (amount / 1).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
    }
  },
  async mounted() {
    this.$axios.get('api/leagues')
      .then((res) => {
        this.leagues = res.data
      }).catch((err) => {
      console.log(err)
    })
    // this.leagues = leagues
  }
}
</script>

<style scoped>
th, td {
  @apply py-3 px-6
}
</style>
