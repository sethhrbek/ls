<template>
  <modal name="edit" height="auto" @before-close="closeModal" @before-open="loadLeague">
    <div v-if="league">
      <div class="w-full">
        <form
          class="bg-white rounded-lg px-12 py-10 border-borderLightGrey border"
          method="POST"
          @submit.prevent="updateLeague()"
        >
          <div class="text-center text-base font-bold pb-10">
            Edit League
          </div>

          <TextInput v-model="league.name" name="name">
            Name
          </TextInput>
          <TextInput v-model="league.latitude" name="latitude">
            Latitude
          </TextInput>
          <TextInput v-model="league.longitude" name="longitude">
            Longitude
          </TextInput>

          <SubmitInput value="Submit" class="mt-8"/>
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
      league: null
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
  methods: {
    closeModal() {
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
    async loadLeague() {
      this.$axios.get('api/leagues/' + this.leagueId)
        .then((res) => {
          this.league = res.data
        }).catch((err) => {
        console.log(err)
      })
    },
    leagueParams() {
      return {
        name: this.league.name,
        latitude: this.league.latitude,
        longitude: this.league.longitude
      }
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
