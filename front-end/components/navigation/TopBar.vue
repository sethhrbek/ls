<template>
  <nav class="flex items-center justify-between flex-wrap bg-indigo p-6 fixed w-full z-10 pin-t">
    <div class="flex items-center text-white mr-6">
      <span class="text-2xl pl-2"><nuxt-link to="/"><img :src="logo" width="150" /></nuxt-link></span>
    </div>

    <div
      class="flex items-center w-auto pt-0"
      id="nav-content">
      <ul class="list-reset flex justify-end flex-1 items-center">
        <li class="mr-3">
          <nuxt-link class="inline-block py-2 px-4 text-white no-underline" to="/">Leagues</nuxt-link>
        </li>
        <li class="mr-3">
          <nuxt-link class="inline-block text-white no-underline hover:text-grey-lighter py-2 px-4"
             to="/finder">Find Leagues</nuxt-link>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  computed: {
    logo () {
      return require('~/assets/images/logo.png')
    }
  }
}
</script>
