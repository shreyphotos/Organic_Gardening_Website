<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="PROJECT_FINAL.admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Add Products</h1>
            <table>
                <tr>
                    <td>Product Name: </td>
                    <td><asp:TextBox ID="txtprodname" runat="server"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Upload Product Image:</td>
                    <td><asp:FileUpload ID="proUpload" runat="server" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td>Category</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="catname" DataValueField="catid"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=Shreya\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [catid], [catname] FROM [category]"></asp:SqlDataSource>
                    </td>
                    
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td>Price</td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td><asp:Button ID="btnUpload" runat="server" Text="Submit" CssClass="button" OnClick="btnUpload_Click" />
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblMsg" runat="server" Text=" "/></td>
                    <td>&nbsp;</td>
                </tr>
               
            </table>

    </center>
</asp:Content>
