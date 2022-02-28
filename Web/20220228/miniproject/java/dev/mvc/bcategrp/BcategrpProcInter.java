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
  
  /**
   * 조회, 수정폼
   * select id="read" resultType="dev.mvc.bcategrp.BcategrpVO" parameterType="int"
   * @param bcategrpno 카테고리 그룹 번호, PK
   * @return
   */
  public BcategrpVO read(int bcategrpno);
  
  /**
   * 수정 처리
   * @param bcategrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(BcategrpVO bcategrpVO);
}