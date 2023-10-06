using System;

namespace LP3_TP3
    {
    public partial class RegistrosContables : System.Web.UI.Page
        {
        protected void Page_Load ( object sender, EventArgs e )
            {

            }

        protected void ButtonAgregar_Click ( object sender, EventArgs e )
            {
            if ( !string.IsNullOrEmpty(TextBoxMonto.Text) && DropDownCuenta.SelectedIndex >= 0 && DropDownTipo.SelectedIndex >= 0 )
                {

                int tipo = Convert.ToInt32(DropDownTipo.SelectedValue);

                if ( tipo == 0 || tipo == 1 )
                    {
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
