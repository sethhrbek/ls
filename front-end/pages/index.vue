<template>
  <div
    class="bg-grey-light pt-32 px-6 max-w-3xl flex flex-col justify-center mx-auto font-sans leading-normal tracking-normal">
    <loading :active="loading" />
    <div class="flex justify-between items-center">
      <h1 class="text-xl py-10">LEAGUES</h1>
      <div @click="showCreateLeagueModal()" class="button button-light">CREATE LEAGUE</div>
    </div>
    <div class="text-base">
      <table class="w-full border border-lightGray">
        <thead class="text-left">
        <th>Name</th>
        <th>Sponsorship Price</th>
        <th class="hidden md:table-cell">Lat</th>
        <th class="hidden md:table-cell">Long</th>
        <th>Actions</th>
        </thead>
        <tbody is="transition-group" name="fade">
          <tr class="p-8 border border-lightGray" v-for="league in leagues" :key="league.id">
            <td>{{ league.name }}</td>
            <td>{{ format_currency(league.price) }}</td>
            <td class="hidden md:table-cell">{{ league.latitude }}</td>
            <td class="hidden md:table-cell">{{ league.longitude }}</td>
            <td>
              <div class="flex">
                <div class="button" @click="showEditLeagueModal(league.id)">Edit</div>
                <div class="button button-red ml-3" @click="deleteLeague(league.id)">Del</div>
              </div>
            </td>
          </tr>
        </tbody>
        <edit-league :show-modal="showModal" :league-id="leagueId"/>
      </table>
    </div>
  </div>
</template>

<script>
import currency from '~/mixins/currency.js'
import Loading from 'vue-loading-overlay'
import 'vue-loading-overlay/dist/vue-loading.css'

export default {
  mixins: [currency],
  components: { Loading },
  data() {
    return {
      leagues: [],
      loading: true,
      showModal: false,
      leagueId: null
    }
  },
  methods: {
    showEditLeagueModal(id) {
      this.leagueId = id
      this.showModal = true
    },
    showCreateLeagueModal() {
      this.leagueId = null
      this.showModal = true
    },
    async deleteLeague(id) {
      this.$axios.delete('api/leagues/' + id)
        .then((res) => {
          let index = this.leagues.findIndex(l => l.id === id)
          this.leagues.splice(index, 1)
        }).catch((err) => {
        console.log(err)
      })
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
    await this.loadLeagues()
    this.loading = false
  }
}
</script>

<style scoped>
th, td {
  @apply py-3 px-6
}
</style>
