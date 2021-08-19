<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataAcess.aspx.cs" Inherits="DataAcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery.min.js"></script>
    <script src="js/client_captcha.js"></script>
    <script>
        function getdata(tp) {
            if (tp == "Local_Json") {
                $.ajax({
                    url: "data/ceshi.json",//json檔案位置
                    type: "GET",//請求方式為get
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json", //返回資料格式為json
                    success: function (data) {//請求成功完成後要執行的方法 
                        //each迴圈 使用$.each方法遍歷返回的資料date
                        $.each(data.first, function(key,val) {
                            var str=str+'<li id="' + key + '">' + val + '</li>';
                            document.write(str);
                        });
						$("#show").html(str);
                    }
                })
            }
            else if (tp == "Json") {
                $.ajax({
                    url: "https://ws.kinmen.gov.tw/001/Upload/0/relfile/0/0/92b4584c-f454-4bd5-a75f-818dcf901f32.json",//json檔案位置
                    type: "GET",//請求方式為get
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    dataType: "json", //返回資料格式為json
					success:function(data){
					$.each(data,function(key,val){
						var str=str+'<li id="' + key + '">' + val + '</li>';
					});
					str=str+"</ul>";
					$("#show").html(str);
					}
				})
            }
        }
    </script>

</head>
<body>
	<div id="show"></div>
    <input id="Button1" type="button" value="button" onclick="getdata('Local_Json')"/></br>
    <input id="Button2" type="button" value="button" onclick="getdata('Json')"/>
</body>
</html>
