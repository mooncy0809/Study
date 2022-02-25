package dev.mvc.bcategrp;

import java.util.List;

public interface BcategrpProcInter {
  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(BcategrpVO bcategrpVO);
  public List<BcategrpVO> list_categrpno_asc();
}