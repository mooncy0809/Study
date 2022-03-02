package dev.mvc.bcategrp;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.bcategrp.BcategrpProc")
public class BcategrpProc implements BcategrpProcInter {
  // DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당
  // Autowired: DI 사용 선언
  // Spring이 자동으로 CategrpDAOInter를 구현하여 DAO class 생성후 객체를 만들어 할당
  @Autowired 
  private BcategrpDAOInter bcategrpDAO;
  // private CategrpDAOInter categrpDAO = new CategrpDAO();

  @Override
  public int create(BcategrpVO bcategrpVO) {
    int cnt = bcategrpDAO.create(bcategrpVO);
    
    return cnt;
  }
  @Override
  public List<BcategrpVO> list_categrpno_asc() {
    List<BcategrpVO> list = null;
    list = this.bcategrpDAO.list_categrpno_asc();
    return list;
  }
  
  @Override
  public int update(BcategrpVO bcategrpVO) {
    int cnt = 0;
    cnt = this.bcategrpDAO.update(bcategrpVO);
    
    return cnt;
  }
  
  @Override
  public BcategrpVO read(int bcategrpno) {
    BcategrpVO bcategrpVO = null;
    bcategrpVO = this.bcategrpDAO.read(bcategrpno);
    
    return bcategrpVO;
  }
  
  @Override
  public int delete(int bcategrpno) {
    int cnt = 0;
    cnt = this.bcategrpDAO.delete(bcategrpno);
    
    return cnt;
  }
  
  @Override
  public List<BcategrpVO> list_seqno_asc() {
    List<BcategrpVO> list = this.bcategrpDAO.list_seqno_asc();
    return list;
  }
  
  @Override
  public int update_seqno_up(int bcategrpno) {
    int cnt = this.bcategrpDAO.update_seqno_up(bcategrpno);
    
    return cnt;
  }

  @Override
  public int update_seqno_down(int bcategrpno) {
    int cnt = this.bcategrpDAO.update_seqno_down(bcategrpno);    
    return cnt;
  }
  @Override
  public int update_visible(BcategrpVO bcategrpVO) {
    int cnt = 0;
    if (bcategrpVO.getVisible().toUpperCase().equals("Y")) {
      bcategrpVO.setVisible("N");
    } else {
      bcategrpVO.setVisible("Y");
    }
    cnt = this.bcategrpDAO.update_visible(bcategrpVO);
    return cnt;
  }
}