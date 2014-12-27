# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# dynamically add new item (used in materials and productions)
$ ->
  $.fn.dialog = (flag,options) ->
    opts = $.extend({}, $.fn.dialog.options, options)
    closePopup = () ->
      popDiv.hide()
      $("."+opts.popWarp).remove()
      $("."+opts.newRow).remove()
      try
        objfocus.focus() if objfocus
      catch error

    redraw = () ->
      maxH = $(document).height()+"px"
      maxW = $(window).width()+"px"
      winH = $("#"+opts.parent_id+" .th").height()+2+"px"
      winW = $("#"+opts.parent_id+" .th").width()+2+"px"
      winX = $("."+opts.newRow).position().left + "px"
      winY = $("."+opts.newRow).position().top + "px"
      popWarp.css({width:maxW,height:maxH,"z-index":opts.zindex})
      popDiv.css({left:winX,top:winY,width:winW,height:winH,"z-index":(opts.zindex+2)})
      newRow.css({width:winW,height:winH,"z-index":(opts.zindex+1)})

    if flag=="close" && popDiv.is(":visible")
      closePopup()
      return
 
    popDiv = this
    if flag=="open" && popDiv.is(":hidden")
      popWarp=$("<div/>").addClass(opts.popWarp)
      newRow=$("<div/>").addClass(opts.newRow)
 
      popDiv.addClass(opts.popDiv)
      $("#"+opts.parent_id+" .d-table").after(newRow)
      popDiv.after(popWarp)
      redraw()
 
      $(window).resize(redraw)
      $("."+opts.closeWin).click(closePopup)
      $("."+opts.popWarp).click(closePopup)
 
      popDiv.show()
 
    scrol_func = (kg) ->
      animate_resize = () ->
        offsetTop = ($(window).height()-popDiv.height())/2 + $(window).scrollTop() + "px"
        popDiv.animate({top:offsetTop},{duration:380 , queue:false })
      if kg!="off"
        $(window).bind("scroll.popWin"+popDiv.attr("id"), animate_resize)
      else
        $(window).unbind("scroll.popWin"+popDiv.attr("id"))

    con={ scrol:scrol_func }
    con.scrol("")
    return con

  $.fn.dialog.options = {closeWin:"closeWin", popWarp:"popWarp", popDiv:"popDiv", newRow:"newRow", zindex:999 }
