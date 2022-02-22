package jsp_test;
 
public class Script {
 
  public static void main(String[] args) {
    String name = "투투";
    int kor = 90;
    int eng = 70;
    int mat = 80;
    int tot = kor + eng + mat;
    int avg = tot / 3;
 
    // System.out: 표준 출력 장치, 모니터 콘솔
    System.out.println("--> 성명: " + name);
    // out: web 출력
    System.out.println("WEB");
    System.out.println("성명: " + name);
    System.out.println("국어: " + kor);
    System.out.println("영어: " + eng);
    System.out.println("수학: " + mat);
    System.out.println("총점: " + tot);
    System.out.println("평균: " + avg);
  }
 
}