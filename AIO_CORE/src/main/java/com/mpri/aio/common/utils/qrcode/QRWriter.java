package com.mpri.aio.common.utils.qrcode;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import com.google.zxing.common.BitMatrix;

/**
 * QRCode的输出
 * @author Cary
 * @date 2018年9月27日
 */
public class QRWriter {

	private static final int BLACK = 0xFF000000;//用于设置图案的颜色
	private static final int WHITE = 0xFFFFFFFF; //用于背景色
 
	private QRWriter() {
	}
 
	public static BufferedImage toBufferedImage(BitMatrix matrix) {
		int width = matrix.getWidth();
		int height = matrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y,  (matrix.get(x, y) ? BLACK : WHITE));
				//image.setRGB(x, y,  (matrix.get(x, y) ? Color.YELLOW.getRGB() : Color.CYAN.getRGB()));
			}
		}
		return image;
	}
 
	public static void writeToFile(BitMatrix matrix, String format, File file,String photo) throws IOException {
		BufferedImage image = toBufferedImage(matrix);
		//设置logo图标
		LogoConfig logoConfig = new LogoConfig();
		image = logoConfig.LogoMatrix(image,photo);
		
		if (!ImageIO.write(image, format, file)) {
			throw new IOException("Could not write an image of format " + format + " to " + file);
		}else{
			System.out.println("图片生成成功！");
		}
	}
 
	public static void writeToStream(BitMatrix matrix, String format, OutputStream stream,String photo) throws IOException {
		BufferedImage image = toBufferedImage(matrix);
		//设置logo图标
		LogoConfig logoConfig = new LogoConfig();
		image = logoConfig.LogoMatrix(image,photo);
		
		if (!ImageIO.write(image, format, stream)) {
			throw new IOException("Could not write an image of format " + format);
		}
	}

}
