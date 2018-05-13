<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <%--修改注册表来修改IE的设置---资料汇总 https://blog.csdn.net/wangqiulin123456/article/details/17068649--%>
    <script type="text/javascript">

//        modifyInternetSettingsZones(1); //本地Internet
        modifyInternetSettingsZones(2); //可信站点
        alert("2可信站点设置完毕!");

        modifyInternetSettingsZones(3); //Internet    完全可以用JS修改，不用手动修改浏览器中的配置，
         alert("3Internet设置完毕!");


        /**
         // . Internet自定义级别的修改：
         //         HKEY_CURRENT_USER/SoftWare/Microsoft/Windows/CurrentVersion/Internet  Settings /Zones下
         //            0：我的电脑
         //            1：本地Internet
         //            2：可信站点
         //            3：Internet        ActiveX控件和插件的设置，依次为：1405（301），1201（301），1004（301），1001（301），1200（65536，（301））
         //            4：受限站点
        * @param _zoneLevel
        */
        function modifyInternetSettingsZones(_zoneLevel){
            if(null == _zoneLevel || "" == _zoneLevel || typeof _zoneLevel ==  "undefined"){
                console.error("Invalid zone level：" + _zoneLevel);
                return;
            }
            if(0 != _zoneLevel && 1 != _zoneLevel && 2 != _zoneLevel && 3 != _zoneLevel && 4 != _zoneLevel){
                console.error("Zone level is not exists:" + _zoneLevel);
                return;
            }
            if(!isActiveObjectOpen()){
                console.error("暂时无法使用js调用ActiveObject");
                return;
            }

            var path = "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings";//注册表关于安全设置路径

            var advance = "HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\Main";//注册表关于高级设置路径
            var levelPath = "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Zones";
            var zspath = "HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\WinTrust\\Trust Providers\\Software Publishing";



            try{
                var obj = new ActiveXObject("WScript.Shell");
                if(null == obj){
                    console.error("Cant't get ActiveXObject!");
                    return;
                }

                if(2 == _zoneLevel){
                    //TODO : 添加删除受信任站点
                    ///HKEY_CURRENT_USER/SoftWare/Microsoft/Windows/CurrentVersion/Internet  Settings/ZoneMap/Ranges下有一个信任站点就有一个RangeN（N为1,2,3...）的记录

                    obj.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range100\\","");
                    obj.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range100\\http","2","REG_DWORD");
                    obj.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Ranges\\Range100\\:Range","192.168.2.231");

                    obj.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\com","");
                    obj.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\com\\gr158","");
                    obj.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\ZoneMap\\Domains\\com\\gr158\\http","2","REG_DWORD");
                }



                //IE浏览器——>工具——>Internet选项——>安全——>Internet——>ActiveX 控件自动提示
                var str1 = path+"\\Zones\\" + _zoneLevel + "\\2201";
                if(obj.RegRead(str1)!='0'){
                    obj.RegWrite(str1,0x00000000,"REG_DWORD");
                    alert("ActiveX 控件自动提示");
                }
                //IE浏览器——>工具——>Internet选项——>安全——>Internet——>对标记为可安全执行脚本的 ActiveX 控件执行脚本
                var str2 = path+"\\Zones\\" + _zoneLevel + "\\1405";
                if(obj.RegRead(str2)!='0'){
//                注意：除非另外声明，否则每个 DWORD 值等于 0、1 或 3。通常，设置为 0 则将具体操作设置为允许；设置为 1 则导致出现提示；设置为 3 则禁止执行具体操作。
                    obj.RegWrite(str2,0x00000000,"REG_DWORD");
                    alert("对标记为可安全执行脚本的 ActiveX 控件执行脚本");
                }
                var str3 = path+"\\Zones\\" + _zoneLevel + "\\1201";
                if(obj.RegRead(str3)!='0'){
                    obj.RegWrite(str3,0x00000000,"REG_DWORD");
                    alert("对没有标记为可安全执行脚本的 ActiveX 控件进行初始化和脚本运行");
                }
                var str4 = path+"\\Zones\\" + _zoneLevel + "\\1207";
                if(obj.RegRead(str4)!='0'){
                    //1207     保留 # 1208     ActiveX 控件和插件：允许以前未使用的 ActiveX 控件在没有提示的情况下运行
                    obj.RegWrite(str4,0x00000000,"REG_DWORD");
                    alert("允许以前未使用的 ActiveX 控件在没有提示的情况下运行");
                }

                var str5 = path+"\\Zones\\" + _zoneLevel + "\\1200";
                if(obj.RegRead(str5)!='0'){
                    obj.RegWrite(str5,0x00000000,"REG_DWORD");
                    alert("运行 ActiveX 控件和插件");
                }

                //IE浏览器——>工具——>Internet选项——>安全——>Internet——>下载已签名的 ActiveX 控件
                var str6 = path+"\\Zones\\" + _zoneLevel + "\\1001";
                if(obj.RegRead(str6)!='0'){
                    obj.RegWrite(str6,0x00000000,"REG_DWORD");
                    alert("下载已签名的 ActiveX 控件");
                }
                //IE浏览器——>工具——>Internet选项——>安全——>Internet——>下载未签名的 ActiveX 控件
                var str7 = path+"\\Zones\\" + _zoneLevel + "\\1004";
                if(obj.RegRead(str7)!='0'){
                    obj.RegWrite(str7,0x00000000,"REG_DWORD");
                    alert("下载未签名的 ActiveX 控件");
                }


//            将文件上载到服务器时包含本地目录路径  （3＝禁用、0＝启用 XP+IE6不存在此项）；
                try{
                    var str8 = path+"\\Zones\\" + _zoneLevel + "\\160A";
                    if(obj.RegRead(str8)!='0'){
                        obj.RegWrite(str8,0x00000000,"REG_DWORD");
                        alert("将文件上载到服务器时包含本地目录路径");
                    }
                }catch(e) {
                    console.error(e.name + ","+ e.message);
                }

            }catch(e){
                alert("请将您浏览器Internet选项中的“对没有标记为安全的ActiveX控件进行初始化和脚本运行”设置为“启用”！然后刷新本页登陆！" );
                console.error( e.name + ","+ e.message);
            }
        }

        /**
        *   预先判断是否能够使用JS调用ActiveXObject的环境
        * @returns {boolean}
        */
        function isActiveObjectOpen(){
            try{
                var obj = new ActiveXObject("WScript.Shell");
                if(null == obj){
                    console.error("Cant't get ActiveXObject!");
                    return false;
                }else{
                    return true
                }
            }catch(e){
                alert("请将IE浏览器Internet选项中的“对没有标记为安全的ActiveX控件进行初始化和脚本运行”设置为“启用”！然后刷新本页！" );
                console.error( e.name + ","+ e.message);
                return false;
            }
        }
    </script>
</head>
<body>
hello Reg ！


</body>
</html>
