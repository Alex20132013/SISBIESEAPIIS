/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.Barcode39;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author 2012
 */
public class Cbarcode {
 
    private static Font fontBold = new Font(Font.COURIER, 12, Font.BOLD);
    private static Font fontNormal = new Font(Font.COURIER, 11, Font.NORMAL);
    //private ArrayList<String> lstCodigos=null;
    
    public Cbarcode(ArrayList<Object[]> datos) throws DocumentException, IOException
    {
    	
    	this.generarFactura(datos, "My Java Zone", "Bienvenidos a My Java Zone ");
                       
                      
    }
    
    public void generarFactura(ArrayList<Object[]> lstCodigos, String nombre, String tituloFactura) throws IOException, DocumentException {
    	
     	Document document = getDocument();
     	PdfWriter pw=PdfWriter.getInstance(document, new FileOutputStream("/home/Eapiis_Server/Documentos/barcodes.pdf"));
     	document.open();   	
     	
  		
  		document.add(getHeader(""));
  		document.add(getInformation(" "));         
        
        
                        
                        for (int i = 0; i < lstCodigos.size(); i++) 
                        {
                            String string =lstCodigos.get(i)[0].toString();
                            document.add(getBarcode(document, pw,string));       
                        }
 	  
        
        
     	document.close();
     	
     }
     
     private Document getDocument()
     {
    	Document document = new Document(new Rectangle( getConvertCmsToPoints(5), getConvertCmsToPoints(2)));
      	document.setMargins(1, 1, 1, 1);
            
      	return document;
     }
     
     private Paragraph getHeader(String header) {
    	Paragraph paragraph = new Paragraph();
  		Chunk chunk = new Chunk();
		paragraph.setAlignment(Element.ALIGN_CENTER);
  		//chunk.append( header + getCurrentDateTime() + "\n");
  		chunk.setFont(fontBold);
  		paragraph.add(chunk);
  		return paragraph;
     }
     
     private Paragraph getInformation(String informacion) {
    	Paragraph paragraph = new Paragraph();
    	Chunk chunk = new Chunk();
  		paragraph.setAlignment(Element.ALIGN_CENTER);
  		chunk.append(informacion);
  		chunk.setFont(fontNormal);
  		paragraph.add(chunk);
   		return paragraph;
      }
     
     private Paragraph getInformationFooter(String informacion) {
     	Paragraph paragraph = new Paragraph();
     	Chunk chunk = new Chunk();
   		paragraph.setAlignment(Element.ALIGN_CENTER);
   		chunk.append(informacion);
   		chunk.setFont(new Font(Font.COURIER, 8, Font.NORMAL));
   		paragraph.add(chunk);
    		return paragraph;
       }
  
     private PdfPTable getTable() throws DocumentException {
     	PdfPTable table = new PdfPTable(4);
     	table.setWidths(new int[]{20, 20, 20,20});
		return table;
     }
     
     private PdfPCell getCell(String text) throws DocumentException, IOException {
     	Chunk chunk = new Chunk();
     	chunk.append(text);
     	chunk.setFont(fontNormal);
     	PdfPCell cell = new PdfPCell(new Paragraph(chunk));
 		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
 		cell.setBorder(Rectangle.NO_BORDER);
 		return cell;
     }
     
     private float getConvertCmsToPoints(float cm) {
     	return cm * 28.4527559067f;
     }
     
//     private String getCurrentDateTime() {
//     	Date dNow = new Date( );
//        SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yy '-' hh:mm");
//     	return ft.format(dNow);
//    }
     
    public static Image getBarcode(Document document,  PdfWriter pdfWriter, String strBarcode){
	 	PdfContentByte cimg = pdfWriter.getDirectContent();
	   	Barcode39 code39 = new Barcode39();
	   	code39.setCode(strBarcode);
	   	code39.setCodeType(Barcode39.CODE128);
                        code39.setBarHeight(50);
		code39.setTextAlignment(Element.ALIGN_CENTER);
		Image image = code39.createImageWithBarcode(cimg, null, null);
                       
		float scaler = ((document.getPageSize().getWidth() - document.leftMargin()  - document.rightMargin() - 0) / image.getWidth()) * 90;
		image.scalePercent(scaler);
		image.setAlignment(Element.ALIGN_CENTER);
		return image;
	}
    
    private static String addZeroLeft(String num) {
    	NumberFormat formatter = new DecimalFormat("0000000000000");
     	return formatter.format((num != null) ? Float.parseFloat(num) : 00000000000000);
	}

	public void imprimirFactura(){
    	
    	Desktop d=Desktop.getDesktop();
    	try {
    		if(Desktop.isDesktopSupported()){
    			d.print(new File("barcodes.pdf"));
    		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    } 
           
            
    

}
    