package com.ja.pickbody.secondhand.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.secondhand.service.SecondhandServiceImpl;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.SecondhandCategoryBigVo;
import com.ja.pickbody.vo.SecondhandEvaluateVo;
import com.ja.pickbody.vo.SecondhandImageVo;
import com.ja.pickbody.vo.SecondhandTradeVo;
import com.ja.pickbody.vo.SecondhandVo;

@Controller
@RequestMapping("/secondhand/*")
public class SecondhandController {
	@Autowired
	private SecondhandServiceImpl secondhandService;
	
	@RequestMapping("secondhandMainPage.do")
	public String SecondhandMainPage(Model model) {
		ArrayList<HashMap<String, Object>> list = secondhandService.getBoardList();
		model.addAttribute("list", list);
		return "secondhand/secondhandMain";
	}
	
	@RequestMapping("secondhandWritePage.do")
	public String SecondhandWritePage(Model model) {
		
	ArrayList<SecondhandCategoryBigVo> cbvo = secondhandService.categorybigList();
	model.addAttribute("cbvo", cbvo);
		
		return "secondhand/secondhandWrite";
	}
	@RequestMapping("secondhandWriteProcess.do")
	public String SecondhandWriteProcess(SecondhandVo param, MultipartFile [] files, HttpSession session) {
		
		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles";
		
		ArrayList<SecondhandImageVo> imageVoList = new ArrayList<SecondhandImageVo>();
		
		for(MultipartFile file : files) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			
			//파일명 변환...목표 : 파일명 충돌 방지 , 방법 : 랜덤 + 시간
			UUID uuid = UUID.randomUUID();
			//System.out.println("생성된 uuid : " + uuid.toString());
			long currentTime = System.currentTimeMillis();
			
			String randomFileName = uuid.toString() + "_" + currentTime + ext; 
			
			//날짜 폴더 생성...
			Date today = new Date(); //오늘 날짜 생성 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); //날짜 -> 문자 변환 객체 생성
			String todayFolderName = sdf.format(today);
			
			//예 ) C:/uploadFiles/2021/10/26
			File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			String uploadFilePath = 
					rootUploadFileFolderName + "/" + todayFolderName + "/" + randomFileName;
			
			try {
				file.transferTo(new File(uploadFilePath));
			}catch(Exception e) {
				//실무에서는 여기가 제일 어렵고 중요함...
				e.printStackTrace();
			}
			
			//DB 입력 데이터 구성...
			SecondhandImageVo imageVo = new SecondhandImageVo();
			imageVo.setImage_original_filename(originalFileName);
			imageVo.setImage_link(todayFolderName + "/" + randomFileName);
			
			imageVoList.add(imageVo);
		}
		
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		
		param.setMember_no(member_no);
		
		secondhandService.SecondhandwirteContent(param, imageVoList);
		
		return "redirect:../secondhand/secondhandMainPage.do";
	}
	
	
	
	@RequestMapping("secondhandReadPage.do")
	public String readcontentPage(int item_no, Model model, HttpSession session, int no) {
		
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int buyer_no = 0;
		if(memberUser != null) {
			buyer_no = memberUser.getMember_no();		
		}
		
		
		
		
		HashMap<String, Object> data = secondhandService.getBoard(item_no, buyer_no);
		model.addAttribute("data", data);
		
		ArrayList<HashMap<String, Object>> list = secondhandService.getCommentList(item_no);
		model.addAttribute("list", list);
		
		ArrayList<HashMap<String, Object>> two = secondhandService.getBoardtwoList(no);
		model.addAttribute("two", two);
		
		
		
		
		ArrayList<HashMap<String, Object>> one = secondhandService.getevaluateone(no);
		model.addAttribute("one", one);	
		
		ArrayList<HashMap<String, Object>> boardlist =secondhandService.getboardbymemberno(no);
		model.addAttribute("boardlist", boardlist);
		
		ArrayList<HashMap<String, Object>> salesevaluate = secondhandService.getevaluatesalesbymemberno(no);
		model.addAttribute("salesevaluate", salesevaluate);
		
		ArrayList<HashMap<String, Object>> buyevaluate = secondhandService.getevaluatebuyerbymemberno(no);
		model.addAttribute("buyevaluate", buyevaluate);
		
		return "secondhand/secondhandRead";
		
	}
	
	
	
	
	@RequestMapping("buyprocess.do")
	public String buyprocess(SecondhandTradeVo param, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberUser");
		secondhandService.buyprocess(param);
		
		return "redirect:./secondhandReadPage.do?item_no="+param.getItem_no()+"&no="+memberVo.getMember_no();
	}
	
	@RequestMapping("secondhandWishlist.do")
	public String goWishlist(Model model, HttpSession session){
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");	
		int member_no= memberUser.getMember_no();
		System.out.println(member_no);
		ArrayList<HashMap<String, Object>> list = secondhandService.wishlist(member_no);
		model.addAttribute("list", list);
		
		return "secondhand/secondhandWishlist";	
	}
	
	@RequestMapping("secondhandMyshop.do")
	public String SecondhandMyshop(Model model, HttpSession session) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		
		ArrayList<HashMap<String, Object>> list = secondhandService.getsalelist(member_no);
		model.addAttribute("list", list);
		
		ArrayList<HashMap<String, Object>> listt = secondhandService.getbuylist(member_no);
		model.addAttribute("listt", listt);
		
		return "./secondhand/secondhandMyshop";
	}
	@RequestMapping("secondhandSellpage.do")
	public String Secondhandbuyerlist(Model model, int item_no) {
		ArrayList<HashMap<String, Object>> list = secondhandService.getbuyerlist(item_no);
		model.addAttribute("list", list);
		model.addAttribute("abcd", item_no);
		return "./secondhand/secondhandSellpage";
	}
	
	@RequestMapping("firstprocess.do")
	public String updatefirst(int buy_no, int item_no) {
		
		secondhandService.updatefirstitem(buy_no);
		secondhandService.updatefirstitemm(item_no);
		return "redirect:./secondhandSellpage.do?item_no="+item_no;
	}
	@RequestMapping("secondprocess.do")
	public String updatesecond(int item_no, int buy_no) {
		
		secondhandService.updateseconditem(item_no);
		secondhandService.updatesecondbuyer(buy_no);
		return "redirect:./secondhandSellpage.do?item_no="+item_no;
		
	}
	
	
	@RequestMapping("evaluateprocesssales.do")
	public String writeevaluatesales(SecondhandEvaluateVo vo, int item_no) {
		
		
		secondhandService.writeevaluate(vo);
		secondhandService.updateevaluatefinishsales(item_no);
		return "redirect:./secondhandSellpage.do?item_no="+item_no;
		
	}

	@RequestMapping("evaluateprocessbuyer.do")
	public void writeevaluatebuyer(SecondhandEvaluateVo vo, int buy_no) {
		secondhandService.writeevaluate(vo);
		secondhandService.updateevaluatefinishbuyer(buy_no);
		
	}
	
	
	
	
	
	
	
	
	
	
	
}