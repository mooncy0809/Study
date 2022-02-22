package test;

//String class 주의사항
public class StringTest {
    public static void main(String[] args) {
        String cls = "A";
        
        if(cls == "A") {
            System.out.println("1.A");
        }
        String[] cls_ary = {"A"};
        if(cls_ary[0] == "A") {
            System.out.println("2.A");
        }
        
        String[] cls_ary2 = new String[1];
        cls_ary2[0] = "A";
        
        if(cls_ary2[0] == "A") {
            System.out.println("3.A");
        }
        
        String cls_new = new String("A");
        if(cls_new == "A") { //비교 안됨
            System.out.println("4.A");
        }
        System.out.println("cls_new: "+cls_new);
        
        if(cls_new.equals("A")) {
            System.out.println("5.A");
        }
    }
}
