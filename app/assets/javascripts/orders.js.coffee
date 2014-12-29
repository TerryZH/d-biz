# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  showOrderSummary = () ->
    $("#show_order_summary_by_user").hide()
    $("#hide_order_summary_by_user").show()
    getCustomerOrderSummary($("#cos_url")[0].innerHTML)
    $("#preference_table").show()
    $("#address_list").show()

  hideOrderSummary = () ->
    $("#show_order_summary_by_user").show()
    $("#hide_order_summary_by_user").hide()
    $("#preference_table").hide()
    $("#address_list").hide()

  $("#show_order_summary_by_user").click ->
    showOrderSummary()

  $("#hide_order_summary_by_user").click ->
    hideOrderSummary()

  hideOrderSummary()