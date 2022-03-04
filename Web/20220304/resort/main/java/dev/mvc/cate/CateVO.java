package dev.mvc.cate;

/*
CREATE TABLE cate(
    cateno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    categrpno                       NUMBER(10)     NOT NULL,
    name                              VARCHAR2(100)    NOT NULL,
    rdate                              DATE     NOT NULL,
    cnt                                 NUMBER(10)     DEFAULT 0     NOT NULL,
  FOREIGN KEY (categrpno) REFERENCES categrp (categrpno)
); 
 */
public class CateVO {
  /** 카테고리 번호 */
  private int cateno;  
  /** 카테고리 그룹 번호 */
  private int categrpno;
  /** 카테고리 이름 */
  private String name;
  /** 등록일 */
  private String rdate;
  /** 등록된 글 수 */
  private int cnt;
/**
 * @return the cateno
 */
public int getCateno() {
    return cateno;
}
/**
 * @param cateno the cateno to set
 */
public void setCateno(int cateno) {
    this.cateno = cateno;
}
/**
 * @return the categrpno
 */
public int getCategrpno() {
    return categrpno;
}
/**
 * @param categrpno the categrpno to set
 */
public void setCategrpno(int categrpno) {
    this.categrpno = categrpno;
}
/**
 * @return the name
 */
public String getName() {
    return name;
}
/**
 * @param name the name to set
 */
public void setName(String name) {
    this.name = name;
}
/**
 * @return the rdate
 */
public String getRdate() {
    return rdate;
}
/**
 * @param rdate the rdate to set
 */
public void setRdate(String rdate) {
    this.rdate = rdate;
}
/**
 * @return the cnt
 */
public int getCnt() {
    return cnt;
}
/**
 * @param cnt the cnt to set
 */
public void setCnt(int cnt) {
    this.cnt = cnt;
}
}