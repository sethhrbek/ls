<template>
  <nav class="flex items-center justify-between flex-wrap bg-indigo p-6 fixed w-full z-10 pin-t">
    <div class="flex items-center flex-no-shrink text-white mr-6">
      <span class="text-2xl pl-2"><img :src="logo" width="150" /></span>
    </div>

    <div class="block lg:hidden">
      <button @click.stop="toggleMenu()"
              id="nav-toggle"
              class="flex items-center px-3 py-2 border rounded text-white border-white hover:border-white">
        <svg class="fill-current h-3 w-3" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Menu</title>
          <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/>
        </svg>
      </button>
    </div>

    <div
      v-if="!menuToggled"
      class="w-full flex-grow lg:flex lg:items-center lg:w-auto lg:block pt-6 lg:pt-0"
      id="nav-content">
      <ul class="list-reset lg:flex justify-end flex-1 items-center">
        <li class="mr-3">
          <a class="inline-block py-2 px-4 text-white no-underline" href="#">Leagues</a>
        </li>
        <li class="mr-3">
          <a class="inline-block text-white no-underline hover:text-grey-lighter py-2 px-4"
             href="#">Find Leagues</a>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      menuToggled: false
    }
  },
  methods: {
    toggleMenu() {
      this.menuToggled = ! this.menuToggled
    }
  },
  computed: {
    logo () {
      return require('~/assets/images/logo.png')
    }
  }
}
</script>
