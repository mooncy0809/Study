package dev.mvc.categrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.categrp.CategrpProc")
public class CategrpProc implements CategrpProcInter {
  // DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당
  // Autowired: DI 사용 선언
  // Spring이 자동으로 CategrpDAOInter를 구현하여 DAO class 생성후 객체를 만들어 할당
  @Autowired 
  private CategrpDAOInter categrpDAO;
  // private CategrpDAOInter categrpDAO = new CategrpDAO();

  @Override
  public int create(CategrpVO categrpVO) {
    int cnt = categrpDAO.create(categrpVO);
    
    return cnt;
  }
  @Override
  public List<CategrpVO> list_categrpno_asc() {
    List<CategrpVO> list = null;
    list = this.categrpDAO.list_categrpno_asc();
    return list;
  }
  
  @Override
  public CategrpVO read(int categrpno) {
    CategrpVO categrpVO = this.categrpDAO.read(categrpno);
    
    return categrpVO;
  }
  
  @Override
  public int update(CategrpVO categrpVO) {
    int cnt = 0;
    cnt = this.categrpDAO.update(categrpVO);
    
    return cnt;
  }
}