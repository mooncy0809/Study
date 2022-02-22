package oop2;

public class IfExam1 {

  public String process(int num) { // Call By Value
    String str = "";
    
    if (num % 2 == 0) {
      str = str + "2의배수";
    }
    
    if (num % 3 == 0) {
      str = str + "\n" + "3의배수";
    } 
    
    if (num % 4 == 0) {
      str = str + "\n" + "4의배수";
    } 
    
    if (num % 5 == 0) {
      str = str + "\n" + "5의배수";
    }

    return str;
  }

}