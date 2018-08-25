package com.mpri.aio.schoolmate.model;
import com.mpri.aio.base.model.DataEntity; 
import java.util.Date;

 /**   
 *  
 * @Description:  校友卡管理
 * @Author:       LZQ
 * @project       AIO   
 * @CreateDate:   Wed Aug 22 13:57:05 CST 2018
 * @Version:      v_1.0
 *    
 */
public class SmCard extends DataEntity<SmCard> {

	private static final long serialVersionUID = 1534917425466L;
	
	private String name;
	private String type;
	private Integer startLevel;
	private Integer endLevel;
	private String frontFont;
	private String frontFontColor;
	private String frontFontStyle;
	private String backFont;
	private String backFontColor;
	private String backFontStyle;
	private String cardStyleLine;
	private String cardStyleRadius;
	private String cardStyleOpacity;
	private String frontBackground;
	private String backBackground;

	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	public String getType() {
		return this.type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	public Integer getStartLevel() {
		return this.startLevel;
	}
	public void setStartLevel(Integer startLevel) {
		this.startLevel = startLevel;
	}	
	public Integer getEndLevel() {
		return this.endLevel;
	}
	public void setEndLevel(Integer endLevel) {
		this.endLevel = endLevel;
	}	
	public String getFrontFont() {
		return this.frontFont;
	}
	public void setFrontFont(String frontFont) {
		this.frontFont = frontFont;
	}	
	public String getFrontFontColor() {
		return this.frontFontColor;
	}
	public void setFrontFontColor(String frontFontColor) {
		this.frontFontColor = frontFontColor;
	}	
	public String getFrontFontStyle() {
		return this.frontFontStyle;
	}
	public void setFrontFontStyle(String frontFontStyle) {
		this.frontFontStyle = frontFontStyle;
	}	
	public String getBackFont() {
		return this.backFont;
	}
	public void setBackFont(String backFont) {
		this.backFont = backFont;
	}	
	public String getBackFontColor() {
		return this.backFontColor;
	}
	public void setBackFontColor(String backFontColor) {
		this.backFontColor = backFontColor;
	}	
	public String getBackFontStyle() {
		return this.backFontStyle;
	}
	public void setBackFontStyle(String backFontStyle) {
		this.backFontStyle = backFontStyle;
	}	
	public String getCardStyleLine() {
		return this.cardStyleLine;
	}
	public void setCardStyleLine(String cardStyleLine) {
		this.cardStyleLine = cardStyleLine;
	}	
	public String getCardStyleRadius() {
		return this.cardStyleRadius;
	}
	public void setCardStyleRadius(String cardStyleRadius) {
		this.cardStyleRadius = cardStyleRadius;
	}	
	public String getCardStyleOpacity() {
		return this.cardStyleOpacity;
	}
	public void setCardStyleOpacity(String cardStyleOpacity) {
		this.cardStyleOpacity = cardStyleOpacity;
	}	
	public String getFrontBackground() {
		return this.frontBackground;
	}
	public void setFrontBackground(String frontBackground) {
		this.frontBackground = frontBackground;
	}	
	public String getBackBackground() {
		return this.backBackground;
	}
	public void setBackBackground(String backBackground) {
		this.backBackground = backBackground;
	}	

}
