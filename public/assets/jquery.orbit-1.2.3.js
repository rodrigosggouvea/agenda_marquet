/*
 * jQuery Orbit Plugin 1.2.3
 * www.ZURB.com/playground
 * Copyright 2010, ZURB
 * Free to use under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
*/
(function(e){e.fn.orbit=function(t){var n={animation:"horizontal-push",animationSpeed:600,timer:!0,advanceSpeed:4e3,pauseOnHover:!1,startClockOnMouseOut:!1,startClockOnMouseOutAfter:1e3,directionalNav:!0,captions:!0,captionAnimation:"fade",captionAnimationSpeed:600,bullets:!1,bulletThumbs:!1,bulletThumbLocation:"",afterSlideChange:function(){}},t=e.extend(n,t);return this.each(function(){function c(){u=!1}function h(){u=!0}function p(){if(!t.timer||t.timer=="false")return!1;m.is(":hidden")?S=setInterval(function(e){H("next")},t.advanceSpeed):(g=!0,w.removeClass("active"),S=setInterval(function(e){var t="rotate("+E+"deg)";E+=2,y.css({"-webkit-transform":t,"-moz-transform":t,"-o-transform":t}),E>180&&(y.addClass("move"),b.addClass("move")),E>360&&(y.removeClass("move"),b.removeClass("move"),E=0,H("next"))},t.advanceSpeed/180))}function d(){if(!t.timer||t.timer=="false")return!1;g=!1,clearInterval(S),w.addClass("active")}function C(){if(!t.captions||t.captions=="false")return!1;var r=l.eq(n).data("caption");_captionHTML=e(r).html(),_captionHTML?(N.attr("id",r).html(_captionHTML),t.captionAnimation=="none"&&N.show(),t.captionAnimation=="fade"&&N.fadeIn(t.captionAnimationSpeed),t.captionAnimation=="slideOpen"&&N.slideDown(t.captionAnimationSpeed)):(t.captionAnimation=="none"&&N.hide(),t.captionAnimation=="fade"&&N.fadeOut(t.captionAnimationSpeed),t.captionAnimation=="slideOpen"&&N.slideUp(t.captionAnimationSpeed))}function P(){if(!t.bullets)return!1;M.children("li").removeClass("active").eq(n).addClass("active")}function H(e){function f(){l.eq(i).css({"z-index":1}),c(),t.afterSlideChange.call(this)}var i=n,a=e;if(i==a)return!1;if(l.length=="1")return!1;u||(h(),e=="next"?(n++,n==r&&(n=0)):e=="prev"?(n--,n<0&&(n=r-1)):(n=e,i<n?a="next":i>n&&(a="prev")),P(),l.eq(i).css({"z-index":2}),t.animation=="fade"&&l.eq(n).css({opacity:0,"z-index":3}).animate({opacity:1},t.animationSpeed,f),t.animation=="horizontal-slide"&&(a=="next"&&l.eq(n).css({left:s,"z-index":3}).animate({left:0},t.animationSpeed,f),a=="prev"&&l.eq(n).css({left:-s,"z-index":3}).animate({left:0},t.animationSpeed,f)),t.animation=="vertical-slide"&&(a=="prev"&&l.eq(n).css({top:o,"z-index":3}).animate({top:0},t.animationSpeed,f),a=="next"&&l.eq(n).css({top:-o,"z-index":3}).animate({top:0},t.animationSpeed,f)),t.animation=="horizontal-push"&&(a=="next"&&(l.eq(n).css({left:s,"z-index":3}).animate({left:0},t.animationSpeed,f),l.eq(i).animate({left:-s},t.animationSpeed)),a=="prev"&&(l.eq(n).css({left:-s,"z-index":3}).animate({left:0},t.animationSpeed,f),l.eq(i).animate({left:s},t.animationSpeed))),C())}var n=0,r=0,s,o,u,a=e(this).addClass("orbit"),f=a.wrap('<div class="orbit-wrapper" />').parent();a.add(s).width("1px").height("1px");var l=a.children("img, a, div");l.each(function(){var t=e(this),n=t.width(),i=t.height();n>a.width()&&(a.add(f).width(n),s=a.width()),i>a.height()&&(a.add(f).height(i),o=a.height()),r++}),l.length==1&&(t.directionalNav=!1,t.timer=!1,t.bullets=!1),l.eq(n).css({"z-index":3}).fadeIn(function(){l.css({display:"block"})});if(t.timer){var v='<div class="timer"><span class="mask"><span class="rotator"></span></span><span class="pause"></span></div>';f.append(v);var m=f.children("div.timer"),g;if(m.length!=0){var y=e("div.timer span.rotator"),b=e("div.timer span.mask"),w=e("div.timer span.pause"),E=0,S;p(),m.click(function(){g?d():p()});if(t.startClockOnMouseOut){var x;f.mouseleave(function(){x=setTimeout(function(){g||p()},t.startClockOnMouseOutAfter)}),f.mouseenter(function(){clearTimeout(x)})}}}t.pauseOnHover&&f.mouseenter(function(){d()});if(t.captions){var T='<div class="orbit-caption"></div>';f.append(T);var N=f.children(".orbit-caption");C()}if(t.directionalNav){if(t.directionalNav=="false")return!1;var k='<div class="slider-nav"><span class="right">Right</span><span class="left">Left</span></div>';f.append(k);var L=f.children("div.slider-nav").children("span.left"),A=f.children("div.slider-nav").children("span.right");L.click(function(){d(),H("prev")}),A.click(function(){d(),H("next")})}if(t.bullets){var O='<ul class="orbit-bullets"></ul>';f.append(O);var M=f.children("ul.orbit-bullets");for(i=0;i<r;i++){var _=e("<li>"+(i+1)+"</li>");if(t.bulletThumbs){var D=l.eq(i).data("thumb");if(D){var _=e('<li class="has-thumb">'+i+"</li>");_.css({background:"url("+t.bulletThumbLocation+D+") no-repeat"})}}f.children("ul.orbit-bullets").append(_),_.data("index",i),_.click(function(){d(),H(e(this).data("index"))})}P()}})}})(jQuery);