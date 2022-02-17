package oop2;

public class IfExam4 {

    public String process(int month) {
        String trip = "";

        if (month >= 3 && month <= 5) {
          trip = "통영";
        } else if (month >= 6 && month <= 8) {
          trip = "미시령 옛길 드라이브";
        } else if (month >= 9 && month <= 11) {
            if (month == 9) {
              trip = "설악산";
            } else if (month == 10) {
              trip = "삼양목장";
            } else if (month == 11) {
              trip = "내장산 단풍";
            }
        } else if (month == 12 || month == 1 || month == 2) {
          trip = "한계령 눈 드라이브";
        }
        
        return trip;
    }

}
