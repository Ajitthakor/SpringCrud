package com.training.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.training.bean.user;
import com.training.service.userservice;

@Controller
public class userController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Integer IMAGE_MAX_SIZE = 500000;

	@Autowired
	userservice userService;

	///// For the Loding.......
	@RequestMapping(value = "/Loading", method = RequestMethod.GET)
	public ModelAndView Loading(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandmap = new ModelAndView("common/LoadExample");
		return modelandmap;
	}

	///// For the Dashboard.......
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpSession session,Principal principal) {
		ModelAndView mv = new ModelAndView("common/dashboard");
		String name = principal.getName();
		session.setAttribute("author",name);
		return mv;
	}

	////// Login......
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView login = new ModelAndView("common/login");
		login.addObject("user", new user());
		return login;
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.GET)
	public String doLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("email") String email, RedirectAttributes redirectAttributes) {

		String password = request.getParameter("password");
		// BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

		user user = userService.getcurruntUser(email, password);

		if (email != null && email != "" && password != null && password != "") {

			if (user != null && email.equals(user.getEmail()) && password.equals(user.getPassword())) {
				session.setAttribute("userdata", user);
				return "redirect:home";

			}

		}
		session.setAttribute("email", email);
		redirectAttributes.addFlashAttribute("msg", "Invalid User And Password");

		return "redirect:login";

	}
	////// create new user........

	@RequestMapping(value = "/createUser", method = RequestMethod.GET)
	public ModelAndView createUser(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandmap = new ModelAndView("common/createUser");
		modelandmap.addObject("user", new user());
		return modelandmap;
	}

	@RequestMapping(value = "/saveuser", method = RequestMethod.GET)
	protected String saveUser(@Valid @ModelAttribute("user") user user, BindingResult result,
			HttpServletRequest request) {

		String recipientAddress = request.getParameter("email");
		String password = request.getParameter("password");
		String message = "User Created..!";

		if (!result.hasErrors()) {
			System.out.println("innn" + user);

			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);
			user.setPassword(hashedPassword);
			// user.setCountry(country);
			// System.out.println("Encoed
			// password:->"+passwordEncoder.matches(password, hashedPassword));

			String success = userService.createUser(user);
			System.out.println("Id------>" + user.getUid());
			userService.sendmail(recipientAddress, message);
			System.out.println(success);

			return "redirect:ViewsUser";
			// -------------------------------------------------------------
		} else {
			return "common/createUser";

		}

	}

	///// View User....

	@RequestMapping(value = "/ViewsUser", method = RequestMethod.GET)
	public ModelAndView userList(HttpServletRequest request, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView("common/viewuser");
		List<user> viewuser = userService.getUserList();
		modelAndView.addObject("viewsuser", viewuser);
		return modelAndView;

	}

	///// delete user.....

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request, HttpSession session) {

		userService.deleteUser(Integer.parseInt(request.getParameter("uid")));
		return "redirect:ViewsUser";

	}

	///// Update User......

	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandview = new ModelAndView("common/updateUser");
		user user = userService.updateUser(Integer.parseInt(request.getParameter("uid")));
		if (user != null) {
			modelandview.addObject("user", user);
		}
		return modelandview;
	}

	///// Logout..........

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandmap = new ModelAndView("login");
		return modelandmap;

	}

	///// upload file.........

	@RequestMapping(value = "/uploadFile", method = RequestMethod.GET)
	public ModelAndView uploadfile(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandmap = new ModelAndView("common/fileupload");
		modelandmap.addObject("fileUpload", new user());
		return modelandmap;

	}

	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	public String upload(user uploadItem, HttpSession session, HttpServletRequest request) throws Exception {

		String path = request.getServletContext().getRealPath("/WebContent/uploadedImage/");

		// ----------------------------
		if (null != path && path.length() > 0) {
			int endIndex = path.lastIndexOf("/.metadata");

			String newstr = path.substring(0, endIndex);
			String f = newstr + "/Spring_Crud/WebContent/uploadedImage/";
			// ---------------------------------------------------------------------------
			MultipartFile file = uploadItem.getMyfile();
			InputStream inputStream = file.getInputStream();
			String fileName = f + "/" + file.getOriginalFilename();
			OutputStream outputStream = new FileOutputStream(fileName);

			// write the file to disk
			int readBytes = 0;
			byte[] buffer = new byte[IMAGE_MAX_SIZE];
			while ((readBytes = inputStream.read(buffer, 0, 10000)) != -1) {
				outputStream.write(buffer, 0, readBytes);
			}
			System.out.println("File Uploaded.....");
			outputStream.close();
			inputStream.close();
			// ---------------------------------------------------------------------------
		}
		return "redirect:uploadFile";
	}

	///// Generate Pdf report...........

	@RequestMapping(value = "/userPdfReport", method = RequestMethod.GET)
	public ModelAndView userPdfReport(HttpServletRequest request, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView("common/userPdfReport");
		modelAndView.addObject("viewsuser", userService.getUserList());
		modelAndView.addObject("viewsuser1", userService.getUserList());
		return modelAndView;

	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(HSSFWorkbook workbook, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView("common/userPdfReport");
		modelAndView.addObject("viewsuser1", userService.getUserList());
		modelAndView.addObject("viewsuser", userService.getUserList());

		int uid = Integer.parseInt(request.getParameter("uid"));
		System.out.println("Uid:->" + uid);

		if (request.getParameter("uid") != null) {
			if (request.getParameter("submit").equals("Search")) {
				if (uid > -1) {
					modelAndView.addObject("viewsuser", userService.getUserList(uid));
				}
			} else if (request.getParameter("submit").equals("pdf")) {
				modelAndView.addObject("viewsuser", userService.getUserist(response, uid));

			} else {
				modelAndView.addObject("viewsuser", userService.getUserlistExcel(workbook, request, response, uid));
			}
		}
		return modelAndView;

	}

	///// Forgot password.....

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public ModelAndView forgotpassword(HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView("common/forgotpassword");
		modelAndView.addObject("forgotpass", new user());
		return modelAndView;
	}

	@RequestMapping(value = "/sendPassword", method = RequestMethod.GET)
	public String sendPassword(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {

		ModelAndView modelAndView = new ModelAndView("common/forgotpassword");
		modelAndView.addObject("forgotpass", new user());

		String recipientAddress = request.getParameter("email");
		System.out.println("in");
		List<user> password = userService.forgotpass(recipientAddress);
		System.out.println(password);
		String message = "Hi..!" + recipientAddress + " Your password:-" + password;
		userService.sendmail(recipientAddress, message);
		return "redirect:login";

	}

	///// For the Responsive Gallary.......
	@RequestMapping(value = "/gallary", method = RequestMethod.GET)
	public ModelAndView gallary(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandmap = new ModelAndView("common/gallary");
		return modelandmap;
	}

	///// For the google Map.......
	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public ModelAndView googlemap(HttpServletRequest request, HttpSession session) {
		ModelAndView modelandmap = new ModelAndView("common/googleMapDemo");
		return modelandmap;
	}
}
