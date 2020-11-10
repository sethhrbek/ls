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
