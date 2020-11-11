<template>
  <div class="bg-grey-light font-sans leading-normal tracking-normal">
    <TopBar />
    <Nuxt />
  </div>
</template>

<script>
import TopBar from "~/components/navigation/TopBar";
export default {
  components: {TopBar}
}
</script>

<style>
.button {
  @apply inline-block bg-blue text-xs text-white text-center uppercase font-bold py-1 px-3 rounded-xl cursor-pointer;
}

.button-light {
  @apply bg-hoverBlue text-base py-2 px-6;
}

.button-red {
  @apply bg-red;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
