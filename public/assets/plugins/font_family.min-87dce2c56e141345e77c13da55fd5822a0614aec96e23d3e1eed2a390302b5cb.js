/*!
 * froala_editor v3.2.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2020 Froala Labs
 */


!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?t(require("froala-editor")):"function"==typeof define&&define.amd?define(["froala-editor"],t):t(e.FroalaEditor)}(this,function(e){"use strict";e=e&&e.hasOwnProperty("default")?e["default"]:e,Object.assign(e.DEFAULTS,{fontFamily:{"Arial,Helvetica,sans-serif":"Arial","Georgia,serif":"Georgia","Impact,Charcoal,sans-serif":"Impact","Tahoma,Geneva,sans-serif":"Tahoma","Times New Roman,Times,serif,-webkit-standard":"Times New Roman","Verdana,Geneva,sans-serif":"Verdana"},fontFamilySelection:!1,fontFamilyDefaultSelection:"Font Family"}),e.PLUGINS.fontFamily=function(o){var i=o.$;function r(e){var t=e.replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'| /g,"").split(",");return i(this).grep(t,function(e){return 0<e.length})}function f(e,t){for(var n=0;n<e.length;n++)for(var a=0;a<t.length;a++)if(e[n].toLowerCase()===t[a].toLowerCase())return[n,a];return null}function n(){var e=r(i(o.selection.element()).css("font-family")),t=[];for(var n in o.opts.fontFamily)if(o.opts.fontFamily.hasOwnProperty(n)){var a=f(e,r(n));a&&t.push([n,a])}return 0===t.length?null:(t.sort(function(e,t){var n=e[1][0]-t[1][0];return 0===n?e[1][1]-t[1][1]:n}),t[0][0])}return{apply:function t(e){o.format.applyStyle("font-family",e)},refreshOnShow:function a(e,t){t.find(".fr-command.fr-active").removeClass("fr-active").attr("aria-selected",!1),t.find('.fr-command[data-param1="'.concat(n(),'"]')).addClass("fr-active").attr("aria-selected",!0)},refresh:function l(e){if(o.opts.fontFamilySelection){var t=i(o.selection.element()).css("font-family").replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'|/g,"").split(",");e.find("> span").text(o.opts.fontFamily[n()]||t[0]||o.language.translate(o.opts.fontFamilyDefaultSelection))}}}},e.RegisterCommand("fontFamily",{type:"dropdown",displaySelection:function(e){return e.opts.fontFamilySelection},defaultSelection:function(e){return e.opts.fontFamilyDefaultSelection},displaySelectionWidth:120,html:function(){var e='<ul class="fr-dropdown-list" role="presentation">',t=this.opts.fontFamily;for(var n in t)t.hasOwnProperty(n)&&(e+='<li role="presentation"><a class="fr-command" tabIndex="-1" role="option" data-cmd="fontFamily" data-param1="'.concat(n,'" \n        style="font-family: ').concat(n,'" title="').concat(t[n],'">').concat(t[n],"</a></li>"));return e+="</ul>"},title:"Font Family",callback:function(e,t){this.fontFamily.apply(t)},refresh:function(e){this.fontFamily.refresh(e)},refreshOnShow:function(e,t){this.fontFamily.refreshOnShow(e,t)},plugin:"fontFamily"}),e.DefineIcon("fontFamily",{NAME:"font",SVG_KEY:"fontFamily"})});
