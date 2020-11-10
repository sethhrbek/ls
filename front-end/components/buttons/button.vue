<template>
  <div class="mt-8">
    <NuxtLink :to="to">
      <div
        class="transition duration-200 ease-in-out hover:bg-hoverBlue inline-block bg-blue text-white text-center uppercase font-bold py-3 px-16 rounded"
      >
        <slot />
      </div>
    </NuxtLink>
  </div>
</template>

<script>
export default {
  props: {
    to: {
      type: String,
      default: ''
    }
  }
}
</script>
