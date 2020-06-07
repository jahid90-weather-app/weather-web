import Vue from 'vue'
import Router from 'vue-router'

import Weather from '@/components/Weather'
import About from '@/components/About'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Weather',
      component: Weather
    },
    {
      path: '/about',
      name: 'About',
      component: About
    }
  ]
})
