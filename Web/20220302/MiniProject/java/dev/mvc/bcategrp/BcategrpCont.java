package dev.mvc.bcategrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BcategrpCont {
    @Autowired
    @Qualifier("dev.mvc.bcategrp.BcategrpProc")
    private BcategrpProcInter bcategrpProc;

    public BcategrpCont() {
        System.out.println("-> BcategrpCont created.");
    }

    // http://localhost:9091/bookcategrp/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/bookcategrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/bookcategrp/create"); // webapp/WEB-INF/views/categrp/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/bookcategrp/create.do
    /**
     * 등록 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/bookcategrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(BcategrpVO bcategrpVO) { // categrpVO 자동 생성, Form -> VO
        // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("bcategrpVO", bcategrpVO); 자동 실행
        ModelAndView mav = new ModelAndView();
        int cnt = this.bcategrpProc.create(bcategrpVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);
       
        if (cnt == 1) {
            // System.out.println("등록 성공");
            
             mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
             mav.setViewName("/bookcategrp/msg"); // /WEB-INF/views/categrp/msg.jsp
            
            // response.sendRedirect("/bookcategrp/list.do");
           // mav.setViewName("redirect:/bookcategrp/list.do");
        } else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/bookcategrp/msg"); // /WEB-INF/views/categrp/msg.jsp
        }

        return mav; // forward
    }
    
 // http://localhost:9091/categrp/list.do
//    @RequestMapping(value="/bookcategrp/list.do", method=RequestMethod.GET )
//    public ModelAndView list() {
//      ModelAndView mav = new ModelAndView();
//      
//      List<BcategrpVO> list = this.bcategrpProc.list_categrpno_asc();
//      mav.addObject("list", list); // request.setAttribute("list", list);
//
//      mav.setViewName("/bookcategrp/list"); // /webapp/WEB-INF/views/categrp/list.jsp
//      return mav;
//    }
    
    // http://localhost:9091/bookcategrp/read_update.do?bcategrpno=1
    /**
     * 조회 + 수정폼
     * @param bcategrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/bookcategrp/read_update.do", method=RequestMethod.GET )
    public ModelAndView read_update(int bcategrpno) {
      // request.setAttribute("bcategrpno", int bcategrpno) 작동 안됨.
      
      ModelAndView mav = new ModelAndView();
      
      BcategrpVO bcategrpVO = this.bcategrpProc.read(bcategrpno);
      mav.addObject("bcategrpVO", bcategrpVO);  // request 객체에 저장
      
      List<BcategrpVO> list = this.bcategrpProc.list_categrpno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/bookcategrp/read_update"); // /WEB-INF/views/bookcategrp/read_update.jsp 
      return mav; // forward
    }
    
    // http://localhost:9091/bookcategrp/update.do
    /**
     * 수정 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/bookcategrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(BcategrpVO bcategrpVO) {
        // BcategrpVO bcategrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("bcategrpVO", bcategrpVO); 자동 실행

        ModelAndView mav = new ModelAndView();

        int cnt = this.bcategrpProc.update(bcategrpVO);
        mav.addObject("cnt", cnt); // request에 저장

        // cnt = 0; // error test
        if (cnt == 1) {
            // System.out.println("수정 성공");
            // response.sendRedirect("/bookcategrp/list.do");
            mav.setViewName("redirect:/bookcategrp/list.do");
        } else {
            mav.addObject("code", "update"); // request에 저장, request.setAttribute("code", "update")
            mav.setViewName("/bookcategrp/msg"); // /WEB-INF/views/bookcategrp/msg.jsp
        }

        return mav;
    }
    
 // http://localhost:9091/bookcategrp/read_delete.do
    /**
     * 조회 + 삭제폼
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/bookcategrp/read_delete.do", method=RequestMethod.GET )
    public ModelAndView read_delete(int bcategrpno) {
      ModelAndView mav = new ModelAndView();
      
      BcategrpVO bcategrpVO = this.bcategrpProc.read(bcategrpno); // 삭제할 자료 읽기
      mav.addObject("bcategrpVO", bcategrpVO);  // request 객체에 저장
      
      List<BcategrpVO> list = this.bcategrpProc.list_categrpno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/bookcategrp/read_delete"); // read_delete.jsp
      return mav;
    }
    
 // http://localhost:9091/bookcategrp/delete.do
    /**
     * 삭제
     * @param bcategrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/bookcategrp/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int bcategrpno) {
      ModelAndView mav = new ModelAndView();
      
      BcategrpVO bcategrpVO = this.bcategrpProc.read(bcategrpno); // 삭제 정보
      mav.addObject("bcategrpVO", bcategrpVO);  // request 객체에 저장
      
      int cnt = this.bcategrpProc.delete(bcategrpno); // 삭제 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      mav.setViewName("/bookcategrp/delete_msg"); // delete_msg.jsp

      return mav;
    }
    
 // http://localhost:9091/bookcategrp/list.do
    /**
     * 목록
     * @return
     */
    @RequestMapping(value="/bookcategrp/list.do", method=RequestMethod.GET )
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();

      // 등록 순서별 출력    
      // List<CategrpVO> list = this.categrpProc.list_categrpno_asc();

      // 출력 순서별 출력
      List<BcategrpVO> list = this.bcategrpProc.list_seqno_asc();

      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/bookcategrp/list"); // /webapp/WEB-INF/views/categrp/list.jsp
      return mav;
    }
    
 // http://localhost:9091/bookcategrp/update_seqno_up.do?categrpno=1
    // http://localhost:9091/bookcategrp/update_seqno_up.do?categrpno=1000
    /**
     * 우선순위 상향 up 10 ▷ 1
     * @param bcategrpno 카테고리 번호
     * @return
     */
    @RequestMapping(value="/bookcategrp/update_seqno_up.do", 
                                method=RequestMethod.GET )
    public ModelAndView update_seqno_up(int bcategrpno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.bcategrpProc.update_seqno_up(bcategrpno);  // 우선 순위 상향 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장

      mav.setViewName("redirect:/bookcategrp/list.do"); 
      return mav;
    }  
    
    // http://localhost:9091/bookcategrp/update_seqno_down.do?categrpno=1
    // http://localhost:9091/bookcategrp/update_seqno_down.do?categrpno=1000
    /**
     * 우선순위 하향 up 1 ▷ 10
     * @param bcategrpno 카테고리 번호
     * @return
     */
    @RequestMapping(value="/bookcategrp/update_seqno_down.do", 
                                method=RequestMethod.GET )
    public ModelAndView update_seqno_down(int bcategrpno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.bcategrpProc.update_seqno_down(bcategrpno);
      mav.addObject("cnt", cnt);  // request 객체에 저장

      mav.setViewName("redirect:/bookcategrp/list.do");

      return mav;
    }  
    
    /**
     * 출력 모드의 변경
     * @param bcategrpVO
     * @return
     */
    @RequestMapping(value="/bookcategrp/update_visible.do", 
        method=RequestMethod.GET )
    public ModelAndView update_visible(BcategrpVO bcategrpVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.bcategrpProc.update_visible(bcategrpVO);
      
      mav.setViewName("redirect:/bookcategrp/list.do"); // request 객체 전달 안됨. 
      
      return mav;
    }  
}
 