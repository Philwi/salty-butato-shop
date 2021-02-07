import { Controller } from 'stimulus';
export default class extends Controller {
  static values = { index: String }
  render_index(event) {
    console.log(this.indexValue)
    fetch(this.indexValue)
      .then(response => response.text())
      .then(html => document.getElementById('cms-body').innerHTML = html)
  }
}
