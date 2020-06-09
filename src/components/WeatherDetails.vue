<template>
  <div class='card text-white bg-secondary mb-3 weather-card'>
    <div class='card-header'>{{ data.query }} <sup>&deg; {{ data.country }}</sup></div>
    <div class='card-body'>
      <h3 class='card-title'>{{ data.weather.temperature }} <sup>&deg;C</sup></h3>
      <div class='icon'>
        <i :class=weatherIcon></i>
      </div>
      <h5 class='card-text mt-2'>{{ data.weather.summary }}</h5>
    </div>
  </div>
</template>

<script>
export default {
  name: 'WeatherDetails',
  data () {
    return {
      data: {
        query: 'Guwahati',
        country: 'IN',
        coordinates: {
          latitude: 123,
          longitude: 456
        },
        weather: {
          temperature: 36,
          summary: 'Overcast',
          icon: 'rain'
        }
      },
      error: {}
    }
  },
  computed: {
    weatherIcon: function () {
      const iconsMap = {
        'clear-day': 'wi wi-day-sunny',
        'clear-night': 'wi wi-night-clear',
        'rain': 'wi wi-day-rain',
        'snow': 'wi wi-day-snow',
        'sleet': 'wi wi-day-sleet',
        'wind': 'wi wi-day-windy',
        'fog': 'wi wi-day-fog',
        'cloudy': 'wi wi-cloudy',
        'partly-cloudy-day': 'wi wi-day-cloudy',
        'partly-cloudy-night': 'wi wi-night-cloudy'
      }

      const result = iconsMap[this.data.weather.icon] || 'wi wi-na'

      return result
    }
  },
  methods: {
    mapIcon: () => {

    }
  }
}
</script>

<style>
.weather-card {
  max-width: 400px;
  margin: 0 auto;
  text-align: center;
}

.icon img {
  width: 100px;
  height: 100px;
}
</style>
