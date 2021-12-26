package tripmember.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tripmember.bean.TripmemberDTO;
import tripmember.bean.ZipcodeDTO;
import tripmember.service.TripmemberService;

@Controller
@RequestMapping(value = "/tripmember") // 앞에/user가 자동으로 붙는다 이제 생략가능
public class TripmemberController {

	// nadri/ 생략 web.xml쪽에서 생략기능줌
	// jsp는 servlet-context.xml에서생략기능줌

	@Autowired // 정확히는 UserService는 인터페이스이고 이걸 상속받은 UserServiceImpl이 온다
	private TripmemberService tripmemberService;

	@Autowired // 비밀번호 복호화
	BCryptPasswordEncoder passwordEncoder;

	// 메일 보내기
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(@ModelAttribute TripmemberDTO tripmemberDTO, HttpServletRequest request) {
		TripmemberDTO tripmemberDTO2 = tripmemberService.login(tripmemberDTO);// db갔다온 정보

		String inputPwd = null;
		String dbPwd = null;
		System.out.println(tripmemberDTO2);
		if (tripmemberDTO2 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memName", tripmemberDTO2.getName());
			session.setAttribute("memId", tripmemberDTO2.getId());
			session.setAttribute("memEmail", tripmemberDTO2.getEmail());
			session.setAttribute("profileImg", tripmemberDTO2.getProfileImg());
			session.setAttribute("member_seq", tripmemberDTO2.getMember_seq());
			session.setAttribute("nickName", tripmemberDTO2.getNickName());

			// 복호화된 비밀번호 비밀번호 비교하기
			inputPwd = tripmemberDTO.getPwd(); // 로그인시 입력한 비번
			dbPwd = tripmemberDTO2.getPwd(); // db에서 꺼내온 비번
		} // if

		if (!passwordEncoder.matches(inputPwd, dbPwd)) {
			return "fail";
		} else {
			return "ok";

		}
	} // login



	@RequestMapping(value = "/logOut", method = RequestMethod.POST)
	@ResponseBody
	public void logOut(HttpServletRequest request, HttpSession session) {
		// 모든 세션 제거
		session.invalidate();// 무효화
	} // logout

	// 처음화면 보내기
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/index";
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage() {
		return "/repository/jsp/tripmember/myPage";
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	@ResponseBody // 단순문자로 보낼경우에 붙임
	public String checkId(@RequestParam String id) {
		return tripmemberService.checkId(id);
	} // checkId

	@RequestMapping(value = "/checkNickName", method = RequestMethod.POST)
	@ResponseBody // 단순문자로 보낼경우에 붙임
	public String checkNickName(@RequestParam String nickName) {
		return tripmemberService.checkNickName(nickName);
	} // checkId

	@RequestMapping(value = "/checkPost", method = RequestMethod.GET)
	public String checkPost() {
		return "/tripmember/checkPost";
	} // checkPost

	@RequestMapping(value = "/checkPostSearch", method = RequestMethod.POST)
	@ResponseBody // 단순문자로 보낼경우에 붙임
	public List<ZipcodeDTO> checkPostSearch(@ModelAttribute ZipcodeDTO zipcodeDTO) {
		return tripmemberService.checkPostSearch(zipcodeDTO);
	} // checkPostsearch

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	@ResponseBody
	public void write(@ModelAttribute TripmemberDTO tripmemberDTO) {
		System.out.println("아이디 = " + tripmemberDTO.getId());
		System.out.println("비밀번호 = " + tripmemberDTO.getPwd());
		tripmemberDTO.setPwd(passwordEncoder.encode(tripmemberDTO.getPwd()));
		tripmemberService.write(tripmemberDTO);
	} // write

	@GetMapping(value = "/getTripmember")
	public String getTripmember(Model model) {
		model.addAttribute("display", "/repository/jsp/tripmember/getTripmember.jsp");
		return "/repository/jsp/tripmember/myPage";
	} // getTripmember

	@PostMapping("/getTripmemberInfo")
	@ResponseBody
	public TripmemberDTO getTripmemberInfo(HttpSession session) {
		String id = (String) session.getAttribute("memId");

		return tripmemberService.getTripmemberInfo(id);
	}

	@GetMapping(value = "/modifyForm")
	public String modifyForm(Model model) {
		model.addAttribute("display", "/repository/jsp/tripmember/modifyForm.jsp");
		return "/repository/jsp/tripmember/myPage";
	}

	@PostMapping("/modify")
	@ResponseBody
	public void modify(@ModelAttribute TripmemberDTO tripmemberDTO,
					   @RequestParam MultipartFile memberImgchange,
					   HttpSession session) { // dto 여러개는 ModelAttribute로
		
		String profileImg = memberImgchange.getOriginalFilename();
		
		tripmemberDTO.setPwd(passwordEncoder.encode(tripmemberDTO.getPwd())); 	//비번 복호화																				
		String id = (String) session.getAttribute("memId");
		tripmemberDTO.setId(id);
		tripmemberDTO.setProfileImg(profileImg);
		tripmemberService.modify(tripmemberDTO);
	}

	@GetMapping("/deleteForm")
	public String deleteForm(Model model) {
		model.addAttribute("display", "/repository/jsp/tripmember/deleteForm.jsp");
		return "/repository/jsp/tripmember/myPage";
	}

	// 비밀번호 비교
	@RequestMapping(value = "/compare", method = RequestMethod.POST)
	@ResponseBody
	public String compare(@RequestParam String pwd, HttpSession session) {

		String inputPwd = null;
		String dbPwd = null;
		String id = (String) session.getAttribute("memId");
		TripmemberDTO tripmemberDTO2 = tripmemberService.getTripmemberInfo(id);// db갔다온 정보
		inputPwd = pwd; // 비교창에서 입력한 비번
		dbPwd = tripmemberDTO2.getPwd(); // db에서 꺼내온 비번

		if (!passwordEncoder.matches(inputPwd, dbPwd)) {
			return "fail";
		} else {
			return "ok";

		}
	} // compare
		
	@PostMapping("/delete")
	@ResponseBody
	public void delete(HttpSession session) {
		String id = (String) session.getAttribute("memId");
		tripmemberService.delete(id);
	}

	/* 이메일 인증 */
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheckGET(String email) throws Exception {
		System.out.println("이곳은 왔니?" + email);
		// 뷰(View)로부터 넘어온 데이터 확인
		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 이메일 보내기
		String setFrom = "waterha4@naver.com"; // 보내는사람
		String toMail = email; // 받는사람
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			// 메일 내용 넣을 객체 도와주는 Helper객체 생성

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			// 메일 내용 채우기
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);

			// 메일 전송
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// String 타입 변수로 num 으로 바꾸기
		String num = Integer.toString(checkNum);
		System.out.println("두번째 이곳까진 오니?");
		return num;
	} // mialCheckGet

	
	 //개인 이미지 변경하기
	  @RequestMapping(value="/memberImgchange", method=RequestMethod.POST)
	  @ResponseBody
	  public String memberImgchange(@ModelAttribute TripmemberDTO tripmemberDTO,
			      				  @RequestParam MultipartFile memberImgchange,
			      				  HttpSession session) {
		  
	 
		  String filePath=
	//	  "D:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img\\tripmember\\storage";
	//	  "C:\\Users\\downc\\Desktop\\git_home\\nadri\\src\\main\\webapp\\repository\\img\\tripmember\\storage";//현석
		  "C:\\Spring\\workspace\\nadri\\src\\main\\webapp\\repository\\img\\tripmember\\storage";
		  String profileImg = memberImgchange.getOriginalFilename(); 
		 
		  File file=new File(filePath,profileImg);
		  
		  try { 
			  FileCopyUtils.copy(memberImgchange.getInputStream(), new FileOutputStream(file));
			  
			  String id = (String) session.getAttribute("memId");
			  tripmemberDTO.setId(id);
			  tripmemberDTO.setProfileImg(profileImg);
			  
			  
			  tripmemberService.imgModify(tripmemberDTO);	  
		  }catch  (Exception e){
			  e.printStackTrace(); 
		  } 
		  return profileImg;
	  }


} // 클래스
