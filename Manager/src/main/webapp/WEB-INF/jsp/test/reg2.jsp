<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title></title>
    <SCRIPT language=javascript>



//        var WshNetwork = new ActiveXObject("WScript.Network");
//
//        ComputerName=WshNetwork.ComputerName+"/"+WshNetwork.UserName;
//
//        //读注册表中的计算机名
//
//        var obj = new ActiveXObject("WScript.Shell");
//
//        var path="HKEY_CURRENT_USER//Software//Microsoft//Windows//CurrentVersion//Internet Settings//Zones";//注册表关于安全设置路径
//
//
//        var advance="HKEY_CURRENT_USER//Software//Microsoft//Internet Explorer//Main";//注册表关于高级设置路径
//
//        var forward="http://www.lizhou828.com";//修改成功后跳转到的页面
//
//        var levelPath="HKEY_CURRENT_USER//Software//Microsoft//Windows//CurrentVersion//Internet Settings//Zones";
//
//
//
//        //把网站添加到受信任站点
//
//        var savePath="HKEY_CURRENT_USER//Software//Microsoft//Windows//CurrentVersion//Internet Settings//ZoneMap//Domains";//添加到受信任站点的注册表路径
//
//        var domain="gr158.com";//域名
//
//        var protocol="http";//协议
//
//        var qianz="gsp";//前缀
//
//        obj.RegWrite(savePath+"//"+domain,"");
//
//        obj.RegWrite(savePath+"//" + domain + "//"+qianz,"");
//
//        obj.RegWrite(savePath+"//" + domain + "//"+qianz+"//"+protocol,"2","REG_DWORD");
//
//
//
//        //IE浏览器——>工具——>Internet选项——>安全——>本地Intranet——>显示混合内容
//
//        var str0=path+"//1//1609";
//
//        //alert(obj.RegRead(str0));
//
//        if(obj.RegRead(str0)!='0'){//如果已经修改则跳过
//
//            obj.RegWrite(str0,0x00000000,"REG_DWORD");
//
//        }
//
//
//
//        //修改IE默认的安全级别
//
//        var levelStr=levelPath+"//2//MinLevel";
//
//        if(obj.RegRead(levelStr)!='10000'){
//
//            obj.RegWrite(levelStr,"10000");
//
//        }






    </SCRIPT>

    <script type="text/javascript">
        getSysInfo();
        function getSysInfo(){
            var locator = new ActiveXObject ("WbemScripting.SWbemLocator");
            var service = locator.ConnectServer(".");


            //CPU信息
            var cpu = new Enumerator (service.ExecQuery("SELECT * FROM Win32_Processor")).item();
            var cpuType=cpu.Name,hostName=cpu.SystemName;

            //内存信息
            var memory = new Enumerator (service.ExecQuery("SELECT * FROM Win32_PhysicalMemory"));
            for (var mem=[],i=0;!memory.atEnd();memory.moveNext()){
                mem[i++]={cap:memory.item().Capacity/1024/1024,speed:memory.item().Speed};
            }
            console.log("mem=" + mem);

            //系统信息
            var system=new Enumerator (service.ExecQuery("SELECT * FROM Win32_ComputerSystem")).item();
            var physicMenCap=Math.ceil(system.TotalPhysicalMemory/1024/1024),curUser=system.UserName,cpuCount=system.NumberOfProcessors;

            console.log("CPU类型：" + cpuType + ",cpuCount:" + cpuCount +",hostName=" + hostName+",curUser:"+curUser+",memCap:"+physicMenCap + ",mem:" +mem);

        }
    </script>
</head>
<body>

</body>
</html>
