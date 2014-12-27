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
    newItem.children().children(".select_item_number").change ->
      checkStorage()

# find address per tel #
  $("#new_order_tel").keyup ->
    url_template=$("#cos_url")[0].innerHTML
    tel_number=$("#new_order_tel")[0].value
    tel_placeholder="_tel_ph_"
    $.fn.getCustomerOrderSummary(url_template.replace(tel_placeholder,tel_number))

# check storage when selecting number for items
  $(".select_item_number").change ->
    checkStorage()

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





