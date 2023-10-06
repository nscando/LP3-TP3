<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrosContables.aspx.cs" Inherits="LP3_TP3.RegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registros Contables</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h1>Registros Contables</h1>
            <div class="row mb-3">
                <div class="col">
                    <asp:Label ID="LabelCuenta" runat="server" Text="Cuenta:"></asp:Label>
                    <asp:DropDownList ID="DropDownCuenta" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="id"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="LabelMonto" runat="server" Text="Monto:"></asp:Label>
                    <asp:TextBox ID="TextBoxMonto" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="LabelTipo" runat="server" Text="Tipo:"></asp:Label>
                    <asp:DropDownList ID="DropDownTipo" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Debe" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Haber" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:Button ID="ButtonAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary mr-2" OnClick="ButtonAgregar_Click" />
            <asp:Label ID="LabelMensaje" runat="server" CssClass="text-success mt-3" EnableViewState="False"></asp:Label>
            <asp:GridView ID="GridViewRegistros" runat="server" CssClass="table table-bordered table-striped mt-3" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRegistros" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" SortExpression="idCuenta" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                    <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" 
                SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id" 
                InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [monto], [tipo]) VALUES (@idCuenta, @monto, @tipo)"
                UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id"
                DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id">
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownCuenta" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBoxMonto" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownTipo" Name="tipo" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idCuenta" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
