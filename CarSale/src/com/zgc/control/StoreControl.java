package com.zgc.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zgc.manage.StorebillManage;
import com.zgc.model.Storebill;

@Controller
public class StoreControl extends BaseControl {
	@Autowired
	private StorebillManage storeManage;

	@RequestMapping("store/toLookStore")
	public String toLookStore(Storebill store,Model model){
		List<Storebill> storeList=storeManage.getAllStorebill(store);
		model.addAttribute("storeList",storeList);
		return "store/lookStore";
	}
	
}
