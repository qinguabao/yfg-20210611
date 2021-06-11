package com.whty.model.sms;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.util.WebUtils;

import com.whty.model.domain.YfgVerifcode;
import com.whty.model.service.IYfgVerifcodeService;
import com.whty.model.service.impl.YfgVerifcodeServiceImpl;



/**
 * 验证码
 * 
 * @author Administrator
 * @creatTime 2013-10-16下午12:36:51
 */
public final class CodeUtil {
	
	private CodeUtil() {

	}
	
	

	private static final Logger LOGGER = LoggerFactory.getLogger(CodeUtil.class);
	private static final String[] RANDTEXTARRAY = new String[] { "A", "B", "C", "D", "E", "F", "G",
			"H", "I", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
			"Z", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h",
			"i", "j", "k", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };

	/**
	 * 验证码
	 * 
	 * @author Administrator
	 * @date 2013-7-22
	 * @version 1.0
	 * @param session
	 * @param request
	 * @param response
	 * @param sessionName
	 *            session的名字
	 * @throws ServletException
	 * @throws IOException
	 */
	public static void getValid(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, String sessionName) {
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		LOGGER.info("获取{}验证码", sessionName);
		int width = 80;
		int height = 31;

		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		try {
			Graphics graphics = img.getGraphics();
			graphics.setColor(getRandColor(200, 250));
			graphics.fillRect(0, 0, width, height);
			Random rdd = new Random();
			StringBuilder buffer = new StringBuilder();
			graphics.setColor(getRandColor(160, 200));
			for (int i = 0; i < 155; i++) {
				int xxx = rdd.nextInt(width);
				int yyy = rdd.nextInt(height);
				int xll = rdd.nextInt(12);
				int yll = rdd.nextInt(12);
				graphics.drawLine(xxx, yyy, xxx + xll, yyy + yll);
			}
			// 验证码
			graphics.setFont(new Font("Courier New", Font.BOLD, 24));
			for (int i = 0; i < 4; i++) {
				buffer.append(RANDTEXTARRAY[rdd.nextInt(RANDTEXTARRAY.length)]);
				graphics.setColor(new Color(20 + rdd.nextInt(110), 20 + rdd.nextInt(110), 20 + rdd
						.nextInt(110)));
				graphics.drawString(buffer.charAt(i) + "", 5 + i * 18, 25);
			}
			// 干扰线
			for (int i = 0; i < 5; i++) {
				graphics.setColor(new Color(rdd.nextInt(200), rdd.nextInt(200), rdd.nextInt(200)));
				graphics.drawLine(rdd.nextInt(width), rdd.nextInt(height), rdd.nextInt(width),
						rdd.nextInt(height));
			}

			LOGGER.info("生成验证码值为：" + buffer.toString());
			LOGGER.info("生成验证码时，SessionId为：" + WebUtils.getSessionId(request));
			WebUtils.setSessionAttribute(request, sessionName, buffer.toString());
		} catch (Exception e) {
			// e.printStackTrace();
			LOGGER.info("生成验证码抛异常了");
			LOGGER.error("生成验证码抛异常：", e);
		}
		try {
			OutputStream osm = response.getOutputStream();
			ImageIO.write(img, "JPEG", osm);
			osm.flush();
			osm.close();
		} catch (IOException e) {
			LOGGER.error("IOException：", e);
		}
	}

	private static Color getRandColor(int fcc, int bcc) {
		Random random = new Random();
		if (fcc > 255) {
			fcc = 255;
		}
		if (bcc > 255) {
			bcc = 255;
		}
		int rrr = fcc + random.nextInt(bcc - fcc);
		int ggg = fcc + random.nextInt(bcc - fcc);
		int bbb = fcc + random.nextInt(bcc - fcc);
		return new Color(rrr, ggg, bbb);
	}

	// 验证交易金额
	public static boolean isNumber(String str) {
		java.util.regex.Pattern pattern = java.util.regex.Pattern
				.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$"); // 判断小数点后一位的数字的正则表达式
		java.util.regex.Matcher match = pattern.matcher(str);
		return match.matches();
	}

	/**
	 * 生成指定大小、指定验证码图片
	 * 
	 * @param width
	 * @param height
	 * @param code
	 * @author junctioner
	 * @date 2013-9-14 下午01:24:51
	 * @return
	 */
	public static BufferedImage builderBufferedImage(int width, int height, String code) {

		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = img.getGraphics();
		graphics.setColor(CodeUtil.getRandColor(200, 250));
		graphics.fillRect(0, 0, width, height);
		Random rdd = new Random();
		graphics.setColor(getRandColor(160, 200));
		for (int i = 0; i < 55; i++) {
			int xxx = rdd.nextInt(width);
			int yyy = rdd.nextInt(height);
			int xll = rdd.nextInt(12);
			int yll = rdd.nextInt(12);
			graphics.drawLine(xxx, yyy, xxx + xll, yyy + yll);
		}
		// 验证码
		graphics.setFont(new Font("Courier New", Font.BOLD, 24));
		for (int i = 0; i < code.length(); i++) {
			graphics.setColor(new Color(20 + rdd.nextInt(110), 20 + rdd.nextInt(110), 20 + rdd
					.nextInt(110)));
			graphics.drawString(code.charAt(i) + "", i * 18, 20);
		}
		// 干扰线
		for (int i = 0; i < 5; i++) {
			graphics.setColor(new Color(rdd.nextInt(200), rdd.nextInt(200), rdd.nextInt(200)));
			graphics.drawLine(rdd.nextInt(width), rdd.nextInt(height), rdd.nextInt(width),
					rdd.nextInt(height));
		}

		return img;
	}

	/**
	 * 生成随机数据
	 * 
	 * @param length
	 * @return
	 */
	public static String buildRandomCode(int length) {
		Random rdd = new Random();
		StringBuilder buffer = new StringBuilder();
		for (int i = 0; i < length; i++) {
			buffer.append(RANDTEXTARRAY[rdd.nextInt(RANDTEXTARRAY.length)]);
		}
		return buffer.toString();
	}

	public static void getValid(HttpServletResponse response,String openId, IYfgVerifcodeService yfgVerifcodeService) {
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		int width = 80;
		int height = 31;

		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		try {
			Graphics graphics = img.getGraphics();
			graphics.setColor(getRandColor(200, 250));
			graphics.fillRect(0, 0, width, height);
			Random rdd = new Random();
			StringBuilder buffer = new StringBuilder();
			graphics.setColor(getRandColor(160, 200));
			for (int i = 0; i < 155; i++) {
				int xxx = rdd.nextInt(width);
				int yyy = rdd.nextInt(height);
				int xll = rdd.nextInt(12);
				int yll = rdd.nextInt(12);
				graphics.drawLine(xxx, yyy, xxx + xll, yyy + yll);
			}
			// 验证码
			graphics.setFont(new Font("Courier New", Font.BOLD, 24));
			for (int i = 0; i < 4; i++) {
				buffer.append(RANDTEXTARRAY[rdd.nextInt(RANDTEXTARRAY.length)]);
				graphics.setColor(new Color(20 + rdd.nextInt(110), 20 + rdd.nextInt(110), 20 + rdd
						.nextInt(110)));
				graphics.drawString(buffer.charAt(i) + "", 5 + i * 18, 25);
			}
			// 干扰线
			for (int i = 0; i < 5; i++) {
				graphics.setColor(new Color(rdd.nextInt(200), rdd.nextInt(200), rdd.nextInt(200)));
				graphics.drawLine(rdd.nextInt(width), rdd.nextInt(height), rdd.nextInt(width),
						rdd.nextInt(height));
			}

			LOGGER.info("生成验证码值为：" + buffer.toString());
			
		
			
			YfgVerifcode yfgVerifcode = new YfgVerifcode(); 
			yfgVerifcode.setWxOpneid(openId);
			List<YfgVerifcode> list = yfgVerifcodeService.selectYfgVerifcodeList(yfgVerifcode);
			if(list!=null&&list.size()>0) {
				YfgVerifcode yfgVerifcodeTemp = list.get(0);
				yfgVerifcodeTemp.setWxOpneid(openId);
				yfgVerifcodeTemp.setCreateTime(new Date());
				yfgVerifcodeTemp.setCode(buffer.toString());
				yfgVerifcodeService.updateYfgVerifcode(yfgVerifcodeTemp);
			}else {
				yfgVerifcode.setCode(buffer.toString());
				yfgVerifcode.setCreateTime(new Date());
				yfgVerifcodeService.insertYfgVerifcode(yfgVerifcode);
			}
		
			
		} catch (Exception e) {
			// e.printStackTrace();
			LOGGER.info("生成验证码抛异常了");
			LOGGER.error("生成验证码抛异常：", e);
		}
		try {
			OutputStream osm = response.getOutputStream();
			ImageIO.write(img, "JPEG", osm);
			osm.flush();
			osm.close();
		} catch (IOException e) {
			LOGGER.error("IOException：", e);
		}
	}
}
