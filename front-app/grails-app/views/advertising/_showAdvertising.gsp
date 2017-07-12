<style>
.outer{
    position:relative;
}
    .inner{
        bottom: 11%;
        height: auto;
        position: absolute;
        right: 58.8%;
        width: 4.6%;
    }
    #code canvas{ width: 100%;
    height: 100%;}
</style>
<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">随行付</h4>
</div>
<div class="modal-body" style="overflow-x: scroll">
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        %{--<input type="hidden" id="hiddenUrl" value="${responseUrl}"/>--}%
        <g:set var="imgPath" value="${imgPath}"/>
        <div>
            <img class="outer" style="width: 100%;height: auto" src="<g:createLink controller="home" action="viewImage" params="[title: imgPath]"/>">
            %{--<div id="code" class="inner"></div>--}%
        </div>

    </portlet:body>
</component:portlet>
    <div class="modal-footer"></div>
</div>
<script type="text/javascript">
//    $(function(){
//        var postUrl = $("#hiddenUrl").val();
//        postUrl = toUtf8(postUrl.replace(/\"/g,""));
//        $('#code').qrcode({width:130,height:130,correctLevel:0,text:postUrl});
//    })
//    //解决中文乱码
//    function toUtf8(str) {
//        var out, i, len, c;
//        out = "";
//        len = str.length;
//        for(i = 0; i < len; i++) {
//            c = str.charCodeAt(i);
//            if ((c >= 0x0001) && (c <= 0x007F)) {
//                out += str.charAt(i);
//            } else if (c > 0x07FF) {
//                out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
//                out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));
//                out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
//            } else {
//                out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));
//                out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
//            }
//        }
//        return out;
//    }
</script>