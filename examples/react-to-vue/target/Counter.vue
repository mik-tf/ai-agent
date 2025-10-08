<!-- This is where the Vue version would go after conversion -->
<!-- The AI agent would create this file based on the React source -->
<template>
  <div class="counter">
    <h2>Counter: {{ count }}</h2>
    <div class="buttons">
      <button @click="increment">+</button>
      <button @click="decrement">-</button>
      <button @click="reset">Reset</button>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  name: 'Counter',
  setup() {
    const count = ref(0);

    const increment = () => {
      count.value++;
    };

    const decrement = () => {
      count.value--;
    };

    const reset = () => {
      count.value = 0;
    };

    return {
      count,
      increment,
      decrement,
      reset
    };
  }
};
</script>

<style scoped>
.counter {
  /* Add your styles here */
}
</style>