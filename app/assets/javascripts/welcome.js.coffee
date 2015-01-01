# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
# dynamically add order items
  $("#add_new_order_item").click ->
    newItem=$("#order_item_template").clone().removeAttr("id")
    itemNum=$(".order_item").length
    newItem.html(newItem.html().replaceAll("_sn_0","_sn_"+itemNum))
    $("#add_new_order_item").before(newItem)
    $("#new_order_item_count").attr("value",itemNum+1)
    newItem.children().children(".select_item_number").change (e) ->
      checkStorage(e)

# find cos per tel #
  $("#new_order_tel").keyup (e) ->
    url_root=$("#cos_url_root").text().trim()
    param="tel="+$("#new_order_tel").val().trim()
    COSUtil.getCustomerOrderSummary(url_root, param, "new_order_tel", "address_detail", "cos")

# find cos per address
  $("#address_detail select").change ->
    url_root=$("#cos_url_root").text().trim()
    param="region=&location="+$("#new_order_neighbourhood").val()+"-"+$("#new_order_district").val()+"-"+$("#new_order_building").val()+"-"+$("#new_order_unit").val()+"-"+$("#new_order_floor").val()+"-"+$("#new_order_room").val()
    COSUtil.getCustomerOrderSummary(url_root, param, "new_order_tel", "address_detail", "cos")

# check storage when selecting number for items
  checkStorage=(e) ->
    itemCount=$("#new_order_item_count").attr("value")
    items=HashMap.createNew()
    for i in [0...itemCount]
      k=$("#new_order_product_sn_"+i)[0].value
      v=eval($("#new_order_number_sn_"+i)[0].value)
      items.add(k,v)
    evt=e||window.event
    eventSrc=evt.target||evt.srcElement
    p_id=$("#"+eventSrc.id.replace("number","product"))[0].value
    demandNum=items.get(p_id)
    supplyNum=eval($("#storage_of_pid_"+p_id)[0].innerHTML)
    if demandNum > supplyNum
      alert $("#text_out_of_storage")[0].innerHTML.format(supplyNum)

  $(".select_item_number").change (e) ->
    checkStorage(e)

# update profit estimation when cost changed
  $("#prom_p_day").keyup ->
    StatUtil.onPromCostChanged()
  $("#prom_lc_p_day").keyup ->
    StatUtil.onPromCostChanged()
  $("#prod_p_day").keyup ->
    StatUtil.onProdCostChanged()
  $("#prod_lc_p_day").keyup ->
    StatUtil.onProdCostChanged()
  $("#rt_p_mon").keyup ->
    StatUtil.onFixedCostChanged()
  $("#oh_p_mon").keyup ->
    StatUtil.onFixedCostChanged()

# get location from web
  $("#txtPosition").click ->
    LocationUtil.getLocation()



