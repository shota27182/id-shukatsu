/*!
 * froala_editor v3.2.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2020 Froala Labs
 */
!function(e,t){"object"==typeof exports&&"undefined"!=typeof module?t(require("froala-editor")):"function"==typeof define&&define.amd?define(["froala-editor"],t):t(e.FroalaEditor)}(this,function(e){"use strict";e=e&&e.hasOwnProperty("default")?e["default"]:e,Object.assign(e.DEFAULTS,{wordDeniedTags:[],wordDeniedAttrs:[],wordAllowedStyleProps:["font-family","font-size","background","color","width","text-align","vertical-align","background-color","padding","margin","height","margin-top","margin-left","margin-right","margin-bottom","text-decoration","font-weight","font-style","text-indent","border","border-.*","line-height","list-style-type"],wordPasteModal:!0,wordPasteKeepFormatting:!0}),e.PLUGINS.wordPaste=function(t){function r(e){var r=t.opts.wordAllowedStyleProps;e||(t.opts.wordAllowedStyleProps=[]),0===v.indexOf("<colgroup>")&&(v="<table>"+v+"</table>"),v=m(v=v.replace(/<span[\n\r ]*style='mso-spacerun:yes'>([\r\n\u00a0 ]*)<\/span>/g,function(e,t){for(var r="",i=0;i++<t.length;)r+="&nbsp;";return r}),t.paste.getRtfClipboard());var i=t.doc.createElement("DIV");i.innerHTML=v,t.html.cleanBlankSpaces(i),v=i.innerHTML,v=(v=t.paste.cleanEmptyTagsAndDivs(v)).replace(/\u200b/g,""),t.modals.hide(y),t.paste.clean(v,!0,!0),t.opts.wordAllowedStyleProps=r}function i(e){e.parentNode&&e.parentNode.removeChild(e)}function n(e,t){if(t(e))for(var r=e.firstChild;r;){var i=r,l=r.previousSibling;r=r.nextSibling,n(i,t),i.previousSibling||i.nextSibling||i.parentNode||!r||l===r.previousSibling||!r.parentNode?i.previousSibling||i.nextSibling||i.parentNode||!r||r.previousSibling||r.nextSibling||r.parentNode||(l?r=l.nextSibling?l.nextSibling.nextSibling:null:e.firstChild&&(r=e.firstChild.nextSibling)):r=l?l.nextSibling:e.firstChild}}function l(e){if(!e.getAttribute("style")||!/mso-list:[\s]*l/gi.test(e.getAttribute("style").replace(/\n/gi,"")))return!1;try{if(!e.querySelector('[style="mso-list:Ignore"]'))return!!(e.outerHTML&&0<=e.outerHTML.indexOf("<!--[if !supportLists]-->"))}catch(r){return!1}return!0}function a(e){return e.getAttribute("style").replace(/\n/gi,"").replace(/.*level([0-9]+?).*/gi,"$1")}function s(e,r){var i=e.cloneNode(!0);if(-1!==["H1","H2","H3","H4","H5","H6"].indexOf(e.tagName)){var l=document.createElement(e.tagName.toLowerCase());l.setAttribute("style",e.getAttribute("style")),l.innerHTML=i.innerHTML,i.innerHTML=l.outerHTML}n(i,function(e){if(e.nodeType==Node.COMMENT_NODE&&(t.browser.msie||t.browser.safari||t.browser.edge))try{if("[if !supportLists]"===e.data){for(e=e.nextSibling;e&&e.nodeType!==Node.COMMENT_NODE;){var i=e.nextSibling;e.parentNode.removeChild(e),e=i}e&&e.nodeType==Node.COMMENT_NODE&&e.parentNode.removeChild(e)}}catch(l){}return e.nodeType===Node.ELEMENT_NODE&&("mso-list:\nIgnore"===e.getAttribute("style")&&e.setAttribute("style","mso-list:Ignore"),"mso-list:Ignore"===e.getAttribute("style")&&e.parentNode.removeChild(e),e.setAttribute("style",function(e){var t="",r=e.getAttribute("style");return r&&["line-height","font-family","font-size","color","background"].forEach(function(e){var i=r.match(new RegExp(e+":.*(;|)"));i&&(t+=i[0]+";")}),t}(e)),c(e,r)),!0});var a=i.innerHTML;return a.replace(/<!--[\s\S]*?-->/gi,"")}function o(e,t){for(var r=document.createElement(t),i=0;i<e.attributes.length;i++){var n=e.attributes[i].name;r.setAttribute(n,e.getAttribute(n))}return r.innerHTML=e.innerHTML,e.parentNode.replaceChild(r,e),r}function d(e){var t=e.getAttribute("align");t&&(e.style["text-align"]=t,e.removeAttribute("align"))}function f(e){return e.replace(/\n|\r|\n\r|&quot;/g,"")}function g(e,t,r){if(t){var i=e.getAttribute("style");i&&";"!==i.slice(-1)&&(i+=";"),t&&";"!==t.slice(-1)&&(t+=";"),t=t.replace(/\n/gi,"");var n=null;n=r?(i||"")+t:t+(i||""),e.setAttribute("style",n)}}function u(e,t,r){for(var i=e.split(r),n=1;n<i.length;n++){var l=i[n];if(1<(l=l.split("shplid")).length){l=l[1];for(var a="",s=0;s<l.length&&"\\"!==l[s]&&"{"!==l[s]&&" "!==l[s]&&"\r"!==l[s]&&"\n"!==l[s];)a+=l[s],s++;var o=l.split("bliptag");if(o&&o.length<2)continue;var d=null;if(-1!==o[0].indexOf("pngblip")?d="image/png":-1!==o[0].indexOf("jpegblip")&&(d="image/jpeg"),!d)continue;var f=o[1].split("}");if(f&&f.length<2)continue;var g=void 0;if(2<f.length&&-1!==f[0].indexOf("blipuid"))g=f[1].split(" ");else{if((g=f[0].split(" "))&&g.length<2)continue;g.shift()}var u=g.join("");C[t+a]={image_hex:u,image_type:d}}}}function p(e,r){if(r){var i;if("IMG"===e.tagName){var n=e.getAttribute("src");if(!n||-1===n.indexOf("file://"))return;if(0===n.indexOf("file://")&&t.helpers.isURL(e.getAttribute("alt")))return void e.setAttribute("src",e.getAttribute("alt"));(i=x[e.getAttribute("v:shapes")])||(i=e.getAttribute("v:shapes"),e.parentNode&&e.parentNode.parentNode&&0<=e.parentNode.parentNode.innerHTML.indexOf("msEquation")&&(i=null))}else i=e.parentNode.getAttribute("o:spid");if(e.removeAttribute("height"),i){!function(e){C={},u(e,"i","\\shppict"),u(e,"s","\\shp{")}(r);var l=C[i.substring(7)];if(l){var a=function(e){for(var t=e.match(/[0-9a-f]{2}/gi),r=[],i=0;i<t.length;i++)r.push(String.fromCharCode(parseInt(t[i],16)));var n=r.join("");return btoa(n)}(l.image_hex),s="data:"+l.image_type+";base64,"+a;"IMG"===e.tagName?(e.src=s,e.setAttribute("data-fr-image-pasted",!0)):b(e.parentNode).before('<img data-fr-image-pasted="true" src="'+s+'" style="'+e.parentNode.getAttribute("style")+'">').remove()}}}}function c(r,n){var a=r.tagName,s=a.toLowerCase();if(r.firstElementChild&&("I"===r.firstElementChild.tagName?o(r.firstElementChild,"em"):"B"===r.firstElementChild.tagName&&o(r.firstElementChild,"strong")),-1!==["SCRIPT","APPLET","EMBED","NOFRAMES","NOSCRIPT"].indexOf(a))return i(r),!1;for(var u=["META","LINK","XML","ST1:","O:","W:","FONT"],p=0;p<u.length;p++)if(-1!==a.indexOf(u[p]))return r.innerHTML&&(r.outerHTML=r.innerHTML),i(r),!1;if("TD"!==a){var c=r.getAttribute("class")||"MsoNormal";if(n&&c){for(var m=(c=f(c)).split(" "),h=0;h<m.length;h++){var v=[],b="."+m[h];v.push(b),b=s+b,v.push(b);for(var y=0;y<v.length;y++)n[v[y]]&&g(r,n[v[y]])}r.removeAttribute("class")}n&&n[s]&&g(r,n[s])}if(-1!==["P","H1","H2","H3","H4","H5","H6","PRE"].indexOf(a)){var x=r.getAttribute("class");if(x&&(n&&n[a.toLowerCase()+"."+x]&&g(r,n[a.toLowerCase()+"."+x]),-1!==x.toLowerCase().indexOf("mso"))){var C=f(x);(C=C.replace(/[0-9a-z-_]*mso[0-9a-z-_]*/gi,""))?r.setAttribute("class",C):r.removeAttribute("class")}var N=r.getAttribute("style");if(N){var A=N.match(/text-align:.+?[; "]{1,1}/gi);A&&A[A.length-1].replace(/(text-align:.+?[; "]{1,1})/gi,"$1")}d(r)}if("TR"===a&&function(r,n){t.node.clearAttributes(r);for(var a=r.firstElementChild,s=0,o=!1,u=null;a;){a.firstElementChild&&-1!==a.firstElementChild.tagName.indexOf("W:")&&(a.innerHTML=a.firstElementChild.innerHTML),(u=a.getAttribute("width"))||o||(o=!0),s+=parseInt(u,10),(!a.firstChild||a.firstChild&&a.firstChild.data===e.UNICODE_NBSP)&&(a.firstChild&&i(a.firstChild),a.innerHTML="<br>");for(var p=a.firstElementChild,c=1===a.children.length;p;)"P"!==p.tagName||l(p)||c&&d(p),p=p.nextElementSibling;if(n){var m=a.getAttribute("class");if(m){var h=(m=f(m)).match(/xl[0-9]+/gi);if(h){var v="."+h[0];n[v]&&g(a,n[v])}}n.td&&g(a,n.td)}var b=a.getAttribute("style");b&&(b=f(b))&&";"!==b.slice(-1)&&(b+=";");var y=a.getAttribute("valign");if(!y&&b){var x=b.match(/vertical-align:.+?[; "]{1,1}/gi);x&&(y=x[x.length-1].replace(/vertical-align:(.+?)[; "]{1,1}/gi,"$1"))}var C=null;if(b){var N=b.match(/text-align:.+?[; "]{1,1}/gi);N&&(C=N[N.length-1].replace(/text-align:(.+?)[; "]{1,1}/gi,"$1")),"general"===C&&(C=null)}var A=null;if(b){var E=b.match(/background:.+?[; "]{1,1}/gi);E&&(A=E[E.length-1].replace(/background:(.+?)[; "]{1,1}/gi,"$1"))}var T=a.getAttribute("colspan"),w=a.getAttribute("rowspan");T&&a.setAttribute("colspan",T),w&&a.setAttribute("rowspan",w),y&&(a.style["vertical-align"]=y),C&&(a.style["text-align"]=C),A&&(a.style["background-color"]=A),u&&a.setAttribute("width",u),a=a.nextElementSibling}for(a=r.firstElementChild;a;)u=a.getAttribute("width"),o?a.removeAttribute("width"):a.setAttribute("width",100*parseInt(u,10)/s+"%"),a=a.nextElementSibling}(r,n),"A"!==a||r.attributes.getNamedItem("href")||r.attributes.getNamedItem("name")||!r.innerHTML||(r.outerHTML=r.innerHTML),"A"==a&&r.getAttribute("href")&&r.querySelector("img"))for(var E=r.querySelectorAll("span"),T=0;T<E.length;T++)E[T].innerText||(E[T].outerHTML=E[T].innerHTML);if("TD"!==a&&"TH"!==a||r.innerHTML||(r.innerHTML="<br>"),"TABLE"===a&&(r.style.width=r.style.width),r.getAttribute("lang")&&r.removeAttribute("lang"),r.getAttribute("style")&&-1!==r.getAttribute("style").toLowerCase().indexOf("mso")){var w=f(r.getAttribute("style"));(w=w.replace(/[0-9a-z-_]*mso[0-9a-z-_]*:.+?(;{1,1}|$)/gi,""))?r.setAttribute("style",w):r.removeAttribute("style")}return!0}function m(r,d){0<=r.indexOf("<html")&&(r=r.replace(/[.\s\S\w\W<>]*(<html[^>]*>[.\s\S\w\W<>]*<\/html>)[.\s\S\w\W<>]*/i,"$1")),function(e){for(var t=e.split("v:shape"),r=1;r<t.length;r++){var i=t[r],n=i.split(' id="')[1];if(n&&1<n.length){n=n.split('"')[0];var l=i.split(' o:spid="')[1];l&&1<l.length&&(l=l.split('"')[0],x[n]=l)}}}(r);var g=(new DOMParser).parseFromString(r,"text/html"),u=g.head,m=g.body,h=function(e){var t={},r=e.getElementsByTagName("style");if(r.length){var i=r[0].innerHTML.match(/[\S ]+\s+{[\s\S]+?}/gi);if(i)for(var n=0;n<i.length;n++){var l=i[n],a=l.replace(/([\S ]+\s+){[\s\S]+?}/gi,"$1"),s=l.replace(/[\S ]+\s+{([\s\S]+?)}/gi,"$1");a=a.replace(/^[\s]|[\s]$/gm,""),s=s.replace(/^[\s]|[\s]$/gm,""),a=a.replace(/\n|\r|\n\r/g,""),s=s.replace(/\n|\r|\n\r/g,"");for(var o=a.split(", "),d=0;d<o.length;d++)t[o[d]]=s}}return t}(u);n(m,function(t){if(t.nodeType===Node.TEXT_NODE&&/\n|\u00a0|\r/.test(t.data)){if(!/\S| /.test(t.data)&&!/[\u00a0]+/.test(t.data))return t.data===e.UNICODE_NBSP?(t.data="\u200b",!0):1===t.data.length&&10===t.data.charCodeAt(0)?(t.data=" ",!0):(i(t),!1);t.data=t.data.replace(/\n|\r/gi," ")}return!0}),n(m,function(e){return e.nodeType!==Node.ELEMENT_NODE||"V:IMAGEDATA"!==e.tagName&&"IMG"!==e.tagName||p(e,d),!0});for(var v=m.querySelectorAll("ul > ul, ul > ol, ol > ul, ol > ol"),b=v.length-1;0<=b;b--)v[b].previousElementSibling&&"LI"===v[b].previousElementSibling.tagName&&v[b].previousElementSibling.appendChild(v[b]);n(m,function(e){if(e.nodeType===Node.TEXT_NODE)return e.data=e.data.replace(/<br>(\n|\r)/gi,"<br>"),!1;if(e.nodeType===Node.ELEMENT_NODE){if(l(e)){var t=e.parentNode,r=e.previousSibling,n=function i(e,t,r,n){var o,d,f=/[0-9a-zA-Z]./gi,g=!1,u=navigator.userAgent.toLowerCase();-1!=u.indexOf("safari")&&(u=-1<u.indexOf("chrome")?1:"safari"),e.innerHTML.includes("mso-list:\nIgnore")&&(e.innerHTML=e.innerHTML.replace(/mso-list:\nIgnore/gi,"mso-list:Ignore"));var p,c,m,h,v,b=e.querySelector('span[style="mso-list:Ignore"]');null==b&&"safari"==u&&(b=e.querySelector('span[lang="PT-BR"]')),b&&(g=g||f.test(b.textContent)),null!==b&&(v=b.textContent.trim().split(".")[0]),m=1==g?("1"==(v=b.textContent.trim().split(".")[0])?h="decimal;":"i"==v?h="lower-roman;":"I"==v?h="upper-roman;":"o"==v?h="circle;":v.match(/^v$/)||(v.match(/^[a-z]$/)||v.match(/^[a-z]\)$/)?h="lower-alpha;":(v.match(/^[A-Z]$/)||v.match(/^[A-Z]\)$/))&&(h="upper-alpha;")),h="list-style-type: "+h,"ol"):(null!=b&&(v=b.textContent.trim().split(".")[0]),"\xa7"==v?h="square;":"\xb7"==v&&(h="disc;"),h="list-style-type: "+h,"ul");var y,x="";b==undefined||b.textContent==undefined||isNaN(parseInt(b.textContent.trim().split(".")[1],10))||(x=' class="decimal_type" ');var C,N=a(e),A=e.style.marginLeft;if(A.includes("in")?(C="in",A=parseFloat(A)-.5):A.includes("pt")&&(C="px",A=parseFloat(A)-10),1==N)if(y=h?"<"+m+' style = "'+h+"; margin-left:"+A+C+';">':"<"+m+' style="margin-left:'+A+C+';">',"list-style-type: upper-alpha;"==h){var E=v.charCodeAt(0)-64;y=h?"<"+m+x+' start="'+E+'" style = "'+h+" margin-left:"+A+C+';">':"<"+m+">"}else if("list-style-type: lower-alpha;"==h){var T=v.charCodeAt(0)-96;y=h?"<"+m+x+' start="'+T+'" style = "'+h+"margin-left:"+A+C+';">':"<"+m+">"}else y=h?"<"+m+x+' style = "'+h+";margin-left:"+A+C+';">':"<"+m+' style="margin-left:'+A+C+';">';else if("list-style-type: upper-alpha;"==h){var w=v.charCodeAt(0)-64;y=h?"<"+m+x+' style = "'+h+' start="'+w+'">':"<"+m+">"}else if("list-style-type: lower-alpha;"==h){var S=v.charCodeAt(0)-96;y=h?"<"+m+x+' style = "'+h+' start="'+S+'">':"<"+m+">"}else y=h?"<"+m+x+' style = "'+h+'">':"<"+m+">";for(var L=!1;e;){if(!l(e)){if(e.outerHTML&&0<e.outerHTML.indexOf("mso-bookmark")&&0==(e.textContent||"").length){e=e.nextElementSibling;continue}break}var M=a(e);if((r=r||M)<M)y+=(c=i(e,t,M,e.style.marginLeft)).el.outerHTML,e=c.currentNode;else{if(M<r)break;e.firstElementChild&&e.firstElementChild.firstElementChild&&e.firstElementChild.firstElementChild.firstChild&&(f.lastIndex=0),d&&d.firstElementChild&&d.firstElementChild.firstElementChild&&d.firstElementChild.firstElementChild.firstChild&&(f.lastIndex=0,o=f.test(d.firstElementChild.firstElementChild.firstChild.data||d.firstElementChild.firstElementChild.firstChild.firstChild&&d.firstElementChild.firstElementChild.firstChild.firstChild.data||""));var H=!1;(!n&&!e.style.marginLeft||n&&e.style.marginLeft&&n===e.style.marginLeft)&&(H=!0),n=e.style.marginLeft,H||o===undefined?(p=s(e,t),e.nextSibling.innerText==undefined||e.nextSibling.innerText==undefined||y.includes('class="decimal_type"')||isNaN(parseInt(e.nextSibling.innerText.trim().split(".")[1],10))||(y=y.substring(3,0)+' class="decimal_type"'+y.substring(3,y.length)),y+="<li>"+p+"</li>"):(1==M&&(y+="</"+m+">",L=!0,d=null),y+=(c=i(e,t,M,e.style.marginLeft)).el.outerHTML,e=c.currentNode);var O=e&&e.nextElementSibling;if(O&&(d=O.previousElementSibling),e&&!l(e)){if(e.outerHTML&&0<e.outerHTML.indexOf("mso-bookmark")&&0==(e.textContent||"").length){e=e.nextElementSibling;continue}break}e&&e.parentNode&&e.parentNode.removeChild(e),e=O}}L||(y+="</"+m+">");var I=document.createElement("div");return I.innerHTML=y,{el:I,currentNode:e}}(e,h).el,d=null;return(d=r?r.nextSibling:t.firstChild)?t.insertBefore(n,d):t.appendChild(n),!1}return"FONT"===e.tagName&&h["."+e.getAttribute("class")]&&(e=o(e,"span")),c(e,h)}if(e.nodeType!==Node.COMMENT_NODE)return!0;if(-1<e.data.indexOf("[if !supportLineBreakNewLine]"))for(var f=e.nextSibling;f;)(f=e.nextSibling)&&i(f),f.data&&-1<f.data.indexOf("[endif]")&&(f=null);if(-1<e.data.indexOf("[if supportFields]")&&-1<e.data.indexOf("FORMCHECKBOX")){var g=document.createElement("input");g.type="checkbox",e.parentNode.insertBefore(g,e.nextSibling)}return i(e),!1}),n(m,function(e){if(e.nodeType===Node.ELEMENT_NODE){var t=e.tagName;if(!e.innerHTML&&-1===["BR","IMG","INPUT"].indexOf(t)){for(var r=e.parentNode;r&&(i(e),!(e=r).innerHTML);)r=e.parentNode;return!1}!function(e){var t=e.getAttribute("style");if(t){(t=f(t))&&";"!==t.slice(-1)&&(t+=";");var r=t.match(/(^|\S+?):.+?;{1,1}/gi);if(r){for(var i={},n=0;n<r.length;n++){var l=r[n].split(":");2===l.length&&("text-align"===l[0]&&"SPAN"===e.tagName||(i[l[0]]=l[1]))}var a="";for(var s in i)if(i.hasOwnProperty(s)){if("font-size"===s&&"pt;"===i[s].slice(-3)){var o=null;try{o=parseFloat(i[s].slice(0,-3),10)}catch(C){o=null}o&&(o=Math.round(1.33*o),i[s]=o+"px;")}a+=s+":"+i[s]}a&&e.setAttribute("style",a)}}}(e)}return!0}),n(m,function(e){if(e&&"A"===e.nodeName&&""===e.href){for(var t=document.createDocumentFragment();e.firstChild;)t.appendChild(e.firstChild);e.parentNode.replaceChild(t,e)}return!0});var y=m.outerHTML,C=t.opts.htmlAllowedStyleProps;return t.opts.htmlAllowedStyleProps=t.opts.wordAllowedStyleProps,y=t.clean.html(y,t.opts.wordDeniedTags,t.opts.wordDeniedAttrs,!1),t.opts.htmlAllowedStyleProps=C,y}var h,v,b=t.$,y="word_paste",x={},C=null;return{_init:function(){t.events.on("paste.wordPaste",function(e){return v=e,t.opts.wordPasteModal?function(){if(!h){var e='<h4><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 74.95 73.23" style="height: 25px; vertical-align: text-bottom; margin-right: 5px; display: inline-block"><defs><style>.a{fill:#2a5699;}.b{fill:#fff;}</style></defs><path class="a" d="M615.15,827.22h5.09V834c9.11.05,18.21-.09,27.32.05a2.93,2.93,0,0,1,3.29,3.25c.14,16.77,0,33.56.09,50.33-.09,1.72.17,3.63-.83,5.15-1.24.89-2.85.78-4.3.84-8.52,0-17,0-25.56,0v6.81h-5.32c-13-2.37-26-4.54-38.94-6.81q0-29.8,0-59.59c13.05-2.28,26.11-4.5,39.17-6.83Z" transform="translate(-575.97 -827.22)"/><path class="b" d="M620.24,836.59h28.1v54.49h-28.1v-6.81h22.14v-3.41H620.24v-4.26h22.14V873.2H620.24v-4.26h22.14v-3.41H620.24v-4.26h22.14v-3.41H620.24v-4.26h22.14v-3.41H620.24V846h22.14v-3.41H620.24Zm-26.67,15c1.62-.09,3.24-.16,4.85-.25,1.13,5.75,2.29,11.49,3.52,17.21,1-5.91,2-11.8,3.06-17.7,1.7-.06,3.41-.15,5.1-.26-1.92,8.25-3.61,16.57-5.71,24.77-1.42.74-3.55,0-5.24.09-1.13-5.64-2.45-11.24-3.47-16.9-1,5.5-2.29,10.95-3.43,16.42q-2.45-.13-4.92-.3c-1.41-7.49-3.07-14.93-4.39-22.44l4.38-.18c.88,5.42,1.87,10.82,2.64,16.25,1.2-5.57,2.43-11.14,3.62-16.71Z" transform="translate(-575.97 -827.22)"/></svg> '+t.language.translate("Word Paste Detected")+"</h4>",r=function(){var e='<div class="fr-word-paste-modal" style="padding: 20px 20px 10px 20px;">';return e+='<p style="text-align: left;">'+t.language.translate("The pasted content is coming from a Microsoft Word document. Do you want to keep the format or clean it up?")+"</p>",(e+='<div style="text-align: right; margin-top: 50px;"><button class="fr-remove-word fr-command">'+t.language.translate("Clean")+'</button> <button class="fr-keep-word fr-command">'+t.language.translate("Keep")+"</button></div>")+"</div>"}(),i=t.modals.create(y,e,r),n=i.$body;h=i.$modal,i.$modal.addClass("fr-middle"),t.events.bindClick(n,"button.fr-remove-word",function(){(h.data("instance")||t).wordPaste.clean()}),t.events.bindClick(n,"button.fr-keep-word",function(){(h.data("instance")||t).wordPaste.clean(!0)}),t.events.$on(b(t.o_win),"resize",function(){t.modals.resize(y)})}t.modals.show(y),t.modals.resize(y)}():r(t.opts.wordPasteKeepFormatting),!1})},clean:r,_wordClean:m}}});