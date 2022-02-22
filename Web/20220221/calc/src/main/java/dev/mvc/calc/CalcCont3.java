package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalcCont3 {
    public CalcCont3() {
        System.out.println("-> CalcCont3 created.");
    }

    // http://localhost:9091/WEB-INF/views/calc/tot_form.jsp X
    // http://localhost:9091/calc/add3.do   GET
    // request.setAttribute("calcVO", calcVO); == mav.addObject("calcVO", calcVO);
    @RequestMapping(value = "/calc/add3.do", method = RequestMethod.GET)
    public ModelAndView add3() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/calc/tot_form"); // /WEB-INF/views/calc/tot_form.jsp

        return mav;

    }
    
    // http://localhost:9091/calc/add3.do   POST
    // request.setAttribute("calcVO", calcVO); == mav.addObject("calcVO", calcVO);
    @RequestMapping(value = "/calc/add3.do", method = RequestMethod.POST)
    public ModelAndView add3(CalcVO calcVO) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("/calc/tot_proc"); // /WEB-INF/views/calc/tot_proc.jsp
        
        calcVO.setMsg("더하기");
        calcVO.setResult(calcVO.getNo1() + calcVO.getNo2());

        return mav;

    }

}


