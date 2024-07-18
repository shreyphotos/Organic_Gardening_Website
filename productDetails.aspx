<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="productDetails.aspx.cs" Inherits="PROJECT_FINAL.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="pid" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            
            <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' Visible="false"/>
            <br />
            
            <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' Font-Bold="True" Font-Italic="True" Font-Names="times New Roman" Font-Size="Larger" ForeColor="#CC9900" />
            <br />
            <br />
            <asp:Label ID="pimgUrl" runat="server" Text='<%# Eval("pimage") %>' Visible="false"/>
            <asp:Image ID="pimageLabel" runat="server" ImageUrl='<%# Eval("pimage") %>' Height="500px" Width="600px" />
            <br />
            
            <asp:Label ID="catidLabel" runat="server" Text='<%# Eval("catid") %>' Visible="false"/>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Price Rs." Font-Bold="True" Font-Italic="True" Font-Names="times New Roman" Font-Size="Larger" ForeColor="#CC9900" />
            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' Font-Bold="True" Font-Italic="True" Font-Names="times New Roman" Font-Size="Larger" ForeColor="#CC9900" />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=Shreya\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [products] WHERE ([pid] = @pid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="pid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/category.aspx" Font-Italic="True" Font-Bold="True" Font-Names="Times New Roman" ForeColor="#CC9900">Return to Category Page</asp:HyperLink><br />
    <asp:Button ID="Button1" runat="server" Text="Add To Cart" CssClass="button" OnClick="Button1_Click"/>
</center>
</asp:Content>
