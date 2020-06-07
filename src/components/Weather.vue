<template>
  <div class="weather">
    <h1>{{hello}}</h1>
    <p>This is where the weather information will be displayed.</p>
  </div>
</template>

<script>
// import axios from 'axios'
export default {
  name: 'Weather',
  data() {
    return {
      hello: 'Hello!'
    }
  }
}
</script>

<style>
</style>
