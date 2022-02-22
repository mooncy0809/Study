package oop2;

public class IfExam3Main {

    public static void main(String[] args) {
        IfExam3 ifexam = new IfExam3();
        
        int num = 5;
        String ret = ifexam.process(num);
        System.out.println("정수: " + num);
        System.out.println(ret);
        
        num = 50;
        ret = ifexam.process(num);
        System.out.println("정수: " + num);
        System.out.println(ret);
        
        num = -50;
        ret = ifexam.process(num);
        System.out.println("정수: " + num);
        System.out.println(ret);
        
    }

}



