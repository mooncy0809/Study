package dev.mvc.bcate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BcateCont {
    @Autowired
    @Qualifier("dev.mvc.bcate.BcateProc")
    private BcateProcInter bcateProc;

    public BcateCont() {
        System.out.println("-> BcateCont created.");
    }
    
    
    /**
     * 등록폼 http://localhost:9091/bookcate/create.do?bcategrpno=2
     * 
     * @return
     */
    @RequestMapping(value = "/bookcate/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/bookcate/create"); // /webapp/WEB-INF/views/bookcate/create.jsp

      return mav;
    }
    
    /**
     * 등록처리
     * BcateVO bcateVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨.
     * <form>태그에 존재하는 값들은 BcateVO bcateVO 객체안의 필드에 setter를 이용하여 자동할당됨.
     * http://localhost:9091/bookcate/create.do?bcategrpno=2
     * 자주발생하는 에러
     * Exception: FK 전달이 안됨.
     * Field error in object 'bcateVO' on field 'bcategrpno': rejected value [];
     * codes [typeMismatch.bcateVO.bcategrpno,typeMismatch.bcategrpno,typeMismatch.int,typeMismatch]; 
     * arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [bcateVO.bcategrpno,bcategrpno];
     * arguments []; default message [bcategrpno]]; 
     * default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'bcategrpno';
     * nested exception is java.lang.NumberFormatException: For input string: ""]]
     * @return
     */
    @RequestMapping(value = "/bookcate/create.do", method = RequestMethod.POST)
    public ModelAndView create(BcateVO bcateVO) {
      ModelAndView mav = new ModelAndView();

      // System.out.println("-> bcategrpno: " + bcateVO.getBcategrpno());
      
      int cnt = this.bcateProc.create(bcateVO);
      System.out.println("등록 성공");

      mav.addObject("code", "create_success");
      mav.addObject("cnt", cnt);
      mav.addObject("bcategrpno", bcateVO.getBcategrpno());
      mav.addObject("name", bcateVO.getName());
      
      mav.setViewName("/bookcate/msg");
 
      return mav;
    }

}