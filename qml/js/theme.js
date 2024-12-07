(function() {
    var css = ".footer-bar {\n height: 0 !important;} \n\n\n .leaflet-control-attribution {\n display: none !important;} \n\n\n .label-time {\n font-size: 26px !important; \n font-weight: bold !important; \n padding-top: 8px; \n padding-left: 9px; } \n\n\n body {\n overflow: hidden !important; touch-action: pan-x; touch-action: pan-y; }\n\n";
    
    if (typeof GM_addStyle != "undefined") {
        GM_addStyle(css);
    } else if (typeof PRO_addStyle != "undefined") {
        PRO_addStyle(css);
    } else if (typeof addStyle != "undefined") {
        addStyle(css);
    } else {
        var node = document.createElement("style");
        node.type = "text/css";
        node.appendChild(document.createTextNode(css));
        var heads = document.getElementsByTagName("head");
        if (heads.length > 0) {
            heads[0].appendChild(node);
        } else {
            document.documentElement.appendChild(node);
        }
    }
})();