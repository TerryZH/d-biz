# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#add_new_material').click ->
    $('#create_new_material').dialog('open', {parent_id:'material_list'});
