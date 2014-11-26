# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#add_new_orderdetail').click ->
    $('#create_new_orderdetail').dialog('open', {parent_id:'orderdetail_list'});