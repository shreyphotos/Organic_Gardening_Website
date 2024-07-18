<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="PROJECT_FINAL.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br />
        <br />
        <asp:Label ID="lblTitle" runat="server" Text="Your Shopping Cart" Font-Italic="True" Font-Bold="True" Font-Names="Times New Roman" Font-Size="XX-Large" ForeColor="#CC9900"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="grdCart" runat="server" Height="159px" Width="237px" OnRowCancelingEdit="grdCart_RowCancelingEdit" OnRowDeleting="grdCart_RowDeleting" OnRowEditing="grdCart_RowEditing"  AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Font-Bold="True" Font-Italic="True" Font-Size="Small" OnRowUpdating="grdCart_RowUpdating" style="margin-right: 4px">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImageUrl") %>' Height="150" Width="200" />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductName" HeaderText="Product" ReadOnly="True" SortExpression="ProductName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                <asp:BoundField DataField="subTotal" HeaderText="Total" ReadOnly="True" SortExpression="subTotal" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>

            <EmptyDataTemplate>
                Your Shopping Cart is Empty
                <a href="category.aspx">ADD PRODUCTS!</a>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <br />
        <br />
        Total Amount:<asp:Label ID="lblTotal" runat="server" Text="" Font-Italic="True" Font-Names="Times New Roman" Font-Bold="True" ForeColor="#CC9900" Font-Size="X-Large"></asp:Label>
        <br />
        <asp:Label ID="lblPaymentOption" runat="server" Text="Choose Payment Option" Font-Italic="True" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Larger" ForeColor="#CC9900"></asp:Label><br />
        <asp:RadioButton ID="rdbcod" runat="server" Text="Cash On Delivery" GroupName="payment" /><br />
        <asp:RadioButton ID="rdbdc" runat="server" Text="Debit Card" GroupName="payment" /><br />
        <asp:RadioButton ID="rdbcc" runat="server" Text="Credit Card" GroupName="payment" /><br />
         <br />
        <br />
        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place The Order" CssClass="button" OnClick="btnPlaceOrder_Click"/>
    
    </center>
</asp:Content>
