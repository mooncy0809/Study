package dev.mvc.bcategrp;

/*
    bcategrpno                         NUMBER(7)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(50)     NOT NULL,
    seqno                             NUMBER(7)    DEFAULT 0     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
    rdate                                 DATE     NOT NULL 
 */
public class BcategrpVO {
    /** 카테고리 그룹 번호 */
    private int bcategrpno;
    /** 카테고리 이름 */
    private String name;
    /** 출력 순서 */
    private int seqno;
    /** 출력 모드 */
    private String visible;
    /** 등록일 */
    private String rdate;

    /**
     * @return the bcategrpno
     */
    public int getBcategrpno() {
        return bcategrpno;
    }

    public BcategrpVO() {

    }

    public BcategrpVO(int bcategrpno, String name, int seqno, String visible, String rdate) {
        super();
        this.bcategrpno = bcategrpno;
        this.name = name;
        this.seqno = seqno;
        this.visible = visible;
        this.rdate = rdate;
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
     * @return the seqno
     */
    public int getSeqno() {
        return seqno;
    }

    /**
     * @param seqno the seqno to set
     */
    public void setSeqno(int seqno) {
        this.seqno = seqno;
    }

    /**
     * @return the visible
     */
    public String getVisible() {
        return visible;
    }

    /**
     * @param visible the visible to set
     */
    public void setVisible(String visible) {
        this.visible = visible;
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
}