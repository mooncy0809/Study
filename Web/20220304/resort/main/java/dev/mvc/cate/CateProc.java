package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.cate.CateProc")
public class CateProc implements CateProcInter {

  @Autowired
  private CateDAOInter cateDAO;
 
  public CateProc() {
    System.out.println("-> CateProc created");
  }
  
  @Override
  public int create(CateVO cateVO) {
    int cnt = this.cateDAO.create(cateVO);
    return cnt;
  }
  @Override
  public List<CateVO> list_all() {
      List<CateVO> list = this.cateDAO.list_all();
      return list;
  }
  
  @Override
  public List<CateVO> list_by_categrpno(int categrpno) {
    List<CateVO> list = this.cateDAO.list_by_categrpno(categrpno);
    
    return list;
  }
  @Override
  public List<Categrp_CateVO> list_all_join() {
    List<Categrp_CateVO> list = this.cateDAO.list_all_join();
    return list;
  }
}