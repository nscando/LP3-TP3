using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LP3_TP3
    {
    public partial class RegistrosContables : System.Web.UI.Page
        {
        protected void Page_Load ( object sender, EventArgs e )
            {
            if ( !IsPostBack )
                {
                // Puedes realizar acciones al cargar la página por primera vez aquí
                }
            }

        protected void ButtonAgregar_Click ( object sender, EventArgs e )
            {
            // Verifica que se haya ingresado un monto y que ambos DropDownList tengan opciones seleccionadas
            if ( !string.IsNullOrEmpty(TextBoxMonto.Text) && DropDownCuenta.SelectedIndex >= 0 && DropDownTipo.SelectedIndex >= 0 )
                {
                // Obtiene el valor seleccionado del DropDownList de "tipo"
                int tipo = Convert.ToInt32(DropDownTipo.SelectedValue);

                // Verifica que el valor del tipo sea 0 o 1
                if ( tipo == 0 || tipo == 1 )
                    {
                    // Realiza la inserción a través del SqlDataSource
                    SqlDataSourceRegistros.Insert();
                    GridViewRegistros.DataBind();
                    ClearControls();
                    LabelMensaje.Text = "Registro agregado correctamente.";
                    }
                else
                    {
                    LabelMensaje.Text = "El valor del tipo debe ser 0 o 1.";
                    }
                }
            else
                {
                LabelMensaje.Text = "Por favor, completa todos los campos.";
                }
            }





        private void ClearControls ()
            {

            DropDownCuenta.SelectedIndex = 0;
            TextBoxMonto.Text = "";
            DropDownTipo.SelectedIndex = 0;
            }
        }
    }
    