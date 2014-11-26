// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
// require_tree .

(function($){
  $.fn.dialog=function(flag,options){
    var opts = $.extend({}, $.fn.dialog.options, options);
    var closePopup = function(){
      popDiv.hide();
      $("."+opts.popWarp).remove();
      $("."+opts.newRow).remove();
      try{
        if (objfocus) {
          objfocus.focus();
        }
      }catch (e){
      }
    };
    var redraw = function(){
      var maxH = $(document).height()+"px";
      var maxW = $(window).width()+"px";
      var winH = $("#"+opts.parent_id+" .th").height()+2+"px";
      var winW = $("#"+opts.parent_id+" .th").width()+2+"px";
      var winX = $("."+opts.newRow).position().left + "px";
      var winY = $("."+opts.newRow).position().top + "px";
      popWarp.css({width:maxW,height:maxH,"z-index":opts.zindex});
      popDiv.css({left:winX,top:winY,width:winW,height:winH,"z-index":(opts.zindex+2)});
      newRow.css({width:winW,height:winH,"z-index":(opts.zindex+1)});
    }

    if(flag=="close" && popDiv.is(":visible")){
      closePopup();
      return;
    }
 
    var popWarp=$("<div/>").addClass(opts.popWarp);
    var newRow=$("<div/>").addClass(opts.newRow);
    var popDiv = this;
    popDiv.addClass(opts.popDiv);
 
    if(flag=="open" && popDiv.is(":hidden")){
      $("#"+opts.parent_id+" nav").before(newRow);
      popDiv.after(popWarp);
      redraw();
      popDiv.show();
    }
 
    $(window).resize(redraw);
    $("."+opts.closeWin).click(closePopup);
    $("."+opts.popWarp).click(closePopup);
 
    var con={
            scrol:function(kg){
                  if(kg!="off"){
                    $(window).bind("scroll.popWin"+popDiv.attr("id"),
                                   function (){
                                     var offsetTop = ($(window).height()- popDiv.height())/2 + $(window).scrollTop() +"px";
                                     popDiv.animate({top:offsetTop},{duration:380 , queue:false });
                                   });
                  }else{
                    $(window).unbind("scroll.popWin"+popDiv.attr("id"));
                  }
            }
    };
    con.scrol("");
    return con;
  };
 
  $.fn.dialog.options={closeWin:"closeWin", popWarp:"popWarp", popDiv:"popDiv", newRow:"newRow", zindex:999 };

})(jQuery);

