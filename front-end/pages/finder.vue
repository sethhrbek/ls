<template>
  <div class="bg-grey-light pt-10 max-w-3xl flex justify-center mx-auto font-sans leading-normal tracking-normal">
    <h1>LEAGUE FINDER</h1>
    <div class="text-2xl">
      <div class="p-8 league-row flex border border-gray-100" v-for="league in foundLeagues" :key="league.id">
        <div>{{ league.name }}</div>
        <div>{{ league.latitude }}</div>
        <div>{{ league.longitude }}</div>
        <div>{{ league.price }}</div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {

  }
</script>
