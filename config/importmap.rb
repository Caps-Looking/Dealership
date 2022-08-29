# frozen_string_literal: true

pin 'application', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'jquery', to: 'jquery.min.js', preload: true
pin '@nathanvda/cocoon', to: 'https://ga.jspm.io/npm:@nathanvda/cocoon@1.2.14/cocoon.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'user', to: 'views/user'
pin 'vehicle', to: 'views/vehicle'
