
Partial Class JValidationPlugin
    Inherits System.Web.UI.Page
    <System.Web.Services.WebMethod()>
    Public Shared Function ValidateEmail(ByVal email As String) As Boolean
        Dim result As Boolean = True

        'put your code logic here

        If email = "feihan@hotmail.com" Then
            result = False
        End If

        Return result
    End Function
End Class
