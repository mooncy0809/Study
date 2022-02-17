package oop2;

public class IfExam3 {

    public String process(int num) {
        String ret = "";
        
        if (num >= 0 && num <= 9) {
            ret = "1의 자리";
          
        } else if (num >= 10 && num <= 99) {
            ret = "10의 자리";
          
        } else if (num >= 100 && num <= 999) {
            ret = "100의자리";
          
        } else if (num >= 1000) {
            ret = "1000의자리 이상";
          
        } else {
            ret = "음수는 처리하지 않습니다";
        }
        
        return ret;

    }

}
