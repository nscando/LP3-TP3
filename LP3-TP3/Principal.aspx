<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="LP3_TP3.Principal1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestión Contable</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; 
            padding: 50px;
            text-align: center;
        }
        .opciones {
            margin-top: 20px;
        }
        .opciones a {
            display: block;
            font-size: 20px;
            margin-bottom: 10px;
            text-decoration: none;
            color: #ffffff; 
        }
        .opciones a:hover {
            color: #0056b3; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="mt-4">Gestión Contable</h1>
            <div class="opciones">
                <asp:HyperLink ID="LinkCuentas" runat="server" CssClass="btn btn-primary btn-lg" NavigateUrl="~/Cuentas.aspx">GESTIONAR CUENTAS</asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-success btn-lg" NavigateUrl="~/RegistrosContables.aspx">GESTIONAR REGISTROS CONTABLES</asp:HyperLink>
            </div>
        </div>
    </form>

    <!-- Scripts de Bootstrap (jQuery y Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <!-- Script de Bootstrap -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
