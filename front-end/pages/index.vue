<template>
  <div
    class="bg-grey-light pt-32 max-w-3xl flex flex-col justify-center mx-auto font-sans leading-normal tracking-normal">
    <div class="flex justify-between items-center">
      <h1 class="text-xl py-10">LEAGUES</h1>
      <div @click="showCreateLeagueModal()" class="button button-light">CREATE LEAGUE</div>
    </div>
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
          <td>
            <div class="button" @click="showEditLeagueModal(league.id)">Edit</div>
          </td>
        </tr>
        <edit-league :show-modal="showModal" :league-id="leagueId"/>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      leagues: [],
      loading: true,
      showModal: false,
      leagueId: null
    }
  },
  methods: {
    format_currency(amount) {
      return '$' + (amount / 1).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
    },
    showEditLeagueModal(id) {
      this.leagueId = id
      this.showModal = true
    },
    showCreateLeagueModal() {
      this.leagueId = null
      this.showModal = true
    },
    async loadLeagues() {
      this.$axios.get('api/leagues')
        .then((res) => {
          this.leagues = res.data
        }).catch((err) => {
        console.log(err)
      })
    }
  },
  created() {
    this.$nuxt.$on('closeModal', () => {
      this.showModal = false
    })

    this.$nuxt.$on('leagueUpdated', (league) => {
      let index = this.leagues.findIndex(l => l.id === league.id)
      this.leagues[index] = league
      this.showModal = false
    })

    this.$nuxt.$on('leagueCreated', (league) => {
      this.leagues.push(league)
      this.showModal = false
    })
  },
  async mounted() {
    this.loadLeagues()
  }
}
</script>

<style scoped>
th, td {
  @apply py-3 px-6
}
</style>

<style>
.button {
  @apply inline-block bg-blue text-sm text-white text-center uppercase font-bold py-2 px-6 rounded cursor-pointer;
}

.button-light {
  @apply bg-hoverBlue text-base;
}
</style>
