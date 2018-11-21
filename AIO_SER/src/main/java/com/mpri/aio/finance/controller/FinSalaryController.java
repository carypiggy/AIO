package com.mpri.aio.finance.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;
import com.mpri.aio.base.controller.BaseController;
import com.mpri.aio.common.exception.ExceptionResult;
import com.mpri.aio.common.page.PageIo;
import com.mpri.aio.common.response.RestResponse;
import com.mpri.aio.common.utils.DateUtils;
import com.mpri.aio.common.utils.FileUtils;
import com.mpri.aio.finance.model.FinSalary;
import com.mpri.aio.finance.model.FinSalaryDetail;
import com.mpri.aio.finance.service.FinSalaryDetailService;
import com.mpri.aio.finance.service.FinSalaryService;
import com.mpri.aio.system.utils.MailUtil;

/**   
 *  
 * @Description:  薪资管理——Controller
 * @Author:       Cary
 * @project 	  aio 
 * @CreateDate:   Wed Oct 17 09:58:29 CST 2018
 * @Version:      v_1.0
 *    
 */
@RestController
@RequestMapping("finance/salary")
public class FinSalaryController extends BaseController{
	
	@Value("${file.staticAccessPath}")
	private String staticAccessPath;
	
	@Value("${file.uploadFolder}")
	private String uploadFolder;
	
	@Autowired
	private FinSalaryService finSalaryService;
	
	@Autowired
	private FinSalaryDetailService finSalaryDetailService;	
	
	@Autowired
	private MailUtil mailUtil;
		
	/**
	 * 获取列表
	* <p>Title: list</p>  
	* <p>Description: </p>  
	* @param pageNo
	* @param pageSize 
	* @param finSalary
	* @return
	 */
	@CrossOrigin
	@PostMapping("list")
	public PageIo<FinSalary> list(int pageNo,int pageSize,FinSalary finSalary) {
		PageIo<FinSalary> info = finSalaryService.loadByPage(pageNo,pageSize,finSalary);	
		return info;
	}
	
	
	/**
	 * 增加或者更新数据
	* <p>Title: save</p>  
	* <p>Description: </p>  
	* @param sysDict
	* @return
	 */
	@CrossOrigin
	@PostMapping("save")
	public RestResponse<String> save(@Validated FinSalary finSalary){
		finSalaryService.save(finSalary);							
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "保存成功！", "");
	}	
	
	/**
	 * 删除（逻辑删除）
	 * <p>Title: delete</p>  
	 * <p>Description: </p>  
	 * @param sysDict
	 * @return
	 */
	@CrossOrigin
	@PostMapping("delete")
	public RestResponse<String> delete(FinSalary finSalary) {
		finSalaryService.delete(finSalary);
		return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "删除成功！", "");
	}
	
	/**
	 * 根据id获取字典
	 * <p>Title: get</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@PostMapping("get")
	public RestResponse<FinSalary> get(FinSalary finSalary) {
		return new RestResponse<FinSalary>(ExceptionResult.REQUEST_SUCCESS, "获取成功！", finSalaryService.get(finSalary));
	}
	
	
	/**
	 * 根据id获取详情
	 * <p>Title: get</p>  
	 * <p>Description: </p>  
	 * @param id
	 * @return
	 */
	@CrossOrigin
	@PostMapping("getDetail")
	public PageIo<FinSalaryDetail> getDetail(int pageNo,int pageSize,FinSalaryDetail finSalaryDetail) {
		
		return finSalaryDetailService.loadByPage(pageNo, pageSize, finSalaryDetail);
	}
	
	/**
	 * 文件上传     
	* <p>Title: uploadImg</p>  
	* <p>Description: </p>  
	* @param file
	* @param request
	* @return
	 */
    @CrossOrigin
    @PostMapping(value = "/uploadimg")
    public RestResponse<String> uploadImg(@RequestParam("file") MultipartFile file,
            HttpServletRequest request) {
        String fileName = file.getOriginalFilename();
        String newFilName = String.valueOf(new Date().getTime())+"."+fileName.substring(fileName.lastIndexOf(".") + 1); /*更改文件名*/
        String resfillPath  = "finance/"+DateUtils.getDate();
        String filePath = uploadFolder +resfillPath;
        try {
            FileUtils.uploadFile(file.getBytes(), filePath, newFilName);
            System.out.println(filePath+"/"+newFilName);
            return RestResponse.getInstance(200, "上传成功", filePath+newFilName);
        } catch (Exception e) {
        	e.printStackTrace();
        }      
        return RestResponse.getInstance(-1, "上传失败", filePath+newFilName);
    }
    
    

    public XSSFWorkbook getheader(String fileUrl){
		try {
			//得到Excel工作簿对象    
			XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(fileUrl));  
	        //得到Excel工作表对象    
	        XSSFSheet sheet = wb.getSheetAt(0);   

            //第一步创建workbook  
            XSSFWorkbook newwb = new XSSFWorkbook();  
              
            //第二步创建sheet  
            XSSFSheet newsheet = newwb.createSheet("个人");  
            
	        //得到Excel工作表指定行的单元格    
            for (int i = 0; i < 2; i++) {
                //第三步创建行row:添加表头0行  
                XSSFRow newrow = newsheet.createRow(i); 
                
            	XSSFRow row = sheet.getRow(i);
            	int cellNum = row.getLastCellNum();
            	for (int j = 0; j < cellNum; j++) {
            		//创建新的单元格
            		XSSFCell newcell = newrow.createCell(j);
            		
                    XSSFCell cell = row.getCell(Short.parseShort(j + ""));
                    String cellValue = null;
                    if (null != cell) {
                        switch (cell.getCellTypeEnum()) {                     // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
                        case NUMERIC:
                            cellValue = String.valueOf((int) cell.getNumericCellValue());
                            break;
                        case STRING:
                            cellValue = cell.getStringCellValue();
                            break;
                        case FORMULA:
                            cellValue = cell.getNumericCellValue() + "";
                            break;
                        case BLANK:
                            cellValue = "";
                            break;
                        case BOOLEAN:
                            cellValue = String.valueOf(cell.getBooleanCellValue());
                            break;
                        case ERROR:
                            cellValue = String.valueOf(cell.getErrorCellValue());
                            break;
						default:
							break;
                        }
                    } else {
                        cellValue = "";
                    }
                    //设置背景颜色
//                    XSSFCellStyle style = newwb.createCellStyle();
                    //写值
                    newcell.setCellValue(cellValue);
                    newcell.getCellStyle().cloneStyleFrom(cell.getCellStyle());
            	}
            }           
	        return newwb;
		} catch (Exception e) {
			e.printStackTrace();
		}   
    	return null;

    }
    
    /**
     * 发送finace
    * <p>Title: sendFinace</p>  
    * <p>Description: </p>  
    * @param fileUrl
    * @return
     */
    @CrossOrigin
    @PostMapping(value = "/sendFinace")
    public RestResponse<String> sendFinace(String fileUrl,String dateMonth,String remark){
        String resfillPath  = "finance/"+DateUtils.getDate()+"/";
    	//创建整月
    	FinSalary finSalary = new FinSalary();
    	finSalary.setDateMonth(dateMonth);
    	finSalary.setRemark(remark);
    	finSalary.setStatus("DONING");
		try {
			//得到Excel工作簿对象    
			XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(fileUrl));  
	        //得到Excel工作表对象    
	        XSSFSheet sheet = wb.getSheetAt(0);   
	        //得到Excel工作表的行    
            int rowNum = sheet.getLastRowNum() + 1;
            //人数
            int personNum = 0;
        	finSalaryService.save(finSalary);
	        //得到Excel工作表指定行的单元格    
            for (int i = 2; i < rowNum; i++) {        	
            	XSSFWorkbook xss = this.getheader(fileUrl);            	
            	XSSFSheet newsheet = xss.getSheetAt(0);
                //第三步创建行row:添加表头0行  
                XSSFRow newrow = newsheet.createRow(2); 
            	XSSFRow row = sheet.getRow(i);
            	int cellNum = row.getLastCellNum();
            	//创建详情对象
            	FinSalaryDetail finSalaryDetail = new FinSalaryDetail();
            	finSalaryDetail.setSalaryId(finSalary.getId());
            	for (int j = 0; j < cellNum; j++) {
            		//创建新的单元格
            		XSSFCell newcell = newrow.createCell(j);
                    XSSFCell cell = row.getCell(Short.parseShort(j + ""));
                    String cellValue = null;
                    if (null != cell) {
                        switch (cell.getCellTypeEnum()) {                     // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
                        case NUMERIC:
                            cellValue = String.valueOf((int) cell.getNumericCellValue());
                            break;
                        case STRING:
                            cellValue = cell.getStringCellValue();
                            break;
                        case FORMULA:
                            cellValue = cell.getNumericCellValue() + "";
                            break;
                        case BLANK:
                            cellValue = "";
                            break;
                        case BOOLEAN:
                            cellValue = String.valueOf(cell.getBooleanCellValue());
                            break;
                        case ERROR:
                            cellValue = String.valueOf(cell.getErrorCellValue());
                            break;
						default:
							break;
                        }
                    } else {
                        cellValue = "";
                    }
                    
                    //入库
                    if(j==0) {
                    	if(StringUtil.isEmpty(cellValue)) {
                    		break;
                    	}
                    	finSalaryDetail.setName(cellValue);
            		}else if(j==1) {
                    	if(StringUtil.isEmpty(cellValue)) {
                    		break;
                    	}
            			finSalaryDetail.setCard(cellValue);
            		}else if(j==2) {
                    	if(StringUtil.isEmpty(cellValue)) {
                    		break;
                    	}
            			finSalaryDetail.setEmail(cellValue);
            		}                    
                    //写值
                    newcell.setCellValue(cellValue);
                    newcell.getCellStyle().cloneStyleFrom(cell.getCellStyle());
            	}
            	FileOutputStream fout = new FileOutputStream(uploadFolder+resfillPath+
            			finSalaryDetail.getName()+"_"+finSalaryDetail.getCard()+".xlsx");
            	xss.write(fout);  
                fout.close();
		    	Map<String, Object> map = new HashMap<String, Object>();
		    	map.put("name",finSalaryDetail.getName());
		    	System.err.println(uploadFolder+resfillPath+finSalaryDetail.getName()+"_"+finSalaryDetail.getCard()+".xlsx");
		    	Boolean flag=  mailUtil.asyncSendMail(finSalaryDetail.getEmail(), "email", map,
		    			uploadFolder+resfillPath+finSalaryDetail.getName()+"_"+finSalaryDetail.getCard()+".xlsx"
		            			,finSalaryDetail.getName()+"_salary");
		    	finSalaryDetail.setPath(uploadFolder+resfillPath+finSalaryDetail.getName()+"_"+finSalaryDetail.getCard()+".xlsx");
		    	if(flag) {
		    		personNum++;
                	finSalaryDetail.setStatus("YES");
                }else {
                	finSalaryDetail.setStatus("NO");
                }
                finSalaryDetailService.save(finSalaryDetail);
            }
            finSalary.setPersonNum((finSalary.getPersonNum()== null ? 0: finSalary.getPersonNum()) + personNum);
            finSalary.setStatus("DONE");
        	finSalaryService.save(finSalary);
            return new RestResponse<String>(ExceptionResult.REQUEST_SUCCESS, "成功！", "");
		} catch (Exception e) {
			e.printStackTrace();
		}   
    	return new RestResponse<String>(ExceptionResult.SYS_ERROR, "失败！", "");

    }
}
