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
}