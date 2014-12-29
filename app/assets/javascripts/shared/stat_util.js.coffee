# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
# update statistic numbers

  updateCost=(delivery_per_day, lc_per_day, delivery_per_10k_revenue, lc_per_10k_revenue, mc_per_10k_revenue, cost_per_10k_revenue, other_cost_per_10k_revenue, total_cost) ->
    __delivery_per_day=$("#"+delivery_per_day)[0].value.trim()|0
    __lc_per_day=$("#"+lc_per_day)[0].value.trim()|0
    __delivery_per_10k_revenue = $("#"+delivery_per_10k_revenue)[0].innerHTML.trim()|0
    __lc_per_10k_revenue=__delivery_per_10k_revenue*__lc_per_day/__delivery_per_day
    __mc_per_10k_revenue=$("#"+mc_per_10k_revenue)[0].innerHTML.trim()|0
    __cost_per_10k_revenue=__lc_per_10k_revenue+__mc_per_10k_revenue
    __other_cost_per_10k_revenue=$("#"+other_cost_per_10k_revenue)[0].innerHTML.trim()|0
    __total_cost = __cost_per_10k_revenue + __other_cost_per_10k_revenue
    $("#"+lc_per_10k_revenue)[0].innerHTML=__lc_per_10k_revenue
    $("#"+cost_per_10k_revenue)[0].innerHTML=__cost_per_10k_revenue
    $("#"+total_cost)[0].innerHTML=__total_cost

  updateFlierCost=() ->
    updateCost("flier_per_day", "flier_lc_per_day", "flier_per_10k_revenue", "flier_lc_per_10k_revenue", "flier_mc_per_10k_revenue", "flier_cost_per_10k_revenue", "product_cost_per_10k_revenue", "cost_per_10k_revenue")

  updateProductCost=() ->
    updateCost("product_per_day", "product_lc_per_day", "product_per_10k_revenue", "product_lc_per_10k_revenue", "product_mc_per_10k_revenue", "product_cost_per_10k_revenue", "flier_cost_per_10k_revenue", "cost_per_10k_revenue")

  $("#flier_per_day").keyup ->
    updateFlierCost()
  $("#flier_lc_per_day").keyup ->
    updateFlierCost()
  $("#product_per_day").keyup ->
    updateProductCost()
  $("#product_lc_per_day").keyup ->
    updateProductCost()

  if( $("#statistic_form").length )
    updateFlierCost()
    updateProductCost()
