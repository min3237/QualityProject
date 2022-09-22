package com.cos.QualityProject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.QualityProject.config.auth.PrincipalDetail;
import com.cos.QualityProject.model.QualityPayment;
import com.cos.QualityProject.model.QualityUsers;
import com.cos.QualityProject.model.RoleType;
import com.cos.QualityProject.repository.UserRepository;
import com.cos.QualityProject.service.BoardService;
import com.cos.QualityProject.service.CartService;
import com.cos.QualityProject.service.ItemsService;
import com.cos.QualityProject.service.OrderService;
import com.cos.QualityProject.service.PaymentService;
import com.cos.QualityProject.service.QueryService;
import com.cos.QualityProject.service.UserService;

@Controller
public class controller {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private ItemsService itemsService;
	
	@Autowired
	private QueryService queryService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;
	
/////////////////////	
///    상품페이지    ///
/////////////////////
	
	@GetMapping("productList/{id}")
	public String productList(@PathVariable int id,Model model) {
		model.addAttribute("items", itemsService.listUp());
		model.addAttribute("id", id);
		return "/userForm/productList";
	}
	
	@GetMapping("productDetail/{id}")
	public String productDetail(@PathVariable int id,Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("item", itemsService.toDetail(id));
		model.addAttribute("cartItems",cartService.toDetail(principal.getUser().getId()).getCartItems());
		return "/userForm/productDetail";
	}

/////////////////////	
///    유저페이지    ///
/////////////////////

	@GetMapping("/auth/loginForm") 
	public String loginForm() {
		return "/userForm/loginForm";
	}
	
	@GetMapping("/auth/joinForm") 
	public String joinForm() {
		return "/userForm/joinForm";
	}
	
	@GetMapping("cartPage")
	public String cartPage(Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("cartItems", cartService.toDetail(
		principal.getUser().getId()).getCartItems());
		QualityUsers user = userRepository.findById(principal.getUser().getId()).orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
		model.addAttribute("payments",user.getPayment());
		return "/userForm/cartPage";
	}
	
	@GetMapping("myPage")
	public String myPage() {
		return "/userForm/myPage";
	}
	
	@GetMapping("paymentPage")
	public String paymentPage(Model model,@AuthenticationPrincipal PrincipalDetail principal){
		List<QualityPayment> list = paymentService.listUp();
		ArrayList<QualityPayment> payments = new ArrayList<>();
		for(int i =0; i<list.size();i++) {
			if(list.get(i).getUser().getId()==principal.getUser().getId()) {
				payments.add(list.get(i));
			}
		}
		model.addAttribute("payments", payments);
		return "/userForm/paymentPage";
	}
	
	@GetMapping("paymentSave")
	public String paymentSave() {
		return "/userForm/paymentSave";
	}
	
	@GetMapping("paymentUpdate/{id}")
	public String paymentUpdate(@PathVariable int id,Model model) {
		QualityPayment payment = paymentService.toDetail(id);
		model.addAttribute("payment",paymentService.toDetail(id));
		String cardNum[] = payment.getCardNum().split("-");
		model.addAttribute("cardNum",cardNum);
		return "/userForm/paymentUpdate";
	}
	
	@GetMapping("orderPage")
	public String orderPage(Model model,@PageableDefault(size=10, sort="id"
		,direction = Sort.Direction.ASC)Pageable pageable) {
		model.addAttribute("orders", orderService.listUp(pageable));
		return "/userForm/orderPage";
	}
	
	@GetMapping("orderDetail/{id}")
	public String orderDetail(@PathVariable int id,Model model) {
		model.addAttribute("orders",orderService.listUp(id));
		return "/userForm/orderDetail";
	}
	
	@GetMapping("queryPage")
	public String queryPage(Model model,@PageableDefault(size=10, sort="id"
		,direction = Sort.Direction.ASC)Pageable pageable) {
		model.addAttribute("querys", queryService.listUp(pageable));
		return "/userForm/queryPage";
	}
	
/////////////////////	
///   관리자페이지   ///
/////////////////////
	
	@GetMapping("orderCheck")
	public String orderCheck(Model model,@PageableDefault(size=10,sort="id"
		,direction =Sort.Direction.ASC)Pageable pageable,@AuthenticationPrincipal PrincipalDetail principal){
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("orders", orderService.listUp(pageable));
		return "/admin/orderCheck";
		}else {
			return "index";
		}
	}
	
	@GetMapping("adminOrderDetail/{id}")
	public String adminOrderDetail(@PathVariable int id,Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("orders",orderService.listUp(id));
		return "/admin/adminOrderDetail";
		}else {
			return "index";
		}
	}
	
	@GetMapping("queryReply")
	public String queryReply(Model model,@PageableDefault(size=10,sort="id"
		,direction =Sort.Direction.ASC)Pageable pageable,@AuthenticationPrincipal PrincipalDetail principal){
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("querys", queryService.listUp(pageable));
		return "/admin/queryReply";
		}else {
			return "index";
		}
	}
	
	@GetMapping("queryRep/{id}")
	public String queryRep(@PathVariable int id,Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		model.addAttribute("query", queryService.toDetail(id));
		return "/admin/queryRep";
	}
	
	@GetMapping("regiEvent")
	public String regiEvent(@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		return "/admin/regiEvent";
		}else {
			return "index";
		}
	}
	
	@GetMapping("regiNotice")
	public String regiNotice(Model model,@PageableDefault(size=10,sort="id"
		,direction =Sort.Direction.ASC)Pageable pageable,@AuthenticationPrincipal PrincipalDetail principal){
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("boards", boardService.listUp(pageable));
		return "/admin/regiNotice";
		}else {
			return "index";
		}
	}
	
	@GetMapping("regiNoti")
	public String regiNoti(@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		return "/admin/regiNoti";
		}else {
			return "index";
		}
	}
	
	@GetMapping("updateNoti/{id}")
	public String updateNoti(@PathVariable int id,Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("board", boardService.toDetail(id));
		return "/admin/updateNoti";
		}else {
			return "index";
		}
	}
	
	@GetMapping("regiProduct")
	public String regiProduct(Model model,@PageableDefault(size=10,sort="id"
		,direction =Sort.Direction.ASC)Pageable pageable,@AuthenticationPrincipal PrincipalDetail principal){
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("items", itemsService.listUp(pageable));
		return "/admin/regiProduct";
		}else {
			return "index";
		}
	}
	
	@GetMapping("regiProd")
	public String regiProd(@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		return "/admin/regiProd";
		}else {
			return "index";
		}
	}
	
	@GetMapping("productUpdate/{id}")
	public String productUpdate(@PathVariable int id,Model model,@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal.getUser().getRoles() == RoleType.ADMIN) {
		model.addAttribute("item",itemsService.toDetail(id));
		return "/admin/productUpdate";
		}else {
			return "index";
		}
	}
	
/////////////////////	
///      로그인     ///
/////////////////////

	@GetMapping("/auth/loginForm/{id}")
	public String loginForm(@PathVariable int id,Model model) {
		model.addAttribute("user",userRepository.getById(id));
		return "/userForm/loginForm";
	}
	@GetMapping("/auth/idSearch")
	public String idSearch() {
		return "/userForm/idSearch";
	}
	@GetMapping("/auth/pwdSearch") 
	public String pwdSearch() {
		return "/userForm/pwdSearch";
	}
	
/////////////////////	
///    문의페이지    ///
/////////////////////
	
	@GetMapping("querySave")
	public String querySave() {
		return "/userForm/querySave";
	}
	@GetMapping("queryUpdate/{id}")
	public String queryUpdate(@PathVariable int id,Model model) {
		model.addAttribute("QualityQuery", queryService.toDetail(id));
		return "/userForm/queryUpdate";
	}

/////////////////////	
///    메인페이지    ///
/////////////////////
	
	@GetMapping({"","/"})
	public String index() {
		userService.admin();
		return "index";
	}
	
	@GetMapping("/auth/company")
	public String company() {
		return "/userForm/company";
	}

	@GetMapping("/auth/event")
	public String event(Model model) {
		model.addAttribute("boardevents", boardService.listUp());
		return "/userForm/event";
	}
	
	@GetMapping("/auth/notice")
	public String notice(Model model) {
	model.addAttribute("boardnotices", boardService.listUp());
		return "/userForm/notice";
	}
}