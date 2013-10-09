/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.List;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;


/**
 *
 * @author eapiis_server
 */
public class CDetalleLibro implements JRDataSource
{
    private List<Object[]> listaLibros;

    public CDetalleLibro(List<Object[]> listaLibros) 
    {
        this.listaLibros = listaLibros;
    }
    private int indiceLibroActual = -1;

    @Override
    public boolean next() throws JRException 
    {
     return ++indiceLibroActual<listaLibros.size();
    }

    @Override
    public Object getFieldValue(JRField jrField) throws JRException 
    {
      Object  dato=null;
      if("fldCodewey".equals(jrField.getName())) 
    { 
        dato = listaLibros.get(indiceLibroActual)[3]; 
    } 
    else if("fldMalaga".equals(jrField.getName())) 
    { 
        dato = listaLibros.get(indiceLibroActual)[4]; 
    } 
    else if("fldEdicion".equals(jrField.getName())) 
    { 
        dato= listaLibros.get(indiceLibroActual)[5]; 
    } 
    else if("fldVolTomo".equals(jrField.getName())) 
    { 
        dato= listaLibros.get(indiceLibroActual)[6]; 
        
    }
    else if("fldEjemplar".equals(jrField.getName())) 
    { 
        dato= listaLibros.get(indiceLibroActual)[7]; 
    }  
    
      
      return  dato;
    }
    
 
}
