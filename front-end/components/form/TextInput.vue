<template>
  <label class="block text-sm my-3">
    <slot /> <span v-show="required" class="text-requiredBlue inline-block">*</span>
    <input
      class="w-full appearance-none text-darkGray text-base font-normal border-borderLightGrey border h-12 rounded mt-2 py-1 px-4 tracking-wide focus:outline-none focus:shadow-outline placeholder-placeholderGray"
      :type="type"
      :name="name"
      :value="value"
      :placeholder="placeholder"
      @input="$emit('input', $event.target.value)"
    >
  </label>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      default: ''
    },
    value: {
      type: [String, Number],
      default: ''
    },
    placeholder: {
      type: String,
      default: ''
    },
    type: {
      type: String,
      default: 'text'
    },
    required: {
      type: String,
      default: ''
    }
  }
}
</script>
