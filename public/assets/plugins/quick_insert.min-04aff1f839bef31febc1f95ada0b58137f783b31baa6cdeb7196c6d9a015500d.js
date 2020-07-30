/*!
 * froala_editor v3.2.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2020 Froala Labs
 */


!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?t(require("froala-editor")):"function"==typeof define&&define.amd?define(["froala-editor"],t):t(e.FroalaEditor)}(this,function(p){"use strict";p=p&&p.hasOwnProperty("default")?p["default"]:p,Object.assign(p.DEFAULTS,{quickInsertButtons:["image","video","embedly","table","ul","ol","hr"],quickInsertTags:["p","div","h1","h2","h3","h4","h5","h6","pre","blockquote"],quickInsertEnabled:!0}),p.QUICK_INSERT_BUTTONS={},p.DefineIcon("quickInsert",{SVG_KEY:"add",template:"svg"}),p.RegisterQuickInsertButton=function(e,t){p.QUICK_INSERT_BUTTONS[e]=Object.assign({undo:!0},t)},p.RegisterQuickInsertButton("image",{icon:"insertImage",requiredPlugin:"image",title:"Insert Image",undo:!1,callback:function(){var e=this,t=e.$;e.shared.$qi_image_input||(e.shared.$qi_image_input=t(document.createElement("input")).attr("accept","image/"+e.opts.imageAllowedTypes.join(", image/").toLowerCase()).attr("name","quickInsertImage".concat(this.id)).attr("style","display: none;").attr("type","file"),t("body").first().append(e.shared.$qi_image_input),e.events.$on(e.shared.$qi_image_input,"change",function(){var e=t(this).data("inst");this.files&&(e.quickInsert.hide(),e.image.upload(this.files)),t(this).val("")},!0)),e.$qi_image_input=e.shared.$qi_image_input,e.helpers.isMobile()&&e.selection.save(),e.events.disableBlur(),e.$qi_image_input.data("inst",e)[0].click()}}),p.RegisterQuickInsertButton("video",{icon:"insertVideo",requiredPlugin:"video",title:"Insert Video",undo:!1,callback:function(){var e=prompt(this.language.translate("Paste the URL of the video you want to insert."));e&&this.video.insertByURL(e)}}),p.RegisterQuickInsertButton("embedly",{icon:"embedly",requiredPlugin:"embedly",title:"Embed URL",undo:!1,callback:function(){var e=prompt(this.language.translate("Paste the URL of any web content you want to insert."));e&&this.embedly.add(e)}}),p.RegisterQuickInsertButton("table",{icon:"insertTable",requiredPlugin:"table",title:"Insert Table",callback:function(){this.table.insert(2,2)}}),p.RegisterQuickInsertButton("ol",{icon:"formatOL",requiredPlugin:"lists",title:"Ordered List",callback:function(){this.lists.format("OL")}}),p.RegisterQuickInsertButton("ul",{icon:"formatUL",requiredPlugin:"lists",title:"Unordered List",callback:function(){this.lists.format("UL")}}),p.RegisterQuickInsertButton("hr",{icon:"insertHR",title:"Insert Horizontal Line",callback:function(){this.commands.insertHR()}}),p.PLUGINS.quickInsert=function(r){var a,l,c=r.$;function n(e){var t,n,i;(t=e.offset().top-r.$box.offset().top,n=(r.$iframe&&r.$iframe.offset().left||0)+e.offset().left<a.outerWidth()?e.offset().left+a.outerWidth():0-a.outerWidth(),r.opts.enter!=p.ENTER_BR)?i=(a.outerHeight()-e.outerHeight())/2:(c(document.createElement("span")).html(p.INVISIBLE_SPACE).insertAfter(e),i=(a.outerHeight()-e.next().outerHeight())/2,e.next().remove());if(r.opts.iframe){var s=r.helpers.getPX(r.$wp.find(".fr-iframe").css("padding-top"));t+=r.$iframe.offset().top+s}a.hasClass("fr-on")&&0<=t&&l.css("top",t-i),0<=t&&t-Math.abs(i)<=r.$box.outerHeight()-e.outerHeight()?(a.hasClass("fr-hidden")&&(a.hasClass("fr-on")&&u(),a.removeClass("fr-hidden")),a.css("top",t-i)):a.hasClass("fr-visible")&&(a.addClass("fr-hidden"),d()),a.css("left",n)}function s(e){a||function t(){r.shared.$quick_insert||(r.shared.$quick_insert=c(document.createElement("div")).attr("class","fr-quick-insert").html('<a class="fr-floating-btn" role="button" tabIndex="-1" title="'.concat(r.language.translate("Quick Insert"),'">').concat(r.icon.create("quickInsert"),"</a>")));a=r.shared.$quick_insert,r.tooltip.bind(r.$box,".fr-quick-insert > a.fr-floating-btn"),r.events.on("destroy",function(){c("body").first().append(a.removeClass("fr-on")),l&&(d(),c("body").first().append(l.css("left",-9999).css("top",-9999)))},!0),r.events.on("shared.destroy",function(){a.html("").removeData().remove(),a=null,l&&(l.html("").removeData().remove(),l=null)},!0),r.events.on("commands.before",o),r.events.on("commands.after",function(){r.popups.areVisible()||i()}),r.events.bindClick(r.$box,".fr-quick-insert > a",u),r.events.bindClick(r.$box,".fr-qi-helper > a.fr-btn",function(e){var t=c(e.currentTarget).data("cmd");if(!1===r.events.trigger("quickInsert.commands.before",[t]))return!1;p.QUICK_INSERT_BUTTONS[t].callback.apply(r,[e.currentTarget]),p.QUICK_INSERT_BUTTONS[t].undo&&r.undo.saveStep(),r.events.trigger("quickInsert.commands.after",[t]),r.quickInsert.hide()}),r.events.$on(r.$wp,"scroll",f),r.events.$on(r.$tb,"transitionend",".fr-more-toolbar",f)}(),a.hasClass("fr-on")&&d(),r.$box.append(a),n(e),a.data("tag",e),a.addClass("fr-visible")}function i(){if(r.core.hasFocus()){var e=r.selection.element();if(r.opts.enter==p.ENTER_BR||r.node.isBlock(e)||(e=r.node.blockParent(e)),r.opts.enter==p.ENTER_BR&&!r.node.isBlock(e)){var t=r.node.deepestParent(e);t&&(e=t)}var n=function n(){return r.opts.enter!=p.ENTER_BR&&r.node.isEmpty(e)&&0<=r.opts.quickInsertTags.indexOf(e.tagName.toLowerCase())},i=function i(){return r.opts.enter==p.ENTER_BR&&("BR"==e.tagName&&(!e.previousSibling||"BR"==e.previousSibling.tagName||r.node.isBlock(e.previousSibling))||r.node.isEmpty(e)&&(!e.previousSibling||"BR"==e.previousSibling.tagName||r.node.isBlock(e.previousSibling))&&(!e.nextSibling||"BR"==e.nextSibling.tagName||r.node.isBlock(e.nextSibling)))};e&&(n()||i())?a&&a.data("tag").is(c(e))&&a.hasClass("fr-on")?d():r.selection.isCollapsed()&&s(c(e)):o()}}function o(){a&&(a.hasClass("fr-on")&&d(),a.removeClass("fr-visible fr-on"),a.css("left",-9999).css("top",-9999))}function u(e){if(e&&e.preventDefault(),a.hasClass("fr-on")&&!a.hasClass("fr-hidden"))d();else{if(!r.shared.$qi_helper){for(var t=r.opts.quickInsertButtons,n='<div class="fr-qi-helper">',i=0,s=0;s<t.length;s++){var o=p.QUICK_INSERT_BUTTONS[t[s]];o&&(!o.requiredPlugin||p.PLUGINS[o.requiredPlugin]&&0<=r.opts.pluginsEnabled.indexOf(o.requiredPlugin))&&(n+='<a class="fr-btn fr-floating-btn" role="button" title="'.concat(r.language.translate(o.title),'" tabIndex="-1" data-cmd="').concat(t[s],'" style="transition-delay: ').concat(.025*i++,'s;">').concat(r.icon.create(o.icon),"</a>"))}n+="</div>",r.shared.$qi_helper=c(n),r.tooltip.bind(r.shared.$qi_helper,"a.fr-btn"),r.events.$on(r.shared.$qi_helper,"mousedown",function(e){e.preventDefault()},!0)}l=r.shared.$qi_helper,r.$box.append(l),setTimeout(function(){l.css("top",parseFloat(a.css("top"))),l.css("left",parseFloat(a.css("left"))+a.outerWidth()),l.find("a").addClass("fr-size-1"),a.addClass("fr-on")},10)}}function d(){var n=r.$box.find(".fr-qi-helper");n.length&&function(){for(var t=n.find("a"),e=0;e<t.length;e++)!function(e){setTimeout(function(){n.children().eq(t.length-1-e).removeClass("fr-size-1")},25*e)}(e);setTimeout(function(){n.css("left",-9999),a&&!a.hasClass("fr-hidden")&&a.removeClass("fr-on")},25*e)}()}function f(){a.hasClass("fr-visible")&&n(a.data("tag"))}return{_init:function e(){if(!r.$wp||!r.opts.quickInsertEnabled)return!1;r.popups.onShow("image.edit",o),r.events.on("mouseup",i),r.helpers.isMobile()&&r.events.$on(c(r.o_doc),"selectionchange",i),r.events.on("blur",o),r.events.on("keyup",i),r.events.on("keydown",function(){setTimeout(function(){i()},0)})},hide:o}}});
