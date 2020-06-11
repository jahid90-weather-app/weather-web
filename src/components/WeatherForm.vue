<template>
  <form class='mt-4' @submit.prevent='onSubmit'>
    <div class="form-group">
      <h6>
        <label for='search-field'>Enter a location below to look up its weather.</label>
      </h6>
      <div class='weather-search-field'>
        <input type='text' class='form-control' id='search-field'
            aria-describedby='search-field' placeholder='Location...'
            v-model='location' autofocus>
        <div class='weather-search-button'>
          <button type='submit' class='btn btn-secondary'>Submit</button>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  name: 'WeatherForm',
  data () {
    return {
      location: ''
    }
  },
  methods: {
    onSubmit () {
      if (this.location === undefined || this.location === '') {
        return
      }

      this.$root.$emit('weather:location:change', { location: this.location })
      this.location = ''
    }
  }
}
</script>

<style>
.weather-search-field {
  position: relative;
}

.weather-search-field input {
  padding-right: 150px;
  border-radius: 30px;
}

.weather-search-button {
  position: absolute;
  display: inline-block;
  right: 0px;
  top: 0px;
}

.weather-search-button button {
  border-radius: 20px;
}
</style>
