package oop2;

public class IfExam1Main {

  public static void main(String[] args) {
    IfExam1 ifExam1 = new IfExam1();
    
    String msg = ifExam1.process(10);
    System.out.println(msg);
    
    System.out.println();
    msg = ifExam1.process(120);
    System.out.println(msg);
  }

}