package oop2;

public class IfExam4Main {
    public static void main(String[] args) {
        IfExam4 ifExam = new IfExam4();
        
        int month = 8;
        String trip = ifExam.process(month);
        System.out.println("월: " + month);
        System.out.println(trip);
        
        month = 11;
        trip = ifExam.process(month);
        System.out.println("월: " + month);
        System.out.println(trip);

        month = 12;
        trip = ifExam.process(month);
        System.out.println("월: " + month);
        System.out.println(trip);
    }
}
