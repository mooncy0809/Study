package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResCont {
    public ResCont() {
        System.out.println("-> ResCont created.");
    }
    
    // http://localhost:9091/res/img.do   GET
    @RequestMapping(value = "/res/img.do", method = RequestMethod.GET)
    public ModelAndView img() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/res/img"); // /WEB-INF/views/res/img.jsp

        return mav;

    }
    
    // http://localhost:9091/res/style.do   GET
    @RequestMapping(value = "/res/style.do", method = RequestMethod.GET)
    public ModelAndView css() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/res/style"); // /WEB-INF/views/res/style.jsp

        return mav;

    }
}