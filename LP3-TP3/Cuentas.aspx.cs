using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Data.SqlClient;

namespace LP3_TP3
    {
    public partial class Principal : System.Web.UI.Page
        {
        protected void Page_Load ( object sender, EventArgs e )
            {
            if ( !IsPostBack )
                {
                actualizarLabel();
                }
            }


        protected void actualizarLabel ()
            {
            LabelBD.Text = "";
            DataView dv = (DataView) SqlDataCuentas.Select(DataSourceSelectArguments.Empty);
            foreach ( DataRowView dr in dv )
                {
                DataRow row = dr.Row;
                LabelBD.Text += row["descripcion"].ToString();
                }

            }


        protected void agregarCuentas_Click ( object sender, EventArgs e )
            {
            int result = SqlDataCuentas.Insert();

            if ( result != 0 )
                {
                LabelBD.Text = "Registro Agregado Correctamente!" + result.ToString();
                TextBoxDescripcion.Text = "";
                }
            else
                {
                LabelBD.Text = "Error!";

                }
            }

        protected void ListBox1_SelectedIndexChanged ( object sender, EventArgs e )
            {
            SqlDataCuentas2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader) SqlDataCuentas2.Select(DataSourceSelectArguments.Empty);
            if ( reader.Read() )
                {
                TextBoxEdicion.Text = reader["descripcion"].ToString();
                }
            }

        protected void btnEditar_Click ( object sender, EventArgs e )
            {

            SqlDataCuentas.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString();
            SqlDataCuentas.UpdateParameters["descripcion"].DefaultValue = TextBoxEdicion.Text;

            int result = SqlDataCuentas.Update();

            if ( result != 0 )
                {
                LabelBD.Text = "Registro Actualizado Correctamente!" + result.ToString();
                TextBoxEdicion.Text = "";
                }
            else
                {
                LabelBD.Text = "Error!";

                }


            }

        protected void btnEliminar_Click ( object sender, EventArgs e )
            {
            int result = SqlDataCuentas.Delete();

            if ( result != 0 )
                {
                LabelBD.Text = "Registro Eliminado Correctamente!" + result.ToString();
                TextBoxEdicion.Text = "";
                }
            else
                {
                LabelBD.Text = "Error!";

                }

            }
        }
    }