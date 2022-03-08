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
    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
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


}