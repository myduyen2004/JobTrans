/**
 * Jquery.rcounter.js 
 * Version: 1.0.0
 * Author: Sharifur
 * Inspired By Benjamin Intal
 * MIT License
 * */

(function($) {
    'use strict';
    $.fn.rCounter = function(options) {
        var settings = $.extend({
            duration: 20,
            easing: 'swing',
        }, options);
        return this.each(function() {
            var $this = $(this);

            var startCounter = function() {
                    var numbers = [];
                    var length = $this.length;
                    var number = $this.text();
                    var isComma = /[,\-]/.test(number);
                    var isFloat = /[,\-]/.test(number);
                    var number = number.replace(/,/g, '');
                    var divisions = settings.duration;
                    var decimalPlaces = isFloat ? (number.split('.')[1] || []).length : 0;

                    // make number string to array for displaying counterup
                    for (var rcn = divisions; rcn >= 1; rcn--) {

                        var newNum = parseInt(number / divisions * rcn);
                        if (isFloat) {
                            newNum = parseFloat(number / divisions * rcn).toFixed(decimalPlaces);
                        }
                        if (isComma) {
                            while (/(\d+)(\d{3})/.test(newNum.toString())) {
                                newNum = newNum.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
                            }
                        }

                        numbers.unshift(newNum);
                    }
                    var counterUpDisplay = function() {
                        $this.text(numbers.shift());
                        setTimeout(counterUpDisplay, settings.duration);
                    };
                    setTimeout(counterUpDisplay, settings.duration);
                } // end function

            //bind with waypoints
            $this.waypoint(startCounter, { offset: '100%', triggerOnce: true });
        });


    }

}(jQuery));


/*!
Waypoints - 4.0.0
Copyright © 2011-2015 Caleb Troughton
Licensed under the MIT license.
https://github.com/imakewebthings/waypoints/blob/master/licenses.txt
*/
!function(){"use strict";var t=0,e={};function i(o){if(!o)throw new Error("No options passed to Waypoint constructor");if(!o.element)throw new Error("No element option passed to Waypoint constructor");if(!o.handler)throw new Error("No handler option passed to Waypoint constructor");this.key="waypoint-"+t,this.options=i.Adapter.extend({},i.defaults,o),this.element=this.options.element,this.adapter=new i.Adapter(this.element),this.callback=o.handler,this.axis=this.options.horizontal?"horizontal":"vertical",this.enabled=this.options.enabled,this.triggerPoint=null,this.group=i.Group.findOrCreate({name:this.options.group,axis:this.axis}),this.context=i.Context.findOrCreateByElement(this.options.context),i.offsetAliases[this.options.offset]&&(this.options.offset=i.offsetAliases[this.options.offset]),this.group.add(this),this.context.add(this),e[this.key]=this,t+=1}i.prototype.queueTrigger=function(t){this.group.queueTrigger(this,t)},i.prototype.trigger=function(t){this.enabled&&this.callback&&this.callback.apply(this,t)},i.prototype.destroy=function(){this.context.remove(this),this.group.remove(this),delete e[this.key]},i.prototype.disable=function(){return this.enabled=!1,this},i.prototype.enable=function(){return this.context.refresh(),this.enabled=!0,this},i.prototype.next=function(){return this.group.next(this)},i.prototype.previous=function(){return this.group.previous(this)},i.invokeAll=function(t){var i=[];for(var o in e)i.push(e[o]);for(var n=0,r=i.length;n<r;n++)i[n][t]()},i.destroyAll=function(){i.invokeAll("destroy")},i.disableAll=function(){i.invokeAll("disable")},i.enableAll=function(){i.invokeAll("enable")},i.refreshAll=function(){i.Context.refreshAll()},i.viewportHeight=function(){return window.innerHeight||document.documentElement.clientHeight},i.viewportWidth=function(){return document.documentElement.clientWidth},i.adapters=[],i.defaults={context:window,continuous:!0,enabled:!0,group:"default",horizontal:!1,offset:0},i.offsetAliases={"bottom-in-view":function(){return this.context.innerHeight()-this.adapter.outerHeight()},"right-in-view":function(){return this.context.innerWidth()-this.adapter.outerWidth()}},window.Waypoint=i}(),function(){"use strict";function t(t){window.setTimeout(t,1e3/60)}var e=0,i={},o=window.Waypoint,n=window.onload;function r(t){this.element=t,this.Adapter=o.Adapter,this.adapter=new this.Adapter(t),this.key="waypoint-context-"+e,this.didScroll=!1,this.didResize=!1,this.oldScroll={x:this.adapter.scrollLeft(),y:this.adapter.scrollTop()},this.waypoints={vertical:{},horizontal:{}},t.waypointContextKey=this.key,i[t.waypointContextKey]=this,e+=1,this.createThrottledScrollHandler(),this.createThrottledResizeHandler()}r.prototype.add=function(t){var e=t.options.horizontal?"horizontal":"vertical";this.waypoints[e][t.key]=t,this.refresh()},r.prototype.checkEmpty=function(){var t=this.Adapter.isEmptyObject(this.waypoints.horizontal),e=this.Adapter.isEmptyObject(this.waypoints.vertical);t&&e&&(this.adapter.off(".waypoints"),delete i[this.key])},r.prototype.createThrottledResizeHandler=function(){var t=this;function e(){t.handleResize(),t.didResize=!1}this.adapter.on("resize.waypoints",function(){t.didResize||(t.didResize=!0,o.requestAnimationFrame(e))})},r.prototype.createThrottledScrollHandler=function(){var t=this;function e(){t.handleScroll(),t.didScroll=!1}this.adapter.on("scroll.waypoints",function(){t.didScroll&&!o.isTouch||(t.didScroll=!0,o.requestAnimationFrame(e))})},r.prototype.handleResize=function(){o.Context.refreshAll()},r.prototype.handleScroll=function(){var t={},e={horizontal:{newScroll:this.adapter.scrollLeft(),oldScroll:this.oldScroll.x,forward:"right",backward:"left"},vertical:{newScroll:this.adapter.scrollTop(),oldScroll:this.oldScroll.y,forward:"down",backward:"up"}};for(var i in e){var o=e[i],n=o.newScroll>o.oldScroll?o.forward:o.backward;for(var r in this.waypoints[i]){var s=this.waypoints[i][r],a=o.oldScroll<s.triggerPoint,l=o.newScroll>=s.triggerPoint;(a&&l||!a&&!l)&&(s.queueTrigger(n),t[s.group.id]=s.group)}}for(var h in t)t[h].flushTriggers();this.oldScroll={x:e.horizontal.newScroll,y:e.vertical.newScroll}},r.prototype.innerHeight=function(){return this.element==this.element.window?o.viewportHeight():this.adapter.innerHeight()},r.prototype.remove=function(t){delete this.waypoints[t.axis][t.key],this.checkEmpty()},r.prototype.innerWidth=function(){return this.element==this.element.window?o.viewportWidth():this.adapter.innerWidth()},r.prototype.destroy=function(){var t=[];for(var e in this.waypoints)for(var i in this.waypoints[e])t.push(this.waypoints[e][i]);for(var o=0,n=t.length;o<n;o++)t[o].destroy()},r.prototype.refresh=function(){var t,e=this.element==this.element.window,i=e?void 0:this.adapter.offset(),n={};for(var r in this.handleScroll(),t={horizontal:{contextOffset:e?0:i.left,contextScroll:e?0:this.oldScroll.x,contextDimension:this.innerWidth(),oldScroll:this.oldScroll.x,forward:"right",backward:"left",offsetProp:"left"},vertical:{contextOffset:e?0:i.top,contextScroll:e?0:this.oldScroll.y,contextDimension:this.innerHeight(),oldScroll:this.oldScroll.y,forward:"down",backward:"up",offsetProp:"top"}}){var s=t[r];for(var a in this.waypoints[r]){var l,h,p,c,u=this.waypoints[r][a],d=u.options.offset,f=u.triggerPoint,w=0,y=null==f;u.element!==u.element.window&&(w=u.adapter.offset()[s.offsetProp]),"function"==typeof d?d=d.apply(u):"string"==typeof d&&(d=parseFloat(d),u.options.offset.indexOf("%")>-1&&(d=Math.ceil(s.contextDimension*d/100))),l=s.contextScroll-s.contextOffset,u.triggerPoint=w+l-d,h=f<s.oldScroll,p=u.triggerPoint>=s.oldScroll,c=!h&&!p,!y&&(h&&p)?(u.queueTrigger(s.backward),n[u.group.id]=u.group):!y&&c?(u.queueTrigger(s.forward),n[u.group.id]=u.group):y&&s.oldScroll>=u.triggerPoint&&(u.queueTrigger(s.forward),n[u.group.id]=u.group)}}return o.requestAnimationFrame(function(){for(var t in n)n[t].flushTriggers()}),this},r.findOrCreateByElement=function(t){return r.findByElement(t)||new r(t)},r.refreshAll=function(){for(var t in i)i[t].refresh()},r.findByElement=function(t){return i[t.waypointContextKey]},window.onload=function(){n&&n(),r.refreshAll()},o.requestAnimationFrame=function(e){(window.requestAnimationFrame||window.mozRequestAnimationFrame||window.webkitRequestAnimationFrame||t).call(window,e)},o.Context=r}(),function(){"use strict";function t(t,e){return t.triggerPoint-e.triggerPoint}function e(t,e){return e.triggerPoint-t.triggerPoint}var i={vertical:{},horizontal:{}},o=window.Waypoint;function n(t){this.name=t.name,this.axis=t.axis,this.id=this.name+"-"+this.axis,this.waypoints=[],this.clearTriggerQueues(),i[this.axis][this.name]=this}n.prototype.add=function(t){this.waypoints.push(t)},n.prototype.clearTriggerQueues=function(){this.triggerQueues={up:[],down:[],left:[],right:[]}},n.prototype.flushTriggers=function(){for(var i in this.triggerQueues){var o=this.triggerQueues[i],n="up"===i||"left"===i;o.sort(n?e:t);for(var r=0,s=o.length;r<s;r+=1){var a=o[r];(a.options.continuous||r===o.length-1)&&a.trigger([i])}}this.clearTriggerQueues()},n.prototype.next=function(e){this.waypoints.sort(t);var i=o.Adapter.inArray(e,this.waypoints);return i===this.waypoints.length-1?null:this.waypoints[i+1]},n.prototype.previous=function(e){this.waypoints.sort(t);var i=o.Adapter.inArray(e,this.waypoints);return i?this.waypoints[i-1]:null},n.prototype.queueTrigger=function(t,e){this.triggerQueues[e].push(t)},n.prototype.remove=function(t){var e=o.Adapter.inArray(t,this.waypoints);e>-1&&this.waypoints.splice(e,1)},n.prototype.first=function(){return this.waypoints[0]},n.prototype.last=function(){return this.waypoints[this.waypoints.length-1]},n.findOrCreate=function(t){return i[t.axis][t.name]||new n(t)},o.Group=n}(),function(){"use strict";var t=window.jQuery,e=window.Waypoint;function i(e){this.$element=t(e)}t.each(["innerHeight","innerWidth","off","offset","on","outerHeight","outerWidth","scrollLeft","scrollTop"],function(t,e){i.prototype[e]=function(){var t=Array.prototype.slice.call(arguments);return this.$element[e].apply(this.$element,t)}}),t.each(["extend","inArray","isEmptyObject"],function(e,o){i[o]=t[o]}),e.adapters.push({name:"jquery",Adapter:i}),e.Adapter=i}(),function(){"use strict";var t=window.Waypoint;function e(e){return function(){var i=[],o=arguments[0];return e.isFunction(arguments[0])&&((o=e.extend({},arguments[1])).handler=arguments[0]),this.each(function(){var n=e.extend({},o,{element:this});"string"==typeof n.context&&(n.context=e(this).closest(n.context)[0]),i.push(new t(n))}),i}}window.jQuery&&(window.jQuery.fn.waypoint=e(window.jQuery)),window.Zepto&&(window.Zepto.fn.waypoint=e(window.Zepto))}();


/*  Init
/*----------------------------------------------------*/
$(window).on('load', function() {
    $('.fun-fact h4').rCounter({
        duration: 20
    });
    $('.counter').rCounter({
        duration: 30
    });
});

