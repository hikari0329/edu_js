<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Audit.aspx.vb" Inherits="Audit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="ITEM" HeaderText="ITEM" SortExpression="ITEM" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:testConnectionString3 %>" DeleteCommand="DELETE FROM [Table_3] WHERE [ID] = @original_ID AND (([ITEM] = @original_ITEM) OR ([ITEM] IS NULL AND @original_ITEM IS NULL))" InsertCommand="INSERT INTO [Table_3] ([ID], [ITEM]) VALUES (@ID, @ITEM)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Table_3]" UpdateCommand="UPDATE [Table_3] SET [ITEM] = @ITEM WHERE [ID] = @original_ID AND (([ITEM] = @original_ITEM) OR ([ITEM] IS NULL AND @original_ITEM IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_ITEM" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="ITEM" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ITEM" Type="String" />
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_ITEM" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString2 %>" SelectCommand="SELECT * FROM [查核項目1]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
