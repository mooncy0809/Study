package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// http://localhost:9091/calc/add2.do?no1=100&&no2=50

@Controller
public class CalcCont2 {
  public CalcCont2() {
    System.out.println("-> CalcCont2 created.");
  }

  @RequestMapping(value="/calc/add2.do",method=RequestMethod.GET)
  public ModelAndView add2(CalcVO calcVO) {
    ModelAndView mav = new ModelAndView();    
    mav.setViewName("/calc/calc_vo"); // /WEB-INF/views/calc/calc_vo.jsp
    
    calcVO.setMsg("더하기");
    calcVO.setResult(calcVO.getNo1()+calcVO.getNo2());
    return mav;

  }
}