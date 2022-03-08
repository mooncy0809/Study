package dev.mvc.contents;

import org.springframework.web.multipart.MultipartFile;

/*
        contentsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        adminno                              NUMBER(10)     NOT NULL ,
        cateno                                NUMBER(10)         NOT NULL ,
        title                                 VARCHAR2(300)         NOT NULL,
        content                               CLOB                  NOT NULL,
        recom                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        replycnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        passwd                                VARCHAR2(15)         NOT NULL,
        word                                  VARCHAR2(300)         NULL ,
        rdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
        price                                 NUMBER(10)      DEFAULT 0 NULL,  
        dc                                    NUMBER(10)      DEFAULT 0 NULL,  
        saleprice                            NUMBER(10)      DEFAULT 0 NULL,  
        point                                 NUMBER(10)      DEFAULT 0 NULL,  
        salecnt                               NUMBER(10)      DEFAULT 0 NULL,  
 */
public class ContentsVO {
  /** 컨텐츠 번호 */
  private int contentsno;
  /** 관리자 번호 */
  private int adminno;
  /** 카테고리 번호*/
  private int cateno;
  /** 제목 */
  private String title = "";
  /** 내용 */
  private String content = "";
  /** 추천수 */
  private int recom;
  /** 조회수 */
  private int cnt = 0;
  /** 댓글수 */
  private int replycnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String word = "";
  /** 등록 날짜 */
  private String rdate = "";
  
  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";  
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;

  /** 정가 */
  private int price;
  /** 할인률 */
  private int dc;
  /** 판매가 */
  private int saleprice;
  /** 포인트 */
  private int point;
  /** 재고 수량 */
  private int salecnt;
  /**
   * 이미지 파일
   * <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택">
   */
  private MultipartFile file1MF;
  
/**
 * @return the contentsno
 */
public int getContentsno() {
    return contentsno;
}

/**
 * @param contentsno the contentsno to set
 */
public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
}

/**
 * @return the adminno
 */
public int getAdminno() {
    return adminno;
}

/**
 * @param adminno the adminno to set
 */
public void setAdminno(int adminno) {
    this.adminno = adminno;
}

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
 * @return the title
 */
public String getTitle() {
    return title;
}

/**
 * @param title the title to set
 */
public void setTitle(String title) {
    this.title = title;
}

/**
 * @return the content
 */
public String getContent() {
    return content;
}

/**
 * @param content the content to set
 */
public void setContent(String content) {
    this.content = content;
}

/**
 * @return the recom
 */
public int getRecom() {
    return recom;
}

/**
 * @param recom the recom to set
 */
public void setRecom(int recom) {
    this.recom = recom;
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

/**
 * @return the replycnt
 */
public int getReplycnt() {
    return replycnt;
}

/**
 * @param replycnt the replycnt to set
 */
public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
}

/**
 * @return the passwd
 */
public String getPasswd() {
    return passwd;
}

/**
 * @param passwd the passwd to set
 */
public void setPasswd(String passwd) {
    this.passwd = passwd;
}

/**
 * @return the word
 */
public String getWord() {
    return word;
}

/**
 * @param word the word to set
 */
public void setWord(String word) {
    this.word = word;
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
 * @return the file1
 */
public String getFile1() {
    return file1;
}

/**
 * @param file1 the file1 to set
 */
public void setFile1(String file1) {
    this.file1 = file1;
}

/**
 * @return the file1saved
 */
public String getFile1saved() {
    return file1saved;
}

/**
 * @param file1saved the file1saved to set
 */
public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
}

/**
 * @return the thumb1
 */
public String getThumb1() {
    return thumb1;
}

/**
 * @param thumb1 the thumb1 to set
 */
public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
}

/**
 * @return the size1
 */
public long getSize1() {
    return size1;
}

/**
 * @param size1 the size1 to set
 */
public void setSize1(long size1) {
    this.size1 = size1;
}

/**
 * @return the price
 */
public int getPrice() {
    return price;
}

/**
 * @param price the price to set
 */
public void setPrice(int price) {
    this.price = price;
}

/**
 * @return the dc
 */
public int getDc() {
    return dc;
}

/**
 * @param dc the dc to set
 */
public void setDc(int dc) {
    this.dc = dc;
}

/**
 * @return the saleprice
 */
public int getSaleprice() {
    return saleprice;
}

/**
 * @param saleprice the saleprice to set
 */
public void setSaleprice(int saleprice) {
    this.saleprice = saleprice;
}

/**
 * @return the point
 */
public int getPoint() {
    return point;
}

/**
 * @param point the point to set
 */
public void setPoint(int point) {
    this.point = point;
}

/**
 * @return the salecnt
 */
public int getSalecnt() {
    return salecnt;
}

/**
 * @param salecnt the salecnt to set
 */
public void setSalecnt(int salecnt) {
    this.salecnt = salecnt;
}

/**
 * @return the file1MF
 */
public MultipartFile getFile1MF() {
    return file1MF;
}

/**
 * @param file1mf the file1MF to set
 */
public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
}

public ContentsVO() {
    
}
  
}
