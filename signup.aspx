<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="PROJECT_FINAL.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <table style="width: 40%">
        <tr>
            <td colspan="2"><h1>SIGN-UP</h1></td>
            
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>FIRST NAME:</td>
            <td>
                <asp:TextBox ID="txtFname" runat="server" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="PLEASE ENTER YOUR NAME" ControlToValidate="txtFname"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>LAST NAME:</td>
            <td>
                <asp:TextBox ID="txtLname" runat="server" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="PLEASE ENTER YOUR LAST NAME" ControlToValidate="txtLname"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>MOBILE NUMBER:</td>
            <td>
                <asp:TextBox ID="txtM" runat="server" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="PLEASE ENTER YOUR MOBILE NUMBER" ControlToValidate="txtM"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="PLEASE ENTER YOUR PROPER PHONE NUMBER" ControlToValidate="txtM" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>ADDRESS:</td>
            <td>
                <asp:TextBox ID="txtAdd" runat="server" TextMode="MultiLine" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="PLEASE ENTER YOUR ADDRESS" ControlToValidate="txtAdd"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>E-MAIL ID:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="PLEASE ENTER YOUR EMAIL ID" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="PLEASE ENTER A CORRECT EMAIL ID" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>PASSWORD:</td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="PLEASE ENTER THE PASSWORD" ControlToValidate="txtPass"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="SUBMIT" OnClick="Button1_Click" /></td>
        </tr>
    </table>
        </center>
    
</asp:Content>
