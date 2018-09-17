package com.mpri.aio.system.utils.qrcode;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRCode {

	public static void Stream_QRCode(String content,String photo,OutputStream stream) throws IOException, WriterException{
		int width = 500; // 二维码图片宽度 500
		int height = 500; // 二维码图片高度500
		
		String format = "png";// 二维码的图片格式 
		
		Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
		 // 指定纠错等级,纠错级别（L 7%、M 15%、Q 25%、H 30%）
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		// 内容所使用字符集编码
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");	
//		hints.put(EncodeHintType.MAX_SIZE, 350);//设置图片的最大值
//	    hints.put(EncodeHintType.MIN_SIZE, 100);//设置图片的最小值
		hints.put(EncodeHintType.MARGIN, 1);//设置二维码边的空度，非负数
		
		BitMatrix bitMatrix = new MultiFormatWriter().encode(content,//要编码的内容
				//编码类型，目前zxing支持：Aztec 2D,CODABAR 1D format,Code 39 1D,Code 93 1D ,Code 128 1D,
				//Data Matrix 2D , EAN-8 1D,EAN-13 1D,ITF (Interleaved Two of Five) 1D,
				//MaxiCode 2D barcode,PDF417,QR Code 2D,RSS 14,RSS EXPANDED,UPC-A 1D,UPC-E 1D,UPC/EAN extension,UPC_EAN_EXTENSION
				BarcodeFormat.QR_CODE,
				width, //条形码的宽度
				height, //条形码的高度
				hints);//生成条形码时的一些配置,此项可选
		
		// 生成二维码
		QRWriter.writeToStream(bitMatrix, format, stream, photo);
		
	}
	
	
	public static void File_QRCode(String content,String photo) throws IOException, WriterException{
		String contents = "http://xyk.vsbclub.com/"; // 二维码内容
		int width = 500; // 二维码图片宽度 500
		int height = 500; // 二维码图片高度500
		
		String format = "gif";// 二维码的图片格式 gif
		
		Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
		 // 指定纠错等级,纠错级别（L 7%、M 15%、Q 25%、H 30%）
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		// 内容所使用字符集编码
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");	
//		hints.put(EncodeHintType.MAX_SIZE, 350);//设置图片的最大值
//	    hints.put(EncodeHintType.MIN_SIZE, 100);//设置图片的最小值
		hints.put(EncodeHintType.MARGIN, 1);//设置二维码边的空度，非负数
		
		BitMatrix bitMatrix = new MultiFormatWriter().encode(contents,//要编码的内容
				//编码类型，目前zxing支持：Aztec 2D,CODABAR 1D format,Code 39 1D,Code 93 1D ,Code 128 1D,
				//Data Matrix 2D , EAN-8 1D,EAN-13 1D,ITF (Interleaved Two of Five) 1D,
				//MaxiCode 2D barcode,PDF417,QR Code 2D,RSS 14,RSS EXPANDED,UPC-A 1D,UPC-E 1D,UPC/EAN extension,UPC_EAN_EXTENSION
				BarcodeFormat.QR_CODE,
				width, //条形码的宽度
				height, //条形码的高度
				hints);//生成条形码时的一些配置,此项可选
		
		// 生成二维码
		File outputFile = new File("d://new-1.gif");//指定输出路径
		
		QRWriter.writeToFile(bitMatrix, format, outputFile,photo);
		
		
	}
	

	
}
