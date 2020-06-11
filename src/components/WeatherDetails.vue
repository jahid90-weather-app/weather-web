<template>
  <div>
    <div v-if='error'>
      <h4> An error occurred while fetching the data.</h4>
      <p class='error'>{{ error }}</p>
    </div>

    <div v-if='loading' class='card text-white bg-secondary mb-3 weather-card loading'>
      <div class='card-header'></div>
      <div v-if='loading' class='spinner-border text-light spinner' role='status'>
        <span class='sr-only'>Loading...</span>
      </div>
    </div>

    <div v-if='data' class='card text-white bg-secondary mb-3 weather-card'>
      <div class='card-header'><strong>{{ data.query }} <sup>{{ data.country }}</sup></strong></div>
      <div v-if='data' class='card-body'>
        <h3 class='card-title'>{{ data.weather.temperature }}<sup>&deg;C</sup></h3>
        <div class='icon'>
          <i :class=weatherIcon></i>
        </div>
        <div class='card-text mt-2'><strong>{{ data.weather.summary }}</strong></div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'WeatherDetails',
  mounted () {
    this.$root.$on('weather:location:change', (data) => {
      this.handleLocationChange(data.location)
    })
  },
  data () {
    return {
      data: undefined,
      error: undefined,
      loading: false
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

      const result = (this.data && this.data.weather && this.data.weather && iconsMap[this.data.weather.icon]) ||
          'wi wi-na'

      return result
    }
  },
  methods: {
    async handleLocationChange (location) {
      try {
        this.loading = true
        this.data = undefined
        this.error = undefined

        // This code will run from the browser. The browser cannot access the docker network hostname: weather-service.
        // So it has to be accessed via localhost.
        const serviceEndpoint = process.env.SERVICE_ENDPOINT || 'http://localhost:3000/weather'
        const response = await axios.get(serviceEndpoint, {
          params: {
            location
          }
        })

        if (response.data.error) {
          console.error('Error:', response.data.error)
          this.error = response.data.error
        } else {
          this.data = response.data.data
        }

        this.loading = false
      } catch (error) {
        console.error('Error:', error)
        this.error = error

        this.loading = false
      }
    }
  }
}
</script>

<style>
.weather-card {
  max-width: 300px;
  margin: 0 auto;
  text-align: center;
}

.icon img {
  width: 100px;
  height: 100px;
}

.error {
  color: firebrick
}

.loading {
  height: 190px;
}

.loading .card-header {
  height: 50px;
}

.spinner {
  margin: auto auto;
}
</style>
