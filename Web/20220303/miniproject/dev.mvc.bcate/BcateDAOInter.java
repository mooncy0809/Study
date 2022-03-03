package dev.mvc.bcate;

public interface BcateDAOInter {
  /**
   * 등록
   * @param cateVO
   * @return 등록된 갯수
   */
  public int create(BcateVO bcateVO);
  
}