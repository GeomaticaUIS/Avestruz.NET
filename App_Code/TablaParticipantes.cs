using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Participantes
/// </summary>
public class TablaParticipantes
{
    
    public int Rol { set; get; }
    public int Id_Colaborador { set; get; }
    public int Id_producto { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaParticipantes()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public void RegistrarParticipante(int Id_producto, int Id_Colaborador, int Rol)
    {
        Participantes participante = new Participantes();

        participante.Productos_Id = Id_producto;
        participante.Colaborador_Id = Id_Colaborador;
        participante.Rol = Rol;

        dc.Participantes.InsertOnSubmit(participante);
        dc.SubmitChanges();
    }

    public List<ListaParticipantes> DatosParticipantes(int IDproducto)
    {
       

        var datosparticipante = from u in dc.Participantes
                                where u.Productos_Id == IDproducto
                                select new ListaParticipantes
                                {
                                    Colaborador_Id_ = u.Colaborador_Id,
                                    Rol_ = u.Rol
                                };

        return datosparticipante.ToList();

    }

    public void eliminarParticipantes(int Id_producto)
    {
        var qry = from m in dc.Participantes
                  where m.Productos_Id == Id_producto
                  select m;

        foreach(var q in qry)
        {
            dc.Participantes.DeleteOnSubmit(q);
        }
        dc.SubmitChanges();
    }

    public void actualizar(int Id_producto, int Id_Colaborador, int Rol)
    {

        var reg = dc.Participantes.FirstOrDefault(x => x.Productos_Id == Id_producto);
        if (reg != null)
        {
            reg.Colaborador_Id = Id_Colaborador;
            reg.Rol = Rol;
            

        }
        dc.SubmitChanges();

    }
}