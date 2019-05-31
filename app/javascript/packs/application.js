import "bootstrap";
import Glide from '@glidejs/glide';
import '@glidejs/glide/dist/css/glide.core.min.css'
import * from '../tooltip.js'

new Glide('.glide', {
  type: 'carousel',
  startAt: 0,
  perView: 4
}).mount()

