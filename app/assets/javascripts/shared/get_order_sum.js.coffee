# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# define shared function getCustomerOrderSummary
$ ->
  $.fn.getCustomerOrderSummary = (url, found_addr_cb, found_pref_cb) ->
    handle_addresses = (addresses) ->
      if addresses.length
        found_addr_cb(addresses) if found_addr_cb
        address_list = ""
        address_list += "<div>" + a.location + "</div>" for a in addresses
      else
        address_list = $("#no_address")[0].innerHTML

      $("#address_list")[0].innerHTML = address_list

    handle_preferences_historical = (intermediate_id, historical_preferences) ->
      $("#"+intermediate_id+" .preferences_historical_"+p.product_id)[0].innerHTML = p.product_number for p in historical_preferences

    handle_preferences_last_order = (intermediate_id, last_order_preferences) ->
      $("#"+intermediate_id+" .preferences_last_order_"+p.product_id)[0].innerHTML = p.product_number for p in last_order_preferences

    handle_storages = (intermediate_id, storages) ->
      $("#"+intermediate_id+" .product_storage_"+p.product_id)[0].innerHTML = (p.made-p.sold) for p in storages

    handle_preferences = (preferences, storages, intermediate_id, template_id) ->
      if preferences.historical.length || preferences.last_order.length
        found_pref_cb() if found_pref_cb
        newItem = $("#"+template_id).clone().attr("id",intermediate_id)
        $("#"+template_id).before(newItem)
        handle_preferences_historical(intermediate_id, preferences.historical)
        handle_preferences_last_order(intermediate_id, preferences.last_order)
        handle_storages(intermediate_id, storages)
        preference_table = $("#"+intermediate_id)[0].innerHTML
        $("#"+intermediate_id).remove()
      else
        preference_table = $("#no_preference")[0].innerHTML

      $("#preference_table")[0].innerHTML = preference_table

    ajax_on_suc = (json) ->
      handle_addresses(json.address)
      handle_preferences(json.preference, json.storage, "preference_table_intermediate", "preference_table_template")

    ajax_on_err = (XMLHttpRequest, textStatus, errorThrown) ->
      alert(textStatus)

    $.ajax({
       type: "GET",
       dataType: "text json",
       url: url,
       success: ajax_on_suc,
       error: ajax_on_err
       })
