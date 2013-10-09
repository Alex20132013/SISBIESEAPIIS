/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.ArrayList;


public interface IEntidad 
{
    
    public boolean InsertRegisto() throws Exception;
    public boolean DeleteRegistro()throws Exception;
    public boolean UpdateRegistro()throws Exception;
    public ArrayList<Object[]> SelectDatos() throws Exception;
    
}
