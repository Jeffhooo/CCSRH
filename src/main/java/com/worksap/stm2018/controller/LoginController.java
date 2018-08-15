package com.worksap.stm2018.controller;

import com.worksap.stm2018.service.LoginService;
import com.worksap.stm2018.service.ServiceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
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
        String result = loginService.check(userName, password);
        if(result.equals("false")) {
            return new ModelAndView("login", "error", "wrong user name or password.");
        } else if(result.equals("Staff")) {
            return new ModelAndView("staff");
        } else if(result.equals("Manager")) {
            return new ModelAndView("manager");
        } else {
            return new ModelAndView("login");
        }
    }
}
