<template>
  <div class="weather">
    <WeatherForm/>
    <hr />
    <WeatherDetails/>
  </div>
</template>

<script>
import WeatherDetails from './WeatherDetails'
import WeatherForm from './WeatherForm'

export default {
  name: 'Weather',
  components: {
    WeatherDetails,
    WeatherForm
  }
}
</script>

<style>
</style>
