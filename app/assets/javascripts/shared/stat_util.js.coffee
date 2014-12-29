# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
# update statistic numbers
  window.StatUtil = {
  updateStat: (wd_p_day, lc_p_day, wd_p_10k, lc_p_10k, mc_p_10k, cc_p_10k, oc_p_10k, tc_p_10k, gp_p_10k, rt_p_mon, oh_p_mon, tr_p_mon) ->
    __wd_p_day = $("#"+wd_p_day)[0].value.trim()|0
    __lc_p_day = $("#"+lc_p_day)[0].value.trim()|0
    __wd_p_10k = $("#"+wd_p_10k)[0].innerHTML.trim()|0
    __lc_p_10k = __wd_p_10k*__lc_p_day/__wd_p_day
    __mc_p_10k = $("#"+mc_p_10k)[0].innerHTML.trim()|0
    __cc_p_10k = __lc_p_10k+__mc_p_10k
    __oc_p_10k = $("#"+oc_p_10k)[0].innerHTML.trim()|0
    __tc_p_10k = __cc_p_10k + __oc_p_10k
    __gp_p_10k = 10000.0 - __tc_p_10k
    __rt_p_mon = $("#"+rt_p_mon)[0].value.trim()|0
    __oh_p_mon = $("#"+oh_p_mon)[0].value.trim()|0
    __tr_p_mon = 10000.0*(__rt_p_mon+__oh_p_mon)/__gp_p_10k

    $("#"+lc_p_10k)[0].innerHTML = __lc_p_10k
    $("#"+cc_p_10k)[0].innerHTML = __cc_p_10k
    $("#"+tc_p_10k)[0].innerHTML = __tc_p_10k
    $("#"+gp_p_10k)[0].innerHTML = __gp_p_10k
    $("#"+tr_p_mon)[0].innerHTML = __tr_p_mon

  onPromCostChanged: () ->
    this.updateStat("prom_p_day", "prom_lc_p_day", "prom_p_10k", "prom_lc_p_10k", "prom_mc_p_10k", "prom_c_p_10k", "prod_c_p_10k", "cost_p_10k", "gprf_p_10k", "rt_p_mon", "oh_p_mon", "tr_p_mon")

  onProdCostChanged: () ->
    this.updateStat("prod_p_day", "prod_lc_p_day", "prod_p_10k", "prod_lc_p_10k", "prod_mc_p_10k", "prod_c_p_10k", "prom_c_p_10k", "cost_p_10k", "gprf_p_10k", "rt_p_mon", "oh_p_mon", "tr_p_mon")

  onFixedCostChanged: () ->
    this.updateStat("prom_p_day", "prom_lc_p_day", "prom_p_10k", "prom_lc_p_10k", "prom_mc_p_10k", "prom_c_p_10k", "prod_c_p_10k", "cost_p_10k", "gprf_p_10k", "rt_p_mon", "oh_p_mon", "tr_p_mon")
  }