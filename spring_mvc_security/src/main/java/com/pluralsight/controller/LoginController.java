package com.pluralsight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by andrew on 29.05.2016.
 */
@Controller
public class LoginController
{
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login(ModelMap map)
    {
        System.out.println("login triggered");
        return "login";
    }

    @RequestMapping(value="/loginFailed", method = RequestMethod.GET)
    public String loginFailed(ModelMap map)
    {
        System.out.println("login triggered");
        map.addAttribute( "error", "true" );
        return "login";
    }
}
