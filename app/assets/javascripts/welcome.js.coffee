# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
# get location from web
  $("#txtPosition").click ->
    getLocation()

  getLocation = () ->
    if navigator.geolocation
      config = { enableHighAccuracy: true, timeout: 5000, maximumAge: 30000 }
      navigator.geolocation.getCurrentPosition(showPosition, showError, config)
    else
      alert("定位失败,用户已禁用位置获取权限")

  showPosition = (position) ->
    x = position.coords.latitude
    y = position.coords.longitude
    url = "http://api.map.baidu.com/geocoder/v2/?ak=C93b5178d7a8ebdb830b9b557abce78b" +
          "&callback=renderReverse" +
          "&location=" + x + "," + y +
          "&output=json" +
          "&pois=0"
    ajax_on_suc = (json) ->
      if json == null or typeof (json) == "undefined"
        return
      if json.status != 0
        return
      setAddress(json.result.addressComponent)
    ajax_on_err = (XMLHttpRequest, textStatus, errorThrown) ->
      alert("[x:" + x + ",y:" + y + "]地址位置获取失败,请手动选择地址")
    $.ajax({
      type: "GET",
      dataType: "jsonp",
      url: url,
      success: ajax_on_suc,
      error: ajax_on_err
      })

  showError = (error) ->
    switch error.code
      when error.PERMISSION_DENIED then alert("定位失败,用户拒绝请求地理定位")
      when error.POSITION_UNAVAILABLE then alert("定位失败,位置信息是不可用")
      when error.TIMEOUT then alert("定位失败,请求获取用户位置超时")
      when error.UNKNOWN_ERROR then alert("定位失败,定位系统失效")

  setAddress = (json) ->
    position = $("#txtPosition")[0]
    province = json.province
    city = json.city
    district = json.district
    province = province.replace('市', '')
    position.innerHTML = province + "," + city + "," + district
    position.style.color = 'green'

# dynamically add order items
  $("#add_new_order_item").click ->
    newItem = $("#order_item_template").clone().removeAttr("id")
    itemNum = $(".order_item").length
    newItem.html(newItem.html().replace(/_sn_0/g,"_sn_"+itemNum))
    $("#add_new_order_item").before(newItem)
    $("#new_order_item_count").attr("value",itemNum+1)

# find address per tel #
  $("#new_order_tel").keyup ->
    url_template=$("#cos_url")[0].innerHTML
    tel_number=$("#new_order_tel")[0].value
    tel_placeholder="_tel_ph_"
    $.fn.getCustomerOrderSummary(url_template.replace(eval("/"+tel_placeholder+"/g"),tel_number))
