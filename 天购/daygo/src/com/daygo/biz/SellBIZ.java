package com.daygo.biz;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.daygo.dao.GoodsDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.Goods;
import com.jhlabs.image.DilateFilter;

public class SellBIZ {

	public SellBIZ() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean upload(HttpServletRequest request, HttpServletResponse response){
	
		String path=request.getRealPath("").replace('\\', '/');
		File uploadFile = new File(path+"/images/upload/Image");
	    if (!uploadFile.exists()) {
	    	uploadFile.mkdirs();
	    }
		    File tempPathFile = new File(path+"/images/upload/temp");
		    if (!tempPathFile.exists()) {
		       tempPathFile.mkdirs();
		    }
        try {  
        	DiskFileItemFactory factory = new DiskFileItemFactory();  
        	factory.setRepository(tempPathFile);
    		ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> list = upload.parseRequest(request);
            String va = null;  
            String picture="";
            String describe="";
            String name="";
            String category="";
            String size="";
            String number="";
            String price="";
            int h=0,w=0;
            for(FileItem item : list){  
                if(!item.isFormField()){
                      String fileName=item.getName();
                      String fieldname=item.getFieldName();
                      
                      if (fileName != null) {
                    	  String pp=fileName.substring(fileName.lastIndexOf(".")+1);
                    	  if(pp==null||"".equals(pp))
                    		  pp="jpg";
                    	  String filename=(String)request.getSession().getAttribute("username")+new Date().getTime()+ "."+pp;
                          File savedFile = new File(uploadFile, filename);
                          item.write(savedFile);
                          BufferedImage bi=ImageIO.read(savedFile);
                          if("picture".equals(fieldname)){
                        	  picture="images/upload/Image/"+filename;
                          }else if("describe".equals(fieldname)){
                        	  h=bi.getHeight();
                        	  w=bi.getWidth();
                        	  describe="images/upload/Image/"+filename;
                          }
                          System.out.println(((BufferedImage)ImageIO.read(savedFile)).getHeight());
                      }
             
                }  else{
                	String fn=item.getFieldName();
                	if("name".equals(fn)){
                		name=item.getString();
                	}
                	if("category".equals(fn)){
                		category=item.getString();
                	}
                	if("size".equals(fn)){
                		size=item.getString();
                	}
                	if("number".equals(fn)){
                		number=item.getString();
                	}
                	if("price".equals(fn)){
                		price=item.getString();
                	}
                }
            }  
            
            GoodsDao dao=new GoodsDao();
            Goods good=new Goods();
            if(name!=null)
            	name=new String(name.getBytes("ISO-8859-1"),"utf-8");
            if(category!=null)
            	category=new String(category.getBytes("ISO-8859-1"),"utf-8");
            if(size!=null)
            	size=new String(size.getBytes("ISO-8859-1"),"utf-8");
            good.setG_name(name);
            good.setG_category(category);
            good.setG_size(size);
            good.setG_number(Integer.parseInt(number));
            good.setG_price(Double.parseDouble(price));;
            good.setG_picture(picture);
            good.setG_describe("<p>&nbsp;<img src=\""+describe+"\" width=\""+w+"\" height=\""+h+"\" alt=\"\" /></p>");
            good.setU_id(new UserDao().getuserByname((String)request.getSession().getAttribute("username")).getU_id());
            dao.AddGoods(good);
            request.setAttribute("addgood", true);
            return true;
        } catch (Exception e) {  
             
            e.printStackTrace();  
          
        } 
        return false;
	}
}
