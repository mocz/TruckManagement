// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap';
import "jquery"
import "stylesheets/application";
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

// Ensure Turbolinks compatibility
document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="collapse"]').collapse();
  });

  $(document).on('turbolinks:load', function() {
    $('#filterForm').collapse();
    $('[data-toggle="collapse"]').collapse();
  });