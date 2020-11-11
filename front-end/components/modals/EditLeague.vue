<template>
  <modal name="edit" height="auto" @before-close="closeModal" @before-open="loadLeague">
    <div v-if="!loading">
      <div class="w-full border-lightGray border relative">
        <form
          class="bg-white rounded-lg px-12 py-10 "
          method="POST"
          @submit.prevent="submitLeague()"
        >
          <div class="text-center text-base font-bold pb-6">
            {{ leagueId ? 'Edit' : 'Create' }} League
          </div>

          <TextInput v-model="league.name" name="name">
            Name
          </TextInput>
          <TextInput v-model="league.price" name="price" type="number">
            Price
          </TextInput>
          <TextInput v-model="league.latitude" name="latitude">
            Latitude
          </TextInput>
          <TextInput v-model="league.longitude" name="longitude">
            Longitude
          </TextInput>

          <div class="text-red absolute text-center mt-24 right-0 left-0 absolute" v-if="error">
            Please enter all fields before submitting
          </div>

          <SubmitInput value="Submit" class="mt-8 pb-8"/>
        </form>
      </div>
    </div>
    <div @click="closeModal" class="close-button text-indigo cursor-pointer absolute">
      X
    </div>
  </modal>
</template>

<script>
import LeagueButton from "@/components/buttons/LeagueButton";

export default {
  components: {LeagueButton},
  data() {
    return {
      league: {
        name: null,
        latitude: null,
        longitude: null,
        price: null
      },
      loading: true,
      error: false,
    }
  },
  props: {
    showModal: {
      type: Boolean,
      default: false
    },
    leagueId: {
      type: Number,
      default: null
    }
  },
  mounted() {
    window.addEventListener('keydown', (e) => {
      this.error = false
    });
  },
  methods: {
    closeModal() {
      this.error = false
      this.$nuxt.$emit('closeModal', false)
    },
    async updateLeague() {
      this.$axios.put('/api/leagues/' + this.leagueId, this.leagueParams())
        .then((res) => {
          console.log(res)
          this.$nuxt.$emit('leagueUpdated', res.data)
        }).catch((err) => {
        console.log(err)
      })
    },
    async createLeague() {
      this.$axios.post('/api/leagues/', this.leagueParams())
        .then((res) => {
          this.$nuxt.$emit('leagueCreated', res.data)
        }).catch((err) => {
        console.log(err)
      })
    },
    async submitLeague() {
      if(this.leagueIsValid()) {
        this.error = false
        this.leagueId ? await this.updateLeague() : await this.createLeague()
      } else {
        this.error = true
      }
    },
    async loadLeague() {
      if (this.leagueId) {
        this.$axios.get('api/leagues/' + this.leagueId)
          .then((res) => {
            this.league = res.data
          }).catch((err) => {
          console.log(err)
        })
      } else {
        this.league = this.resetLeague()
      }

      this.loading = false
    },
    leagueParams() {
      return {
        name: this.league.name,
        latitude: this.league.latitude,
        longitude: this.league.longitude,
        price: this.league.price
      }
    },
    resetLeague() {
      return {
        name: null,
        latitude: null,
        longitude: null
      }
    },
    leagueIsValid() {
      return !Object.values(this.league).some(l => (l === null || l === ""))
    }
  },
  watch: {
    showModal: {
      handler(newVal) {
        newVal ? this.$modal.show('edit') : this.$modal.hide('edit')
      }
    }
  },
}
</script>

<style scoped>
.close-button {
  right: 10px;
  top: 10px;
}
</style>
