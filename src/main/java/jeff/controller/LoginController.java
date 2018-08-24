package jeff.controller;

import jeff.dto.LoginDto;
import jeff.service.LoginService;
import jeff.service.ServiceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    private LoginService loginService;

    @Autowired
    public LoginController(ServiceFactory serviceFactory) {
        this.loginService = serviceFactory.getLoginService();
    }

    @RequestMapping(value = {"/", "/login"})
    ModelAndView login() {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/check")
    ModelAndView check(HttpServletRequest request, LoginCommand loginCommand) {
        String userName = loginCommand.getUserName();
        String password = loginCommand.getPassword();
        LoginDto loginDto= loginService.check(userName, password);
        String id;
        String title;
        if(loginDto != null && loginDto.getPassword().equals(password)) {
            title =  loginDto.getTitle();
            id = loginDto.getId();
            return new ModelAndView(title.toLowerCase(), "userId", id);
        } else {
            return new ModelAndView("login", "error", "wrong user name or password.");
        }
    }
}
