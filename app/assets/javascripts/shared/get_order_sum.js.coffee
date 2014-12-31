# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# define shared function getCustomerOrderSummary
$ ->
  window.COSUtil = {
  getCustomerOrderSummary: (cos_url_root, cos_url_params, tel_id, addr_id, cos_id) ->
    handle_addresses = (addresses) ->
      if addresses && addresses.length
        address_list = ""
        address_list += "<div class='history_order_address' tel='" + a.tel + "' location='" + a.location + "'>" + a.tel + " - " + a.location.replaceAll("-","") + "</div>" for a in addresses
      else
        address_list = $("#no_address")[0].innerHTML
      $("#address_list")[0].innerHTML = address_list
      $("#address_list .history_order_address").click ->
        update_location=(location) ->
          if location && location.length>0
            loc=location.split('-')
            ads=$("#address_detail select")
            for index in [0...ads.length]
              ads[index].value=loc[index]
        update_tel=(tel) ->
          if tel and tel.length>0
            $("#new_order_tel").val(tel)
        update_preference = (json) ->
          if json && json.preference
            handle_preferences(json.preference, json.storage, "preference_table_intermediate", "preference_table_template")
        update_tel this.getAttribute("tel")
        update_location this.getAttribute("location")
        $.ajax({
          type: "GET",
          dataType: "text json",
          url: cos_url_root+"?tel="+this.getAttribute("tel"),
          success: update_preference,
          error: ajax_on_err
        })


    handle_preferences_historical = (intermediate_id, historical_preferences) ->
      $("#"+intermediate_id+" .preferences_historical_"+p.product_id)[0].innerHTML = p.product_number for p in historical_preferences

    handle_preferences_last_order = (intermediate_id, last_order_preferences) ->
      $("#"+intermediate_id+" .preferences_last_order_"+p.product_id)[0].innerHTML = p.product_number for p in last_order_preferences

    handle_storages = (intermediate_id, storages) ->
      $("#"+intermediate_id+" .product_storage_"+p.product_id)[0].innerHTML = (p.made-p.sold) for p in storages

    handle_preferences = (preferences, storages, intermediate_id, template_id) ->
      if preferences && (preferences.historical.length||preferences.last_order.length)
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
      if json && json.address
        handle_addresses(json.address)
      if json && json.preference
        handle_preferences(json.preference, json.storage, "preference_table_intermediate", "preference_table_template")

    ajax_on_err = (XMLHttpRequest, textStatus, errorThrown) ->
      alert(textStatus)

    $.ajax({
      type: "GET",
      dataType: "text json",
      url: cos_url_root+"?"+cos_url_params,
      success: ajax_on_suc,
      error: ajax_on_err
    })
  }
