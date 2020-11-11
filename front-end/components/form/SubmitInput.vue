<template>
  <div class="w-full justify-center">
    <input :value="value" type="submit" class="w-full cursor-pointer transition duration-200 ease-in-out hover:bg-hoverBlue bg-blue text-white text-center uppercase font-bold py-3 px-16 rounded">
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
      default: 'SUBMIT'
    }
  }
}
</script>
