<template>
  <form class='mt-4'>
    <div class="form-group">
      <h4>
        <label for="search-field">Enter a location below to look up its weather.</label>
      </h4>
      <div class='weather-search-field'>
        <input type="text" class="form-control" id="search-field"
              aria-describedby="search-field" placeholder="Location...">
        <div class='weather-search-button'>
          <button type="submit" class="btn btn-dark">Submit</button>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  name: 'WeatherForm'
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
