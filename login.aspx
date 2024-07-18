<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PROJECT_FINAL.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
     <table style="width: 40%">
        <tr><align="center">
            <td colspan="2"><h1>LOGIN</h1></td>
        </align></tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>USERNAME:</td>
            <td>
                <asp:TextBox ID="txtUser" runat="server" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>PASSWORD:</td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <center>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnSubmit" CssClass="button" runat="server" Text="SUBMIT" OnClick="btnSubmit_Click" /></td>
            
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            
        </tr>
        </center>
    </table>
        </center>

</asp:Content>
