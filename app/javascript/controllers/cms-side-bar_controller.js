import { Controller } from 'stimulus';
export default class extends Controller {
  connect() {
  }
  toggle(event) {
    const categoryName = event.target.attributes.value.value
    Array.from(document.getElementsByClassName(categoryName)).forEach(clazz => {
      if (Array.from(clazz.classList).includes('hide')){
        clazz.classList.remove('hide')
      } else {
        clazz.classList.add('hide')
      }
    })
  }
}
