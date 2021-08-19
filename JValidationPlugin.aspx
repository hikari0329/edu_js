<%@ Page Language="VB" AutoEventWireup="false" CodeFile="JValidationPlugin.aspx.vb" Inherits="JValidationPlugin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <h2 id="summary"></h2>
    <fieldset>
        <legend>Example</legend>
        <table>
            <tr>
                <td>
                    <label for="emailaddress">Email Address</label>
                </td>
                <td>
                    <input id="emailaddress" name="emailaddress" />
                </td>
                <td></td>
            </tr>
            <%--other fields--%>
        </table>
        <input class="submit" type="submit" value="Submit" />
    </fieldset>
    </form>
    <script>
    $(function () {
        $("#form1").validate({
            rules: {
                emailaddress: {
                    required: true,
                    email: true,
                    remote: function () {
                        var r = {
                            url: "JValidationPlugin.aspx/ValidateEmail",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: "{'email': '" + $('#emailaddress').val() + "'}",
                            dataFilter: function (data) { return (JSON.parse(data)).d; }
                        }
                        return r;
                    }
                }
            },
            messages: {
                emailaddress: {
                    required: "Please enter a valid email address",
                    remote: "This email address is already registered."
                }
            }
        });
    })
    </script>
</body>
</html>
