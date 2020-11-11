<template>
  <nav class="flex items-center justify-between flex-wrap bg-indigo p-6 fixed w-full z-10 pin-t">
    <div class="flex items-center flex-no-shrink text-white mr-6">
      <span class="text-2xl pl-2"><img :src="logo" width="150" /></span>
    </div>

    <div
      class="w-full flex-grow lg:flex lg:items-center lg:w-auto lg:block pt-6 lg:pt-0"
      id="nav-content">
      <ul class="list-reset lg:flex justify-end flex-1 items-center">
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
