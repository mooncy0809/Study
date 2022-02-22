package dev.mvc.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalcCont {
  public CalcCont() {
    System.out.println("-> CalcCont created.");
  }
  //http://localhost:9091/calc/add.do?no1=100&no2=50
  @RequestMapping(value="/calc/add.do",method=RequestMethod.GET)
  public ModelAndView add(int no1, int no2) {
      System.out.println("->add()");
      
      ModelAndView mav = new ModelAndView();
      
//      System.out.println("no1: "+no1);
//      System.out.println("no2: "+no2);
      
      //request.setAttribute("msg","더하기");
      mav.addObject("msg","더하기");
      mav.addObject("result",no1+no2);
      
      mav.setViewName("/calc/calc1");
      return mav;
  }
  
  @RequestMapping(value="/calc/sub.do",method=RequestMethod.GET)
  public ModelAndView sub(int no1, int no2) {
      System.out.println("->sub()");
      
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("msg","빼기");
      mav.addObject("result",no1-no2);
      
      mav.setViewName("/calc/calc1");
      return mav;
  }
 
  @RequestMapping(value="/calc/mul.do",method=RequestMethod.GET)
  public ModelAndView mul(int no1, int no2) {
      System.out.println("->mul()");
      
      ModelAndView mav = new ModelAndView();
      

      mav.addObject("msg","곱하기");
      mav.addObject("result",no1*no2);
      
      mav.setViewName("/calc/calc1");
      return mav;
  }
  
  @RequestMapping(value="/calc/div.do",method=RequestMethod.GET)
  public ModelAndView div(int no1, int no2) {
      System.out.println("->div()");
      
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("msg","나누기");
      mav.addObject("result",no1/no2);
      
      mav.setViewName("/calc/calc1");
      return mav;
  }
  @RequestMapping(value="/calc/mod.do",method=RequestMethod.GET)
  public ModelAndView mod(int no1, int no2) {
      System.out.println("->mod()");
      
      ModelAndView mav = new ModelAndView();

      mav.addObject("msg","나머지");
      mav.addObject("result",no1%no2);
      
      mav.setViewName("/calc/calc1");
      return mav;
  }
  
}
