package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;

@Controller
public class CateCont {
    @Autowired
    @Qualifier("dev.mvc.categrp.CategrpProc")
    private CategrpProcInter categrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    public CateCont() {
        System.out.println("-> CateCont created.");
    }
    
    
    /**
     * 등록폼 http://localhost:9091/cate/create.do?categrpno=2
     * 
     * @return
     */
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/cate/create"); // /webapp/WEB-INF/views/cate/create.jsp

      return mav;
    }
    
    /**
     * 등록처리
     * CateVO cateVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨.
     * <form>태그에 존재하는 값들은 CateVO cateVO 객체안의 필드에 setter를 이용하여 자동할당됨.
     * http://localhost:9091/cate/create.do?categrpno=2
     * 자주발생하는 에러
     * Exception: FK 전달이 안됨.
     * Field error in object 'cateVO' on field 'categrpno': rejected value [];
     * codes [typeMismatch.cateVO.categrpno,typeMismatch.categrpno,typeMismatch.int,typeMismatch]; 
     * arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [cateVO.categrpno,categrpno];
     * arguments []; default message [categrpno]]; 
     * default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'categrpno';
     * nested exception is java.lang.NumberFormatException: For input string: ""]]
     * @return
     */
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.POST)
    public ModelAndView create(CateVO cateVO) {
      ModelAndView mav = new ModelAndView();

      // System.out.println("-> categrpno: " + cateVO.getCategrpno());
      
      int cnt = this.cateProc.create(cateVO);
      System.out.println("등록 성공");

      mav.addObject("code", "create_success");
      mav.addObject("cnt", cnt);
      mav.addObject("categrpno", cateVO.getCategrpno());
      mav.addObject("name", cateVO.getName());
      
      mav.setViewName("/cate/msg");
 
      return mav;
    }
    /**
     * 전체 목록
     * http://localhost:9091/cate/list_all.do 
     * @return
     */
    @RequestMapping(value="/cate/list_all.do", method=RequestMethod.GET )
    public ModelAndView list_all() {
      ModelAndView mav = new ModelAndView();
      
      List<CateVO> list = this.cateProc.list_all();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/cate/list_all"); // /cate/list_all.jsp
      return mav;
    }
    /**
     * 카테고리 그룹별 전체 목록
     * http://localhost:9091/cate/list_by_categrpno.do?categrpno=1 
     * @return
     */
    @RequestMapping(value="/cate/list_by_categrpno.do", method=RequestMethod.GET )
    public ModelAndView list_by_categrpno(int categrpno) {
      ModelAndView mav = new ModelAndView();
      
      List<CateVO> list = this.cateProc.list_by_categrpno(categrpno);
      mav.addObject("list", list); // request.setAttribute("list", list);

      CategrpVO  categrpVO = this.categrpProc.read(categrpno); // 카테고리 그룹 정보
      mav.addObject("categrpVO", categrpVO); 
      
      mav.setViewName("/cate/list_by_categrpno"); // /cate/list_by_categrpno.jsp
      return mav;
    }
    
    /**
     * Categrp + Cate join, 연결 목록
     * http://localhost:9091/cate/list_all_join.do 
     * @return
     */
    @RequestMapping(value="/cate/list_all_join.do", method=RequestMethod.GET )
    public ModelAndView list_all_join() {
      ModelAndView mav = new ModelAndView();
      
      List<Categrp_CateVO> list = this.cateProc.list_all_join();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/cate/list_all_join"); // /WEB-INF/views/cate/list_all_join.jsp
      return mav;
    }
}