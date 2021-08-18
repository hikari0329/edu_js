<%@ Page Language="C#" %>

<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.Linq" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        if (Request["mode"] == "send")
        {
            try
            {
                //LINQ way
                XDocument xd =
                    XDocument.Load(new StreamReader(Request.InputStream));
                xd.Root.Add(new XElement("Mark", "Inserted by ASP.NET 3.5"));
                Response.Write(xd.ToString());

                /* Traditional Way
                XmlDocument xd2 = new XmlDocument();
                xd2.Load(Request.InputStream);
                XmlElement xe = xd2.CreateElement("Mark");
                xe.InnerText = "Inserted by ASP.NET 2.0";
                xd2.DocumentElement.AppendChild(xe);
                Response.Write(xd2.OuterXml);
                */
                Response.ContentType = "text/xml";
            }
            catch (Exception ex)
            {
                //return text, raise $.ajax error event
                Response.ContentType = "text/plain";
                Response.Write(ex.Message);
            }
            Response.End();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>jQuery Post XML Sample</title>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function postXml(url, xmlSrc, callback) {
            var xmlString = jQuery.isXMLDoc(xmlSrc) ? xmlSrc.xml || (new XMLSerializer()).serializeToString(xmlSrc) : xmlSrc;
            $.ajax({
                url: url,
                type: "POST",
                contentType: "text/xml",
                data: xmlString,
                dataType: "xml",
                success: function (x) { callback(x); },
                error: function (xhr, textStatus, thrownError) {
                    alert("Error:" + xhr.responseText);
                },
                processData: false
            });
        }
        $(function () {
            $("#btnSend").click(function () {
                postXml("AjaxPostXmlSample.aspx?mode=send", $("#taXml").val(), function (xd) {
                    alert(xd.xml || (new XMLSerializer()).serializeToString(xd));
                });
            });
        });
    </script>
</head>
<body>
    <textarea id="taXml" cols="40" rows="5">&lt;Books&gt;
   &lt;Book Title="The Art of Trouble-Shooting" Author="Darkthread" /&gt;
&lt;/Books&gt;</textarea>
    <input type="button" id="btnSend" value="Send" />
</body>
</html>
