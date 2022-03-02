package dev.mvc.bcategrp;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언
// 스프링이 자동으로 구현
// CategrpDAOInter를 Spring이 구현함.
// DBMS 연결 해제 자동 구현
// JAVA + SQL 결합 코드 자동 구현
// getter, setter 자동 호출
// 개발자는 메소드의 입출력을 정의함.
public interface BcategrpDAOInter {
  /**
   * 등록
   * @param bcategrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(BcategrpVO bcategrpVO);
 
  /**
   * 등록 순서별 목록
   * @return
   */
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