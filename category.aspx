<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="PROJECT_FINAL.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br /><br />
    <center>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="catid" DataSourceID="SqlDataSource1" RepeatColumns="2" Height="279px" Width="780px">
        <ItemTemplate>
            <%--catid:
            <asp:Label ID="catidLabel" runat="server" Text='<%# Eval("catid") %>' />--%>
            <br />
            
            
            <asp:Label ID="catnameLabel" runat="server" Text='<%# Eval("catname") %>' Font-Bold="True" Font-Italic="True" ForeColor="#CC9900" Font-Names="Times New Roman" Font-Size="Larger" />
            
                <br />
            
            <asp:ImageButton ID="catimageLabel" runat="server" ImageUrl='<%# Eval("catimage") %>' Height="200px" Width="200px" PostBackUrl='<%# Eval("catid","products.aspx?catid={0}") %>'/>
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
        </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=Shreya\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
        
    <br /><br />
</asp:Content>
