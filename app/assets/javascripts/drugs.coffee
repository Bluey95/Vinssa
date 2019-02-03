# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  expirationDate  = $('.expiration')
  d = new Date();
  m = d.getMonth()+1
  day=d.getDate()
  if (m < 10 && day < 10)
    strDate = d.getFullYear() + "-" + '0' + m + "-" + '0' + day;
  else
    strDate = d.getFullYear() + "-" + m + "-" +  day;
  $('.expiration').each(->
    if ($(this).html()  == strDate)
      $(this).addClass('red')
  )
  $('.quantity').each( ->
    if ($(this).html() < 500)
      $(this).addClass('red')
  )





