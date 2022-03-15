package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
//import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ContentsCont {
  @Autowired
  @Qualifier("dev.mvc.categrp.CategrpProc")
  private CategrpProcInter categrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.cate.CateProc")
  private CateProcInter cateProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;
  
  public ContentsCont() {
    System.out.println("-> ContentsCont created.");
  }

  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/contents/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 등록폼 
   * 사전 준비된 레코드: 관리자 1번, cateno 1번, categrpno 1번을 사용하는 경우 테스트 URL
   * http://localhost:9091/contents/create.do?cateno=1&adminno=1 FK 값 명시
   * 
   * @return
   */
  @RequestMapping(value = "/contents/create.do", method = RequestMethod.GET)
  public ModelAndView create(int cateno, int adminno) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    
    mav.addObject("cateVO", cateVO);
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/contents/create"); // /webapp/WEB-INF/views/contents/create.jsp
    // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
    // mav.addObject("content", content);

    return mav; // forward
  }
  /**
   * 등록 처리 http://localhost:9091/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/contents/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    // ------------------------------------------------------------------------------
    // 파일 전송 코드 시작
    // ------------------------------------------------------------------------------
    String file1 = "";          // 원본 파일명 image
    String file1saved = "";  // 저장된 파일명, image
    String thumb1 = "";     // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir"); // 시스템 제공
    // System.out.println("-> User dir: " + user_dir);
    //  --> User dir: C:\kd1\ws_java\resort_v1sbm3c
    
    // 파일 접근임으로 절대 경로 지정, static 폴더 지정
    // 완성된 경로 C:/kd1/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
    String upDir =  user_dir + "/src/main/resources/static/contents/storage/"; // 절대 경로
    // System.out.println("-> upDir: " + upDir);
    
    // 전송 파일이 없어도 file1MF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf = contentsVO.getFile1MF();
    
    file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
    // System.out.println("-> file1: " + file1);
    
    long size1 = mf.getSize();  // 파일 크기
    
    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        thumb1 = Tool.preview(upDir, file1saved, 200, 150); 
      }
      
    }    
    
    contentsVO.setFile1(file1);
    contentsVO.setFile1saved(file1saved);
    contentsVO.setThumb1(thumb1);
    contentsVO.setSize1(size1);
    // ------------------------------------------------------------------------------
    // 파일 전송 코드 종료
    // ------------------------------------------------------------------------------
    
    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.contentsProc.create(contentsVO); 
    
    // ------------------------------------------------------------------------------
    // PK의 return
    // ------------------------------------------------------------------------------
     System.out.println("--> contentsno: " + contentsVO.getContentsno());
     mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
    // ------------------------------------------------------------------------------
    
    if (cnt == 1) {
        mav.addObject("code", "create_success");
        // cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
    } else {
        mav.addObject("code", "create_fail");
    }
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
    
    // System.out.println("--> cateno: " + contentsVO.getCateno());
    // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
    mav.addObject("cateno", contentsVO.getCateno()); // redirect parameter 적용
    mav.addObject("url", "/contents/msg"); // msg.jsp, redirect parameter 적용

    mav.setViewName("redirect:/contents/msg.do"); 
    
    return mav; // forward
  }

  /**
   * 상품 정보 수정 폼
   * 사전 준비된 레코드: 관리자 1번, cateno 1번, categrpno 1번을 사용하는 경우 테스트 URL
   * http://localhost:9091/contents/create.do?cateno=1
   * 
   * @return
   */
  @RequestMapping(value = "/contents/product_update.do", method = RequestMethod.GET)
  public ModelAndView product_update(int cateno, int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    
    mav.addObject("cateVO", cateVO);
    mav.addObject("categrpVO", categrpVO);
    mav.addObject("contentsVO", contentsVO);
    
    mav.setViewName("/contents/product_update"); // /views/contents/product_update.jsp
    // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
    // mav.addObject("content", content);

    return mav; // forward
  }
    /**
  * 상품 정보 수정 처리 http://localhost:9091/contents/product_update.do
  * 
  * @return
  */
 @RequestMapping(value = "/contents/product_update.do", method = RequestMethod.POST)
 public ModelAndView product_update(ContentsVO contentsVO) {
   ModelAndView mav = new ModelAndView();
   
   // Call By Reference: 메모리 공유, Hashcode 전달
   int cnt = this.contentsProc.product_update(contentsVO);
   
   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
   mav.addObject("cateno", contentsVO.getCateno()); // redirect parameter 적용

   // 연속 입력 지원용 변수, Call By Reference에 기반하여 contentsno를 전달 받음
   mav.addObject("contentsno", contentsVO.getContentsno());
   
   mav.addObject("url", "/contents/msg");  // msg.jsp

   if (cnt == 1) {
       mav.addObject("code", "product_success"); 
   } else {
       mav.addObject("code", "product_fail"); 
   }
   
   mav.setViewName("redirect:/contents/msg.do"); 
   
   return mav; // forward
 }
 
 /**
  * 카테고리별 목록 http://localhost:9091/contents/list_by_cateno.do?cateno=1
  * 
  * @return
  */
  @RequestMapping(value = "/contents/list_by_cateno.do", method = RequestMethod.GET)
   public ModelAndView list_by_cateno(int cateno) { 
     ModelAndView mav = new  ModelAndView(); 
     mav.setViewName("/contents/list_by_cateno");
     
     // 테이블 이미지 기반, /webapp/contents/list_by_cateno.jsp
     mav.setViewName("/contents/list_by_cateno");
     
     CateVO cateVO = this.cateProc.read(cateno); mav.addObject("cateVO", cateVO);
     
     CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
     mav.addObject("categrpVO", categrpVO);
     
     List<ContentsVO> list = this.contentsProc.list_by_cateno(cateno);
     mav.addObject("list", list);
     
     return mav; // forward 
   }
  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/contents/read.do", method=RequestMethod.GET )
  public ModelAndView read(int contentsno) {
    ModelAndView mav = new ModelAndView();

    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO); // request.setAttribute("contentsVO", contentsVO);

    CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
    mav.addObject("cateVO", cateVO); 

    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO); 
    
    mav.setViewName("/contents/read"); // /WEB-INF/views/contents/read.jsp
        
    return mav;
  }
  
  /**
   * 목록 + 검색 지원
   * http://localhost:9090/contents/list_by_cateno_search.do?cateno=1&word=스위스
   * @param cateno
   * @param word
   * @return
   */
    @RequestMapping(value = "/contents/list_by_cateno_search.do", method = RequestMethod.GET)
    public ModelAndView list_by_cateno_search(@RequestParam(value="cateno", defaultValue="1") int cateno,
                                                                    @RequestParam(value="word", defaultValue="") String word ) {
    
    ModelAndView mav = new ModelAndView(); 
         
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용 
    HashMap<String, Object> map = new HashMap<String, Object>(); 
    map.put("cateno", cateno); // #{cateno}
    map.put("word", word); // #{word}
    
    // 검색 목록 
    List<ContentsVO> list = contentsProc.list_by_cateno_search(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수 
    int search_count = contentsProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    CateVO cateVO = cateProc.read(cateno); 
    mav.addObject("cateVO", cateVO);
    
    CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
    mav.addObject("categrpVO", categrpVO);
    
    mav.setViewName("/contents/list_by_cateno_search");   // /contents/list_by_cateno_search.jsp
    
    return mav; 
  }
    /**
     * 목록 + 검색 + 페이징 지원
     * http://localhost:9090/contents/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
     * 
     * @param cateno
     * @param word
     * @param now_page
     * @return
     */
    @RequestMapping(value = "/contents/list_by_cateno_search_paging.do", method = RequestMethod.GET)
    public ModelAndView list_by_cateno_search_paging(@RequestParam(value = "cateno", defaultValue = "1") int cateno,
                                                                           @RequestParam(value = "word", defaultValue = "") String word,
                                                                           @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
      System.out.println("--> now_page: " + now_page);

      ModelAndView mav = new ModelAndView();

      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("cateno", cateno); // #{cateno}
      map.put("word", word); // #{word}
      map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

      // 검색 목록
      List<ContentsVO> list = contentsProc.list_by_cateno_search_paging(map);
      mav.addObject("list", list);

      // 검색된 레코드 갯수
      int search_count = contentsProc.search_count(map);
      mav.addObject("search_count", search_count);

      CateVO cateVO = cateProc.read(cateno);
      mav.addObject("cateVO", cateVO);

      CategrpVO categrpVO = categrpProc.read(cateVO.getCategrpno());
      mav.addObject("categrpVO", categrpVO);

      /*
       * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
       * 18 19 20 [다음]
       * @param cateno 카테고리번호
       * @param search_count 검색(전체) 레코드수
       * @param now_page 현재 페이지
       * @param word 검색어
       * @return 페이징 생성 문자열
       */
      String paging = contentsProc.pagingBox(cateno, search_count, now_page, word);
      mav.addObject("paging", paging);

      mav.addObject("now_page", now_page);

      // /contents/list_by_cateno_table_img1_search_paging.jsp
      mav.setViewName("/contents/list_by_cateno_search_paging");

      return mav;
    }   
    /**
     * Grid 형태의 화면 구성 http://localhost:9091/contents/list_by_cateno_grid.do
     * 
     * @return
     */
    @RequestMapping(value = "/contents/list_by_cateno_grid.do", method = RequestMethod.GET)
    public ModelAndView list_by_cateno_grid(int cateno) {
      ModelAndView mav = new ModelAndView();
      
      CateVO cateVO = this.cateProc.read(cateno);
      mav.addObject("cateVO", cateVO);
      
      CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
      mav.addObject("categrpVO", categrpVO);
      
      List<ContentsVO> list = this.contentsProc.list_by_cateno(cateno);
      mav.addObject("list", list);

      // 테이블 이미지 기반, /webapp/contents/list_by_cateno_grid.jsp
      mav.setViewName("/contents/list_by_cateno_grid");

      return mav; // forward
    }
    
    /**
     * 수정 폼
     * http://localhost:9091/contents/update_text.do?contentsno=1
     * 
     * @return
     */
    @RequestMapping(value = "/contents/update_text.do", method = RequestMethod.GET)
    public ModelAndView update_text(int contentsno) {
      ModelAndView mav = new ModelAndView();
      
      ContentsVO contentsVO = this.contentsProc.read_update_text(contentsno);
      CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
      CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
      
      mav.addObject("contentsVO", contentsVO);
      mav.addObject("cateVO", cateVO);
      mav.addObject("categrpVO", categrpVO);
      
      mav.setViewName("/contents/update_text"); // /WEB-INF/views/contents/update_text.jsp
      // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
      // mav.addObject("content", content);

      return mav; // forward
    }

    /**
     * 수정 처리
     * http://localhost:9091/contents/update_text.do?contentsno=1
     * 
     * @return
     */
    @RequestMapping(value = "/contents/update_text.do", method = RequestMethod.POST)
    public ModelAndView update_text(ContentsVO contentsVO,
                                                    @RequestParam(value = "word", defaultValue = "") String word,
                                                    @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
      ModelAndView mav = new ModelAndView();
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("contentsno", contentsVO.getContentsno());
      map.put("passwd", contentsVO.getPasswd());
      
      int cnt = 0;
      int passwd_cnt = this.contentsProc.passwd_check(map);
      if (passwd_cnt == 1) {
          cnt = this.contentsProc.update_text(contentsVO); // 수정 처리
          
          mav.addObject("now_page", now_page);
          mav.addObject("contentsno", contentsVO.getContentsno());
          mav.setViewName("redirect:/contents/read.do");             
      } else {
          mav.addObject("cnt", cnt);
          mav.addObject("code", "passwd_fail");
          mav.addObject("url", "/contents/msg"); 
          mav.setViewName("redirect:/contents/msg.do"); 
      }

      return mav; // forward
    }
    /**
     * 파일 수정 폼
     * http://localhost:9091/contents/update_file.do?contentsno=1
     * 
     * @return
     */
    @RequestMapping(value = "/contents/update_file.do", method = RequestMethod.GET)
    public ModelAndView update_file(int contentsno) {
      ModelAndView mav = new ModelAndView();
      
      ContentsVO contentsVO = this.contentsProc.read(contentsno);
      CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
      CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
      
      mav.addObject("contentsVO", contentsVO);
      mav.addObject("cateVO", cateVO);
      mav.addObject("categrpVO", categrpVO);
      
      mav.setViewName("/contents/update_file"); // /WEB-INF/views/contents/update_file.jsp

      return mav; // forward
    }

    /**
     * 파일 수정 처리 http://localhost:9091/contents/update_file.do
     * 
     * @return
     */
    @RequestMapping(value = "/contents/update_file.do", method = RequestMethod.POST)
    public ModelAndView update_file(HttpServletRequest request, ContentsVO contentsVO, int now_page) {
      ModelAndView mav = new ModelAndView();
      
      System.out.println("->now_page:"+now_page);
      
      // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
      ContentsVO contentsVO_old = contentsProc.read(contentsVO.getContentsno());
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("contentsno", contentsVO.getContentsno());
      map.put("passwd", contentsVO.getPasswd());
      
      int cnt = 0;
      int passwd_cnt = this.contentsProc.passwd_check(map);
      if (passwd_cnt == 1) { // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
          // -------------------------------------------------------------------
          // 파일 삭제 코드 시작
          // -------------------------------------------------------------------
//          System.out.println("contentsno: " + vo.getContentsno());
//          System.out.println("file1: " + vo.getFile1());
          
          String file1saved = contentsVO_old.getFile1saved();
          String thumb1 = contentsVO_old.getThumb1();
          long size1 = 0;
          boolean sw = false;
          
          // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
          String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로

          sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
          sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
          // System.out.println("sw: " + sw);
          // -------------------------------------------------------------------
          // 파일 삭제 종료 시작
          // -------------------------------------------------------------------
          
          // -------------------------------------------------------------------
          // 파일 전송 코드 시작
          // -------------------------------------------------------------------
          String file1 = "";          // 원본 파일명 image

          // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
          // String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로
          
          // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
          // <input type='file' class="form-control" name='file1MF' id='file1MF' 
          //           value='' placeholder="파일 선택">
          MultipartFile mf = contentsVO.getFile1MF();
          
          file1 = mf.getOriginalFilename(); // 원본 파일명
          size1 = mf.getSize();  // 파일 크기
          
          if (size1 > 0) { // 파일 크기 체크
            // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
            file1saved = Upload.saveFileSpring(mf, upDir); 
            
            if (Tool.isImage(file1saved)) { // 이미지인지 검사
              // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
              thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
            }
            
          } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
              file1="";
              file1saved="";
              thumb1="";
              size1=0;
          }
          
          contentsVO.setFile1(file1);
          contentsVO.setFile1saved(file1saved);
          contentsVO.setThumb1(thumb1);
          contentsVO.setSize1(size1);
          // -------------------------------------------------------------------
          // 파일 전송 코드 종료
          // -------------------------------------------------------------------
          
          // Call By Reference: 메모리 공유, Hashcode 전달
          cnt = this.contentsProc.update_file(contentsVO);
          System.out.println("-> cnt: " + cnt);
          
          mav.addObject("contentsno", contentsVO.getContentsno());
          mav.addObject("now_page", now_page);
          mav.setViewName("redirect:/contents/read.do"); 
          
      } else { // 패스워드 오류
          mav.addObject("cnt", cnt);
          mav.addObject("code", "passwd_fail");
          mav.addObject("url", "/contents/msg"); 
          mav.setViewName("redirect:/contents/msg.do");
      }

      mav.addObject("cateno", contentsVO_old.getCateno());
      System.out.println("-> cateno: " + contentsVO_old.getCateno());
      
      return mav; // forward
    }      
    
    /**
     * 삭제 폼
     * @param contentsno
     * @return
     */
    @RequestMapping(value="/contents/delete.do", method=RequestMethod.GET )
    public ModelAndView delete(int contentsno) { 
      ModelAndView mav = new  ModelAndView();
      
      // 삭제할 정보를 조회하여 확인
      ContentsVO contentsVO = this.contentsProc.read(contentsno);
      CateVO cateVO = this.cateProc.read(contentsVO.getCateno());
      CategrpVO categrpVO = this.categrpProc.read(cateVO.getCategrpno());
      
      mav.addObject("contentsVO", contentsVO);
      mav.addObject("cateVO", cateVO);
      mav.addObject("categrpVO", categrpVO);
      
      mav.setViewName("/contents/delete");  // contents/delete.jsp
      
      return mav; 
    }

    /**
     * 삭제 처리 http://localhost:9091/contents/delete.do
     * 
     * @return
     */
    @RequestMapping(value = "/contents/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(HttpServletRequest request, ContentsVO contentsVO, 
                                            int now_page,
                                            @RequestParam(value="word", defaultValue="") String word) {
      ModelAndView mav = new ModelAndView();
      int contentsno = contentsVO.getContentsno();
      
      HashMap<String, Object> passwd_map = new HashMap<String, Object>();
      passwd_map.put("contentsno", contentsVO.getContentsno());
      passwd_map.put("passwd", contentsVO.getPasswd());
      
      int cnt = 0;
      int passwd_cnt = this.contentsProc.passwd_check(passwd_map);
      if (passwd_cnt == 1) { // 패스워드 일치 -> 등록된 파일 삭제 -> 신규 파일 등록
          // -------------------------------------------------------------------
          // 파일 삭제 코드 시작
          // -------------------------------------------------------------------
          // 삭제할 파일 정보를 읽어옴.
          ContentsVO vo = contentsProc.read(contentsno);
//          System.out.println("contentsno: " + vo.getContentsno());
//          System.out.println("file1: " + vo.getFile1());
          
          String file1saved = vo.getFile1saved();
          String thumb1 = vo.getThumb1();
          long size1 = 0;
          boolean sw = false;
          
          // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage/
          String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로

          sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
          sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
          // System.out.println("sw: " + sw);
          // -------------------------------------------------------------------
          // 파일 삭제 종료 시작
          // -------------------------------------------------------------------
          
          cnt = this.contentsProc.delete(contentsno); // DBMS 삭제
          
          // -------------------------------------------------------------------------------------
//          System.out.println("-> cateno: " + vo.getCateno());
//          System.out.println("-> word: " + word);
//          
//          // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
//          HashMap<String, Object> page_map = new HashMap<String, Object>();
//          page_map.put("cateno", vo.getCateno());
//          page_map.put("word", word);
//          // 10번째 레코드를 삭제후
//          // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
//          // 페이지수를 4 -> 3으로 감소 시켜야함.
//          if (contentsProc.search_count(page_map) % Contents.RECORD_PER_PAGE == 0) {
//            now_page = now_page - 1;
//            if (now_page < 1) {
//              now_page = 1; // 시작 페이지
//            }
//          }
          // -------------------------------------------------------------------------------------
          
          mav.addObject("now_page", now_page);
          mav.setViewName("redirect:/contents/list_by_cateno_search_paging.do"); 

      } else { // 패스워드 오류
          mav.addObject("cnt", cnt);
          mav.addObject("code", "passwd_fail");
          mav.addObject("url", "/contents/msg");
          mav.setViewName("redirect:/contents/msg.do");
      }
      mav.addObject("cateno", contentsVO.getCateno());
      System.out.println("-> cateno: " + contentsVO.getCateno());
      
      return mav; // forward
    }   
    
}