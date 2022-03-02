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
   * 수정 처리
   * @param bcategrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(BcategrpVO bcategrpVO);
  
  /**
   * 조회, 수정폼, 삭제폼
   * @param bcategrpno 카테고리 그룹 번호, PK
   * @return
   */
  public BcategrpVO read(int bcategrpno);
  /**
   * 삭제 처리
   * @param bcategrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int bcategrpno);
  
  /**
   * 출력 순서별 목록
   * @return
   */
  public List<BcategrpVO> list_seqno_asc();
  
  /**
   * 출력 순서 상향
   * @param bcategrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_up(int bcategrpno);
 
  /**
   * 출력 순서 하향
   * @param bcategrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_down(int bcategrpno); 
  
  /**
   * visible 수정
   * @param bcategrpVO
   * @return
   */
  public int update_visible(BcategrpVO bcategrpVO);
}