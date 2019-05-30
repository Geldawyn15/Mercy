import "bootstrap";
import "alert";
import Glide from '@glidejs/glide';
import '@glidejs/glide/dist/css/glide.core.min.css'

new Glide('.glide', {
  type: 'carousel',
  startAt: 0,
  perView: 4
}).mount()

