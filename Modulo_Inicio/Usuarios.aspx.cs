using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usuarios : System.Web.UI.Page
{
    public int totalItemSeleccionados = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView_Clientes_PreRender(sender, e);
    }

    protected void Btn_Crear_Usuario_Click(object sender, EventArgs e)
    {
        String nombre = Txt_Nombre.Text;
        String apellido = Txt_Apellido.Text;
        String nombre_usuario = Txt_Usuario.Text; 
        String password = txt_contraseña.Text;
        int idrol = Convert.ToInt32(DropDownList1.Text);
        String correo = Txt_Correo.Text;
        TablaUsuarios user = new TablaUsuarios();

        try
        {
            user.Registro(nombre, apellido, password, nombre_usuario, idrol, correo);
            Response.Redirect("~/Modulo_Inicio/Usuarios.aspx");
            lbl_mens.Text = "Se registro el usuario.";
        }
        catch (Exception)
        {
            lbl_mens.Text = "Error registrando el usuario. Vuelva a intentarlo ";
        }
    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }
    protected void EditarUsuario_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_usuario= ((Label)boton2.Parent.FindControl("Id_UsuarioLabel"));

        int idUsuario = Convert.ToInt32(id_usuario.Text);
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    /* GridView con Bootstrap */
    protected void GridView_Clientes_DataBound(object sender, EventArgs e)
    {
        // Recupera la el PagerRow...
        GridViewRow pagerRow = GridView_Usuarios.BottomPagerRow;
        // Recupera los controles DropDownList y label...
        DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
        Label pageLabel = (Label)pagerRow.Cells[0].FindControl("CurrentPageLabel");
        if ((pageList != null))
        {
            // Se crean los valores del DropDownList tomando el número total de páginas... 
            int i = 0;
            for (i = 0; i <= GridView_Usuarios.PageCount - 1; i++)
            {
                // Se crea un objeto ListItem para representar la �gina...
                int pageNumber = i + 1;
                ListItem item = new ListItem(pageNumber.ToString());
                if (i == GridView_Usuarios.PageIndex)
                {
                    item.Selected = true;
                }
                // Se añade el ListItem a la colección de Items del DropDownList...
                pageList.Items.Add(item);
            }
        }
        if ((pageLabel != null))
        {
            // Calcula el nº de pagina actual...
            int currentPage = GridView_Usuarios.PageIndex + 1;
            // Actualiza el Label control con la pagina actual.
            pageLabel.Text = "Página " + currentPage.ToString() + " de " + GridView_Usuarios.PageCount.ToString();
        }
    }

    protected void GridView_Clientes_PreRender(object sender, EventArgs e)
    {
        if (totalItemSeleccionados > 0)
        {
            btnQuitarSeleccionados.CssClass = "btn btn-lg btn-danger";
        }
        else {
            btnQuitarSeleccionados.CssClass = "btn btn-lg btn-danger disabled";
        }
    }
    public void GridView_Clientes_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            lblInfo.Text = " ¡Cliente/s eliminado/s OK! ";
            lblInfo.CssClass = "label label-success";
        }
        else {
            lblInfo.Text = " ¡Se ha producido un error al intentar elimnar el/los cliente/s! ";
            lblInfo.CssClass = "label label-danger";
            e.ExceptionHandled = true;
        }
    }
    public void GridView_Clientes_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            lblInfo.Text = " ¡Modificación realizada OK! ";
            lblInfo.CssClass = "label label-success";
        }
        else {
            lblInfo.Text = " ¡Se ha producido un error al intentar modificar el cliente! ";
            lblInfo.CssClass = "label label-danger";
            e.ExceptionHandled = true;
        }
    }
    protected void GridView_Clientes_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lblInfo.Text = "";
    }
    protected void btnQuitarSeleccionados_Click(object sender, EventArgs e)
    {
        //Recorrer las filas del GridView...
        int i = 0;
        for (i = 0; i <= GridView_Usuarios.Rows.Count - 1; i++)
        {
            CheckBox CheckBoxElim = (CheckBox)GridView_Usuarios.Rows[i].FindControl("chkEliminar");
            if (CheckBoxElim.Checked)
            {
                GridView_Usuarios.DeleteRow(i);
            }
        }
        GridView_Usuarios.DataBind();
    }
    protected void chk_OnCheckedChanged(object sender, EventArgs e)
    {
        //Recorrer las filas del GridView...
        int i = 0;
        //Quita el mensaje de información si lo hubiera...
        lblInfo.Text = "";
        for (i = 0; i <= GridView_Usuarios.Rows.Count - 1; i++)
        {
            CheckBox CheckBoxElim = (CheckBox)GridView_Usuarios.Rows[i].FindControl("chkEliminar");
            if (CheckBoxElim.Checked)
            {
                
                totalItemSeleccionados = totalItemSeleccionados + 1;
                return;
            }
        }
    }

    protected void PageDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Recupera la fila.
        GridViewRow pagerRow = GridView_Usuarios.BottomPagerRow;
        // Recupera el control DropDownList...
        DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("PageDropDownList");
        // Se Establece la propiedad PageIndex para visualizar la página seleccionada...
        GridView_Usuarios.PageIndex = pageList.SelectedIndex;
        //Quita el mensaje de información si lo hubiera...
        lblInfo.Text = "";
    }
    
}