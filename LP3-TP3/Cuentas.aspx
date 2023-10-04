<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="LP3_TP3.Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CUENTAS</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div class="row">
            <div class="col">
                <h4 class="mb-3">CUENTAS:</h4>
                <div class="form-group">
                    <asp:Label ID="LabelDescripcion" runat="server" Text="Descripción: " CssClass="mr-2"></asp:Label>
                    <asp:TextBox ID="TextBoxDescripcion" runat="server" CssClass="form-control d-inline-block" Width="200px"></asp:TextBox>
                    <asp:Button ID="agregarCuentas" runat="server" OnClick="agregarCuentas_Click" Text="Agregar" CssClass="btn btn-primary ml-2" />
                </div>
                <asp:Label ID="LabelBD" runat="server" Text="Label"></asp:Label>
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataCuentas" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control" Height="150px" Width="300px"></asp:ListBox>
            </div>
            <div class="col">
                <h4 class="mb-3">EDICION:</h4>
                <div class="form-group">
                    <asp:TextBox ID="TextBoxEdicion" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                    <asp:Button ID="btnEditar" runat="server" OnClick="btnEditar_Click" Text="Editar" CssClass="btn btn-warning mt-2" />
                    <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" CssClass="btn btn-danger mt-2" />
                </div>
            </div>
        </div>
    </form>

    <asp:SqlDataSource ID="SqlDataCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataCuentas2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
