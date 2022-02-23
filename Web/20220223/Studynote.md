## MyBATIS framework 3.4.1 개론, Website 개발 절차, HTML과 XML의 비교 

[01] 고전적인 패턴
- JAVA와 SQL은 성질이 다른 목적을 가지고 있음에도 강하게 결합되어 개발과 변경이 어려움
- 개발자가 DBMS Open/Close를 모두 수동 작업하며, Close를 누락하면 불규칙하게 서버 다운 발생
- 개발자의 고도의 집중력이 필요하다, 오타가 많이 발생 할 수 있음.
- SQL과 JAVA VO class의 연동 설정을 개발자가 모두 수동으로 해야한다.
- 아래의 코드를 MyBATIS 동적 SQL로 처리 할 수 있다.
- 아래의 코드를 Editplus에 붙이면 색상이 구분되어 출력됨.
    ```
    try {
      con = dbopen.getConnection();

      sql = new StringBuffer();
      sql.append(" SELECT pdsno, categoryno, rname, email, title, content, passwd, cnt,");
      sql.append("            SUBSTRING(rdate, 1, 10) as rdate, web, file1, fstor1,");
      sql.append("            thumb, size1, map, youtube, mp3, mp4, ip, visible");
      sql.append(" FROM pds4");
      sql.append(" ORDER BY pdsno DESC");

      pstmt = con.prepareStatement(sql.toString());
      rs = pstmt.executeQuery(); // SELECT

      while (rs.next() == true) {
        Pds4VO pds4VO = new Pds4VO();
        pds4VO.setPdsno(rs.getInt("pdsno")); // DBMS -> JAVA 객체
        pds4VO.setCategoryno(rs.getInt("categoryno"));
        pds4VO.setRname(rs.getString("rname"));
        pds4VO.setEmail(rs.getString("email"));
        pds4VO.setTitle(rs.getString("title"));
        pds4VO.setContent(rs.getString("content"));
        pds4VO.setPasswd(rs.getString("passwd"));
        pds4VO.setCnt(rs.getInt("cnt"));
        pds4VO.setRdate(rs.getString("rdate"));
        pds4VO.setWeb(rs.getString("web"));
        pds4VO.setFile1(rs.getString("file1"));
        pds4VO.setFstor1(rs.getString("fstor1"));
        pds4VO.setThumb(rs.getString("thumb"));
        pds4VO.setSize1(rs.getLong("size1"));
        pds4VO.setMap(rs.getString("map"));
        pds4VO.setYoutube(rs.getString("youtube"));
        pds4VO.setMp3(rs.getString("mp3"));
        pds4VO.setMp3(rs.getString("mp4"));
        pds4VO.setIp(rs.getString("ip"));
        pds4VO.setVisible(rs.getString("visible"));

        list.add(pds4VO);
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbclose.close(con, pstmt, rs);
    }
    ```

[02] MyBATIS framework 3.4.1 개론 
- http://www.mybatis.org
- download: https://github.com/mybatis/mybatis-3/releases 
- SQL과 비즈니스 로직(자바)이 분리되어 있어 개발 및 배포 및 관리가 뛰어남. 
- 자바 개발시 SQL이 DAO class에 포함되어 있으면 SQL을 추출하여 테스트가 어렵다.
- SQL이 변경되는 경우 관련 자바 코드를 변경해야하는 단점이 있다.
- DAO class에 SQL을 선언할경우 컬럼이 많아지면 JAVA 코드상에서 단순반복 작업이 크게 증가한다.
- MyBATIS를 이용하면 자바와 DBMS의 연결을 XML을 이용하여 선언하고 Connection open/close를
      자동으로 지원함으로 안정성이 높아진다.
- SQL을 JAVA와 분리함으로 독립적인 팀 개발이 가능하며 개발 시간을 단축 할 수 있음.
- SQL 실행과 관련된 많은 코드(Connection, PreparedStatement, ResultSet, ? Parameter 지정)를 코딩할 필요가 없다.
- VO(DTO)가 SELECT시 자동으로 생성된다.
- 일반 SQL뿐만 아니라 PL/SQL, 저장 프로시져까지 MyBATIS는 처리할 수 있음.<br>
       . Stored procedure도 SQL을 JAVA에서 분리하나 데이터베이스 종속적으로
         DBMS를 변경하면 재사용할 수 없고 MySQL 용으로 다시 프로시저를
         제작해야함. 
- 파라미터와 제어문을 이용하여 동적으로 실행 할 SQL을 지정할 수 있음. 
- Spring은 MyBATIS가 선언한 SQL과 관련된 JAVA 코드를 자동으로 생성한다.
- MyBATIS는 SQL 튜닝 기법을 이용하여 우수한 성능을 갖는 웹페이지 제작이 가능하다. 
    
1. 실행 아키텍쳐
                          SqlMapConfig 
                                 ↓ 
                          SQL Map 파일 
                                 ↓ 
입력 ----------> SQL Mapping 구문 ----> MyBATIS 실행 ----> 출력 
Hashtable                   XML                      ↓                   Hashtable  
POJO                                                  DBMS                POJO(VO(DTO), ArrayList...) 
원시 타입                                            MySQL               원시 타입(int, double...)
                                                        MariaDB
                                                         Oracle
  
  
2. 다운 로드 및 설치(Spring을 사용하지 않는 경우, JSP Model 1 기반) 
    - iBATIS 2.0은 MyBATIS 2와 같습니다.
    - iBATIS 3.0부터는 MyBATIS 3로 변경되고 Annotation 기반으로
      문법이 일부 변경됨. 
    - 전자정부 프레임웍 및 대부분의 기업은 MyBATIS를 사용합니다. 
 
 
3. Spring의 경우 다운로드가 필요 없습니다. Gradle, Maven 설정으로 자동 다운됩니다.
   - http://mvnrepository.com

1) Spring Boot
```
dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-jdbc'
    implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.1.4'
    ......
}
```
2) Spring Legacy  
    ```
    <!-- MyBATIS -->
    <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>3.4.1</version>
    </dependency>
 
    <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis-spring</artifactId>
      <version>1.3.1</version>
    </dependency>
    ```
  
4. SQL Maps 설정 파일 
   - transactionManager type="JDBC" 
     . JDBC: 간단한 JDBC기반 트랜잭션 관리 기능을 제공합니다.(일반 적인 사용) 
     . JTA: 컨테이너 기반의 트랜잭션 기능을 제공합니다.(분산 트랜잭션 지원) 
     . EXTERNAL: 트랜잭션 관리자를 제공하지 않고 iBATIS 대신 애플리케이션이 
       직접 트랜잭션을 관리합니다. 

   - commitRequired="false" 
     . Connection을 닫기전에 commit할 것인지 지정합니다. 

   - dataSource type="SIMPLE" 
     . SIMPLE: 간단한 커넥션 풀을 내장한 데이터 소스를 설정하고자 할때 사용 
     . DBCP: Jakarta Commons Database Connection Pool을 제공합니다. 
     . JNDI: JNDI를 통해 할당된 컨테이너 기반 데이터 소스를 공유하도록 제공합니다. 
             
   - sqlMap resource="/src/main/java/dev/mvc/member/member.xml" 
     . java 소스상에 SQL Map 파일을 저장하고 참조할 경로를 지정합니다. 
 
 
5. SQL Map 파일 
   - SQL 쿼리를 XML 파일로 매핑하여 저장한 후 호출하여 실행합니다. 
   
  
6. Project 개발 순서(Spring MVC 기준) 
   
1) 구현 기능 분석(업무 분석) 
2) DB 모델링(TABLE 생성) 
3) SQL 생성 및 테스트 
4) VO(DTO) 생성 
         | 
         |               MyBATIS/iBATIS 
         +---------------┐ 
         |       SQL을 MyBATIS XML로 변환.  
         |                    | 
         |       SQL XML Mapping File 생성 
         |                    | 
         |    Execute Class 생성 (Spring은 자동화)
         +<-------------┘ 
         | 
         | 
5) DAO Interface 생성
6) DAO Interface 구현(DBMS 관련 기능, MyBATIS 사용시는 자동 생성됨)
7) Process Interface 생성(Business Logic, Manager/Service class)
8) Process Interface 구현
9) Spring Controller MVC Action class 생성 
10) Controller, Beans(Tool(Utility 날짜 처리등 각종 메소드), Paging, Download)
11) JSP 제작, Controller, Beans와 연동
12) 테스트


7. JAVA + DBMS 연동 기술 흐름
1) Spring -> MyBATIS -> SQL -> DBMS
   - 대용량 DBMS에 대응하는 SQL 튜닝을 할 수 있음.
2) Spring -> JPA -> SQL 자동 생성됨 -> DBMS
   - SQL을 생성하는 메소드가 지정되어 있어서 규모가 큰 DBMS의 SQL 최적화를 구현하기 어려움.



* HTML과 XML의 비교

   항목                   HTML                           XML
   -----------------------------------------------------------------------------
   태그 생성 기능     태그 생성 불가능             사용자 태그를 만들 수 있음
   적용분야             컨텐츠 출력                   데이터 저장에 편리함
   문서작성정도       쉬움                             어려운 편임(XML+XSL)
   문서내 정보검색   검색이 어려움                 용이함
                           (Google, Naver등 존재)     (강력한 태그 검색 기능)
   출력 형식 언어     CSS                               XSL(CSS+HTML+XML+Script)
   데이터교환성       불필요한 자료가 많음        데이터 교환이 편리함
   대소문자 구분      대소문자를 구분하지 않음  대소문자를 철저히 구분함
                           (대소문자 구분 권장)
   태그의 구현형식   엇갈림 구조를 지원함        안김 구조만 지원함
                           <p><b>홍길순</p></b>  <out><inner>홍길순</inner></out>
                           (안김 구조를 권장함) 
   확장자                *.html, *.htm                   *.xml, *.xsl 
