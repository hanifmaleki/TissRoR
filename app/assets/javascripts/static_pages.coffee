# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@myVar = false

@paintIt = (element, backgroundColor, textColor) ->
  if @myVar?
    @myVar=false
    element.innerText='Barghe Mohabat'
  else
    @myVar=true
    element.innerText='Zajre Eshgh'
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor
