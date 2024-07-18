 <%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="PROJECT_FINAL.admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>Add Category</h1>
            <table>
                <tr>
                    <td>Category Name: </td>
                    <td><asp:TextBox ID="txtcatname" runat="server"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Upload File: </td>
                    <td><asp:FileUpload ID="catUpload" runat="server" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnSubmit_Click"  />
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblMsg" runat="server" Text=" "/></td>
                    <td>&nbsp;</td>
                </tr>
               
            </table>

    </center>
</asp:Content>
