
package Controlador;

import Modelo.CDetalleLibro;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 *
 * @author eapiis_server
 */
@WebServlet(name = "Sprintbarra", urlPatterns = {"/Sprintbarra"})
public class SprintCodDewey extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
       // response.setContentType("text/html;charset=UTF-8");
        
       ServletOutputStream out = response.getOutputStream();
        try {
            
            HttpSession hsPrintDewey=request.getSession(true);
            
           // List<Object[]> linsertTemp=new ArrayList<Object[]>();
           List<Object[]> linsertTemp=null;
            
            if (hsPrintDewey.getAttribute("Dewey_barrra")!=null ) 
            {
               linsertTemp=(ArrayList<Object[]>)hsPrintDewey.getAttribute("Dewey_barrra");               
                
            }
//            for (int i = 0; i < 10; i++) 
//            {
//                Object[] registro={"005.123"+i,"R"+(i*5),"ed."+i,"V"+i,"ejm"+i};
//                
//                linsertTemp.add(registro);
//                
//            }
   
            CDetalleLibro detalles=new CDetalleLibro(linsertTemp);           
            
            
            JasperReport reporte = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("Reportes/IRepCodDewey.jasper"));
            
            JasperPrint jasperPrint;
            jasperPrint = JasperFillManager.fillReport(reporte, null, detalles);

            JRExporter exporter = new JRPdfExporter();
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
            exporter.exportReport();
            
            //out.println(getServletContext().getRealPath("Reportes/IRepCodDewey.jasper")+"hola mundo");
            
            
            
    
            
        }    
        catch(Exception ex) 
        {
         out.print(ex.getMessage());
        }
         finally 
        {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
