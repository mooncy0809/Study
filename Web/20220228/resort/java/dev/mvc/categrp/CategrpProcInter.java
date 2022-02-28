package dev.mvc.categrp;

import java.util.List;

public interface CategrpProcInter {
  /**
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(CategrpVO categrpVO);
  public List<CategrpVO> list_categrpno_asc();
  
  /**
   * 조회, 수정폼
   * select id="read" resultType="dev.mvc.categrp.CategrpVO" parameterType="int"
   * @param categrpno 카테고리 그룹 번호, PK
   * @return
   */
  public CategrpVO read(int categrpno);
  
  /**
   * 수정 처리
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(CategrpVO categrpVO);
}