<%@ Page Title="" Language="C#" MasterPageFile="~/userMaster.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="PROJECT_FINAL.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/style.css" rel="stylesheet" />
    <br />
    <br />
    <center>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="pid" DataSourceID="SqlDataSource1" RepeatColumns="2">

            <ItemTemplate>
                <div class="my-div">
                    <%--pid:
            <asp:Label ID="pidLabel" runat="server" Text='<%# Eval("pid") %>' />
            <br />--%>

                    <asp:Label ID="pnameLabel" runat="server" Text='<%# Eval("pname") %>' Font-Bold="True" Font-Italic="True" Font-Names="times New Roman" Font-Size="Larger" ForeColor="#CC9900" />
                    <br />

                    <asp:ImageButton ID="pimageLabel" runat="server" ImageUrl='<%# Eval("pimage") %>' Height="200px" Width="200px" PostBackUrl='<%#Eval("pid","productDetails.aspx?pid={0}") %>' />
                    <br />
                    <%--catid:
            <asp:Label ID="catidLabel" runat="server" Text='<%# Eval("catid") %>' />
            <br />--%>
            Rs. 
            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman" Font-Size="Large" ForeColor="#996600" />
                    <br />
                    <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=Shreya\SQLEXPRESS;Initial Catalog=organicFinal;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [products] WHERE ([catid] = @catid)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="catid" QueryStringField="catid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </center>
    <br />
    <br />
</asp:Content>
