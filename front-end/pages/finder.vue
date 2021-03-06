<template>
  <div
    class="bg-grey-light px-6 pt-32 max-w-3xl flex flex-col justify-center mx-auto font-sans leading-normal tracking-normal">
    <loading :active="loading"/>
    <div class="flex justify-between items-center">
      <h1 class="text-xl py-10">LEAGUE FINDER</h1>
      <div v-if="results" @click="resetForm()" class="button button-light">NEW SEARCH</div>
    </div>
    <div v-if="!results" class="w-full border-lightGray border relative">
      <form
        class="bg-white rounded-lg px-12 py-10 "
        method="POST"
        @submit.prevent="submitSearch()"
      >
        <div class="text-center text-base font-bold pb-6">
          Enter a budget, latitude and longitude below.
        </div>
        <div class="flex">
          <TextInput v-model="finder.budget" name="budget" class="w-1/2">
            Budget
          </TextInput>
          <div class="px-2"></div>
          <TextInput v-model="finder.radius" type="number" name="radius" class="w-1/2">
            Radius
          </TextInput>
        </div>
        <div class="flex mt-4">
          <TextInput v-model="finder.latitude" name="latitude" class="w-1/2">
            Latitude
          </TextInput>
          <div class="px-2"></div>
          <TextInput v-model="finder.longitude" name="longitude" class="w-1/2">
            Longitude
          </TextInput>
        </div>

        <div class="text-red absolute text-center mt-24 right-0 left-0 absolute" v-if="error">
          Please enter all fields before submitting
        </div>

        <SubmitInput value="Submit" class="mt-8 pb-8"/>
      </form>
    </div>
    <div v-if="results">
      <div class="w-full flex flex-col border-lightGray border relative">
        <h1 class="text-base p-4">Nearby leagues within radius of {{ finder.radius }} miles and budget of {{ format_currency(finder.budget) }}:</h1>
        <div class="flex w-full p-4 border border-lightGray justify-between" v-for="league in results">
          <div class="font-bold">{{ league.name }}</div>
          <div class="ml-8">{{ format_currency(league.price) }}</div>
        </div>
        <div v-if="results.length" class="flex w-full p-4 border border-lightGray justify-between">
          <div class="font-bold">Total</div>
          <div class="ml-8">{{ format_currency(resultsTotal(results)) }}</div>
        </div>
        <div v-else class="flex w-full p-4 border border-lightGray justify-between">
          There were no leagues that matched your search
        </div>
      </div>
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
      finder: {
        budget: null,
        radius: null,
        latitude: null,
        longitude: null
      },
      results: null,
      error: null,
      loading: false,
      showResults: false
    }
  },
  methods: {
    submitSearch() {
      if (this.finderIsValid()) {
        this.loading = true
        this.$axios.post('/api/league-finder', this.finderParams())
          .then((res) => {
            this.results = res.data
          }).catch((err) => {
          console.log(err)
        })
        this.loading = false
      } else {
        this.error = true
      }
    },
    resultsTotal(leagues) {
      if (leagues.length) {
        return leagues.map(league => league.price).reduce((prev, next) => prev + next);
      }
    },
    resetForm() {
      this.results = null
    },
    finderIsValid() {
      return !Object.values(this.finder).some(l => (l === null || l === ""))
    },
    finderParams() {
      return {
        budget: this.finder.budget,
        radius: this.finder.radius,
        latitude: this.finder.latitude,
        longitude: this.finder.longitude
      }
    }
  }
}
</script>
