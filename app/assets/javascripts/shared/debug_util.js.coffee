# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# change theme on debug mode
window.DebugUtil = {
refresh_theme:() ->
  if $("#debug_section").is(":visible")
    $("ul").css("border","1px solid #CC9900")
    $("ul").css("border-top","0px")
    $(".th").css("background","#FAF1DE")
    $(".th").css("border-top","1px solid #CC9900")
    $(".add_new").css("border","1px solid #CC9900")
    $(".add_new").css("background","#FAF1DE")
}

$(window).bind('page:change', DebugUtil.refresh_theme)




