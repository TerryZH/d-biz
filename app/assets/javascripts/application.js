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
/*弹出窗口插件*/
  $.fn.dialog=function(flag,options){
    var opts = $.extend({}, $.fn.dialog.options, options);
    var popDiv = this;
    var closePopup = function(){
      popDiv.hide();
      $("."+opts.popWarp).remove();
      try{
        if (objfocus) {
          objfocus.focus();
        }
      }catch (e){
      }
    };

    if(flag=="close" && popDiv.is(":visible")){
      closePopup();
      return;
    }
 
    var maxH = $(document).height()+"px";
    var maxW = $(window).width()+"px";
    var winX = ($(window).width()- popDiv.width())/2 + "px";
    var winY = ($(window).height()- popDiv.height())/2 + $(window).scrollTop() + "px";
    var popWarp=$("<div/>").addClass(opts.popWarp);

    popDiv.addClass(opts.popDiv);
 
    if(flag=="open" && popDiv.is(":hidden")){
      popDiv.after(popWarp);
      popWarp.css({width:maxW,height:maxH,"z-index":opts.zindex});
      popDiv.css({left:winX,top:winY,"z-index":(opts.zindex+1)});
      popDiv.show();
    }
    $(window).resize(function(){
                     var maxH = $(document).height()+"px";
                     var maxW = $(window).width()+"px";
                     var winX = ($(window).width()- popDiv.width())/2 + "px";
                     var winY = ($(window).height()- popDiv.height())/2 + $(window).scrollTop() + "px";
                     popDiv.css({left:winX,top:winY});
                     popWarp.css({width:maxW,height:maxH});
                     });

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
 
  $.fn.dialog.options={closeWin:"closeWin", popWarp:"popWarp", popDiv:"popDiv", zindex:999 };

})(jQuery);

