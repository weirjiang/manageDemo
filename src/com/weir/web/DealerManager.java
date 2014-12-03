package com.weir.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.weir.domain.Dealer;
import com.weir.service.DealerService;

@Controller
@RequestMapping("/admin/dealer")
public class DealerManager{
	@Inject
	protected DealerService dealerService;
	@RequestMapping(value = "/i", method = RequestMethod.GET)
    public String i(Map<String, Object> model) {
		model.put("dealerList", dealerService.listAll());
        return "admin.dealermgr.dealermgr";
        }
  
	@RequestMapping(value = "/toUpdateDealer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> toUpdateDealer(HttpServletRequest req) {
		Map<String, Object> model = new HashMap<String, Object>();
		String id = req.getParameter("id");
		model.put("dealer", dealerService.findOne(id));
		model.put("status", "ok");
		return model;
	}
	@RequestMapping(value = "/updateDealer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateDealer(@Validated Dealer pojo,HttpServletRequest req){
		Map<String,Object> model = new HashMap<String, Object>();
		Dealer dealer = dealerService.findOne(pojo.getId() != null ? pojo.getId() : "");
		//修改操作
		if (dealer != null && dealer.getId() != null){
			if(StringUtils.hasText(pojo.getPayee()))
				dealer.setPayee(pojo.getPayee());
			if(StringUtils.hasText(pojo.getBank()))
				dealer.setBank(pojo.getBank());
			if(StringUtils.hasText(pojo.getAccount()))
				dealer.setAccount(pojo.getAccount());
			if(StringUtils.hasText(pojo.getBrand()))
				dealer.setBrand(pojo.getBrand());
			if(StringUtils.hasText(pojo.getContact()))
				dealer.setContact(pojo.getContact());
			if(StringUtils.hasText(pojo.getTelPhone()))
				dealer.setTelPhone(pojo.getTelPhone());
			dealer.setUpdateTime(new Date());
			dealerService.update(dealer);
			model.put("status", "ok");
		}
		
		return model;
	}
	@RequestMapping(value = "/addDealer", method = RequestMethod.POST)
	@ResponseBody
	public  Map<String,Object> addDealer(@Validated Dealer pojo,HttpServletRequest request) {
		Map<String,Object> model = new HashMap<String, Object>();
		pojo.setId(UUID.randomUUID().toString());
		if (StringUtils.hasText(pojo.getPayee()))
			pojo.setPayee(pojo.getPayee().trim());
		if (StringUtils.hasText(pojo.getAccount()))
			pojo.setAccount(pojo.getAccount().trim());
		if (StringUtils.hasText(pojo.getBank()))
			pojo.setBank(pojo.getBank().trim());
		if (StringUtils.hasText(pojo.getBrand()))
			pojo.setBrand(pojo.getBrand().trim());
		if (StringUtils.hasText(pojo.getContact()))
			pojo.setContact(pojo.getContact().trim());
		if (StringUtils.hasText(pojo.getTelPhone()))
			pojo.setTelPhone(pojo.getTelPhone().trim());
		pojo.setCreatedTime(new Date());
		pojo.setUpdateTime(new Date());
		dealerService.save(pojo);
		model.put("status", "ok");
		return model;
	}
	@RequestMapping(value = "/deleteDealer", method = RequestMethod.POST)
	@ResponseBody
	public  Map<String,Object> deleteDealer(HttpServletRequest request) {
		Map<String,Object> model = new HashMap<String, Object>();
		String id = request.getParameter("id");
		dealerService.delete(id);
		model.put("status", "ok");
		return model;
	}
	@RequestMapping(value = "/importDealer", method = RequestMethod.POST)
	public String importDealer(HttpServletRequest request, Map<String, Object> model) {
		if (request instanceof MultipartRequest) {
			MultipartFile mFile = ((MultipartRequest) request).getFile("dealerExcel");
			File file = new File("temp.xlsx");
			try {
				mFile.transferTo(file);
				FileInputStream is = new FileInputStream(file);
				List<Dealer> dealerList = this.excelToList(is);
				dealerService.batchsave(dealerList);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println(mFile.getContentType());
		} else {
			System.out.println("error");
		}
		model.put("dealerList", dealerService.listAll());
		return "backend.admin.dealer.dealerManage";
	}
	
//    @RequestMapping(value = "/list")
//    @ResponseBody
//    public Map<String, Object> list( @RequestParam(defaultValue = "0") Integer offset, @RequestParam(defaultValue = "100") Integer fetchSize) {
//        List<Dealer> list = dealerService.list(offset, fetchSize);
//        int listSize = dealerService.size();
//        return Utils.pagerWarp(list, listSize);
//    }
    @RequestMapping(value = "/dataTable")
    public String dataTable(){
    	return "admin.dealer.dataTable";
    }
    
//	@RequestMapping(value = "/listDealer", method = RequestMethod.GET)
//	@ResponseBody
//	public Map<String, Object> listDealer(HttpServletRequest request) {
//		Map<String, Object> viewData = new HashMap<String, Object>();
//		Map<String, Object> listData = new HashMap<String, Object>();
//		List<Dealer> dealers = dealerService.listAll();
//		for (Dealer dealer : dealers) {
//			listData.put(dealer.getPayee(), dealer.getPayee());
//		}
//		viewData.put("listData", listData);
//		return viewData;
//	}
    
	@RequestMapping(value = "/getDealer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getDealerByPayee(HttpServletRequest request) {
		String payee = request.getParameter("payee");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dealer", dealerService.getDealerByPayee(payee));
		return model;
	}
	
    @RequestMapping(value = "/listDealer")
    @ResponseBody
    public Map<String, Object> listDealer( @RequestParam(defaultValue = "0") Integer length, @RequestParam(defaultValue = "100") Integer start,@RequestParam(defaultValue = "0") Integer draw) {
    	Integer offset = start;
    	Integer fetchSize = length;
    	List<Dealer> list = dealerService.list(offset, fetchSize);
    	Map<String, Object> model = new HashMap<String, Object>();
    	int listSize = dealerService.size();
    	model.put("data",list);
    	model.put("recordsTotal", listSize);
    	model.put("recordsFiltered", listSize);
    	model.put("draw", draw+1);
    	model.put("start", start);
    	model.put("length", length);
        return model;
    }
    
	public List<Dealer> excelToList(InputStream is) {
		List<Dealer> dealerList = new ArrayList<Dealer>();
		try {
			XSSFWorkbook xwb = new XSSFWorkbook(is);
			XSSFSheet sheet = xwb.getSheetAt(0);
			// 获取行数
			int rowNnm = sheet.getLastRowNum();
			for (int i = 1; i < rowNnm; i++) {
				Dealer dealer = new Dealer();
				XSSFRow row = sheet.getRow(i);
				dealer.setId(UUID.randomUUID().toString());
				dealer.setPayee(row.getCell(1).getStringCellValue());
				dealer.setBank(row.getCell(2).getStringCellValue());
				dealer.setAccount(row.getCell(3).getStringCellValue());
				dealer.setBrand(row.getCell(6).getStringCellValue());
				dealer.setCreatedTime(new Date());
				dealer.setUpdateTime(new Date());
				dealerList.add(dealer);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return dealerList;
	}
}
