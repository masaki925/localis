# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $window = $(window)
  $(".bs-docs-sidenav").affix offset:
    top: ->
      (if $window.width() <= 980 then 290 else 210)
      bottom: 270
