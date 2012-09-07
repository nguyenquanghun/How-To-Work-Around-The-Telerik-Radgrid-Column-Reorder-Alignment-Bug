<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RadgridColReorderingJustificationIssue._Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script language="javascript" type="text/javascript">
        function grid_OnColumnSwapped(sender, eventArgs) {
            var src  = eventArgs.get_gridSourceColumn().get_element();
            var targ = eventArgs.get_gridTargetColumn().get_element();
            var srcPosition = src.cellIndex + 1;
            var targPosition = targ.cellIndex + 1;
            var srcCells = $('#grid tbody tr td:nth-child(' + srcPosition + ')');
            var targCells = $('#grid tbody tr td:nth-child(' + targPosition + ')');
            if (srcCells.length >= 1) {
                var srcAlign = srcCells.attr('align');
                var targAlign = targCells.attr('align');
                if (typeof targAlign == 'undefined') targAlign = "";
                if (typeof srcAlign == 'undefined') srcAlign = "";
                srcCells.attr('align', targAlign);
                targCells.attr('align', srcAlign);
            }
        }
    </script>
</head>
<body>
    <ol id="log" />
    <form id="form1" runat="server">
        <h2>
            Prove the column alignment is copied when repositioned.
        </h2>
        <telerik:RadScriptManager runat="server" EnableScriptLocalization="True" />
        <telerik:RadGrid ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            GridLines="None">
            <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" 
                    ClientEvents-OnColumnSwapped="grid_OnColumnSwapped">
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
                        ReadOnly="True" SortExpression="ProductID" UniqueName="ProductID" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName"
                        UniqueName="ProductName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName"
                        UniqueName="CategoryName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UnitPrice" DataType="System.Decimal" HeaderText="UnitPrice"
                        SortExpression="UnitPrice" UniqueName="UnitPrice" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UnitsInStock" DataType="System.Int16" HeaderText="UnitsInStock"
                        SortExpression="UnitsInStock" UniqueName="UnitsInStock" ItemStyle-HorizontalAlign="Right">
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
