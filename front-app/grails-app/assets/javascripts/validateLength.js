/**
 * Created by wangyu on 16/10/24.
 */

/**
 * @description 获取输入项的字节数
 * @author wangyu
 * @param str
 * @param maxLen
 * @constructor
 */
function WidthCheck(str, maxLen){
    var w = 0;
    var tempCount = 0;
    //length 获取字数数，不区分汉子和英文
    for (var i=0; i<str.value.length; i++) {
        //charCodeAt()获取字符串中某一个字符的编码
        var c = str.value.charCodeAt(i);
        //单字节加1
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {
            w++;
        }
        else {
            w+=2;
        }
        if (w > maxLen) {
            str.value = str.value.substr(0,i);
            break;
        }
    }
}