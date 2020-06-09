<template>
  <nav class='navbar navbar-dark bg-dark'>
    <a class="navbar-brand" href="#">WeatherApp</a>

    <div class='expand navbar-expand'>
      <div class='navbar-nav mr-auto'>
        <router-link to='/' class='nav-item nav-link'>Home</router-link>
        <router-link to='/about' class='nav-item nav-link'>About</router-link>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'Nav'
}
</script>

<style>
</style>
