package com.scau.mis.util;
 
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.commons.lang.StringUtils;
import org.krysalis.barcode4j.impl.code39.Code39Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
 
/**
 * 条形码工具类
 * @author jodenhe
 *
 */
public class BarcodeUtil {
	public final static Log log = Log.getLog("BarcodeUtil.class");
 
	/**
	 * 生成条形码
	 * @param msg 条形码信息
	 * @param path 输出路径
	 * @return
	 */
    public static File generateFile(String msg, String path) {
        File file = new File(path);
        FileOutputStream fos = null;
        try {
        	fos = new FileOutputStream(file);
            generate(msg, fos);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } finally{
        	if (fos!=null) {
				try {
					fos.close();
				} catch (IOException e) {
					log.error(e+":"+e.getMessage());
				}
			}
        }
        return file;
    }
 
    /**
     * 生成字节
     *
     * @param msg
     * @return
     */
    public static byte[] generate(String msg) {
        ByteArrayOutputStream ous = new ByteArrayOutputStream();
        generate(msg, ous);
        return ous.toByteArray();
    }
 
    /**
     * 生成到流
     *
     * @param msg
     * @param ous
     */
    public static void generate(String msg, OutputStream ous) {
        if (StringUtils.isEmpty(msg) || ous == null) {
            return;
        }
 
        Code39Bean bean = new Code39Bean();
 
        // 精细度
        final int dpi = 150;
        // module宽度
        final double moduleWidth = UnitConv.in2mm(1.0f / dpi);
 
        // 配置对象
        bean.setModuleWidth(moduleWidth);
        bean.setWideFactor(3);
        bean.doQuietZone(false);
 
        String format = "image/png";
        try {
 
            // 输出到流
            BitmapCanvasProvider canvas = new BitmapCanvasProvider(ous, format, dpi,
                    BufferedImage.TYPE_BYTE_BINARY, false, 0);
 
            // 生成条形码
            bean.generateBarcode(canvas, msg);
 
            // 结束绘制
            canvas.finish();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
 
    public static void main(String[] args) {
    	String contextPath = PathKit.getWebRootPath();
		String path = "/barcode/" +"barcode.png";
		String pathUrl = contextPath + path;
		System.out.println(pathUrl);
        String msg = "123456789";
        generateFile(msg, pathUrl);
    }
}