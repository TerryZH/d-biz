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
  $("#new_order_tel").keyup (e) ->
    if e.which!=37 and e.which!=38 and e.which!=39 and e.which!=40
      this.setAttribute("valueReserved",this.value.length!=0)
    onTelChanged()

  onTelChanged = () ->
    url_template=$("#cos_url")[0].innerHTML
    tel_number=$("#new_order_tel")[0].value
    tel_placeholder="_tel_ph_"
    url=url_template.replace(tel_placeholder,tel_number)
    update_addr_section=(addresses) ->
      ads=$("#address_detail select")
      for index in [0...ads.length]
        if eval(ads[index].getAttribute("valueReserved"))
          return
      if addresses && addresses.length>0
        addr=addresses
      else
        addr=[{"region":"北京市--朝阳区-管庄乡","location":"北京新天地--1号楼--1-01","tel":""}]
      loc=addr[0].location.split('-')
      for index in [0...ads.length]
        select_control=ads[index]
        select_control.value=loc[index]
        select_control.setAttribute("valueReserved",false)
    COSUtil.getCustomerOrderSummary(url, update_addr_section)

# find tel # per address
  $("#address_detail select").change ->
    this.setAttribute("valueReserved",this.selectedIndex!=0)
    onAddrChanged()

  onAddrChanged = () ->
    url_template=$("#cos_url")[0].innerHTML
    param_list="region=&location="+$("#new_order_neighbourhood").val()+"-"+$("#new_order_district").val()+"-"+$("#new_order_building").val()+"-"+$("#new_order_unit").val()+"-"+$("#new_order_floor").val()+"-"+$("#new_order_room").val()
    param_placeholder="tel=_tel_ph_"
    url=url_template.replace(param_placeholder,param_list)
    update_tel=(customer) ->
      if eval($("#new_order_tel").attr("valueReserved"))
        return
      if customer and customer.tel
        $("#new_order_tel").val(customer.tel)
      else
        $("#new_order_tel").val("")
      $("#new_order_tel").attr("valueReserved",false)
    COSUtil.getCustomerOrderSummary(url, null, null, update_tel)

# check storage when selecting number for items
  $(".select_item_number").change ->
    checkStorage()

  checkStorage=(e) ->
    itemCount=$("#new_order_item_count").attr("value")
    items=HashMap.createNew()
    for i in [0...itemCount]
      k=$("#new_order_prod_sn_"+i)[0].value
      v=eval($("#new_order_number_sn_"+i)[0].value)
      items.add(k,v)

    evt=e||window.event
    eventSrc=evt.target||evt.srcElement
    p_id=$("#"+eventSrc.id.replace("number","prod"))[0].value
    demandNum=items.get(p_id)
    supplyNum=eval($("#storage_of_pid_"+p_id)[0].innerHTML)
    if demandNum > supplyNum
      alert $("#text_out_of_storage")[0].innerHTML.format(supplyNum)

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



