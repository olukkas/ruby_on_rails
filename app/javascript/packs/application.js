// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('@popperjs/core')
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { Tooltip } from 'bootstrap'
import '../stylessheets/aplications.scss'

document.addEventListener("turbolinks:load", () => {
    const seletor = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const createInstance = trigger => new Tooltip(trigger);

    Array.call(seletor).map(createInstance)
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
