package dev.mvc.bcate;

/*
CREATE TABLE bcate(
    bcateno                            NUMBER(10)     NOT NULL    PRIMARY KEY,
    bcategrpno                       NUMBER(10)     NOT NULL,
    name                              VARCHAR2(100)    NOT NULL,
    rdate                              DATE     NOT NULL,
    cnt                                 NUMBER(10)     DEFAULT 0     NOT NULL,
  FOREIGN KEY (bcategrpno) REFERENCES bcategrp (bcategrpno)
); 
 */
public class BcateVO {
  /** 카테고리 번호 */
  private int bcateno;  
  /** 카테고리 그룹 번호 */
  private int bcategrpno;
  /** 카테고리 이름 */
  private String name;
  /** 등록일 */
  private String rdate;
  /** 등록된 글 수 */
  private int cnt;
/**
 * @return the bcateno
 */
public int getBcateno() {
    return bcateno;
}
/**
 * @param bcateno the bcateno to set
 */
public void setBcateno(int bcateno) {
    this.bcateno = bcateno;
}
/**
 * @return the bcategrpno
 */
public int getBcategrpno() {
    return bcategrpno;
}
/**
 * @param bcategrpno the bcategrpno to set
 */
public void setBcategrpno(int bcategrpno) {
    this.bcategrpno = bcategrpno;
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