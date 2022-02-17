package beans;

public class SungjukVOTest {

  public static void main(String[] args) {
    SungjukVO vo = new SungjukVO(); // 객체 생성
    // vo.name = "왕눈이";
    // The field SungjukVO.name is not visible
    vo.setName("왕눈이");
    vo.setJava(90);
    vo.setJsp(90);
    vo.setSpring(90);
    
    // vo.setTot(vo.getJava() + vo.getJsp() + vo.getSpring());
    
    int tot = vo.getJava() + vo.getJsp() + vo.getSpring();
    vo.setTot(tot);
    
    // vo.setAvg(vo.getTot()/3);
    int avg = vo.getTot()/3;
    vo.setAvg(avg);
    
    System.out.println("성명: " + vo.getName() );
    System.out.println("java: " + vo.getJava());
    System.out.println("jsp: " + vo.getJsp());
    System.out.println("spring: " + vo.getSpring());
    System.out.println("tot: " + vo.getTot());
    System.out.println("avg: " + vo.getAvg());
  }

}