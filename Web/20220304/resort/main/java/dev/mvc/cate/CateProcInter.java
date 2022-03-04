package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
  /**
   * 등록
   * @param cateVO
   * @return 등록된 갯수
   */
  public int create(CateVO cateVO);
  /**
   *  전체 목록
   * @return
   */
  public List<CateVO> list_all(); 
  /**
   *  categrpno별 목록
   * @return
   */
  public List<CateVO> list_by_categrpno(int categrpno);   
  
  /**
   * Categrp + Cate join, 연결 목록
   * @return
   */
  public List<Categrp_CateVO> list_all_join();  
  
}