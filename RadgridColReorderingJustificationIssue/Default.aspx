<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RadgridColReorderingJustificationIssue._Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>
            How do I detect a column has been dragged off the grid?
        </h2>
        <telerik:RadScriptManager runat="server" EnableScriptLocalization="True" />
        <telerik:RadGrid ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            GridLines="None">
            <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
            </ClientSettings>
            <MasterTableView DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                <RowIndicatorColumn>
                    <HeaderStyle Width="20px"></HeaderStyle>
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                    <HeaderStyle Width="20px"></HeaderStyle>
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="ProductID" DataType="System.Int32" HeaderText="ProductID"
                        ReadOnly="True" SortExpression="ProductID" UniqueName="ProductID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName"
                        UniqueName="ProductName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName"
                        UniqueName="CategoryName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UnitPrice" DataType="System.Decimal" HeaderText="UnitPrice"
                        SortExpression="UnitPrice" UniqueName="UnitPrice">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UnitsInStock" DataType="System.Int16" HeaderText="UnitsInStock"
                        SortExpression="UnitsInStock" UniqueName="UnitsInStock">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Northwind %>"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryName], [UnitPrice], [UnitsInStock] FROM [Alphabetical list of products]">
        </asp:SqlDataSource>
    </form>
</body>
</html>
