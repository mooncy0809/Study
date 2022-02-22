package oop2;

public class IfExam5 {

    public String process(int work) {
        String grade = "";
        String sal = "";
        
        if(work >=0 && work <= 5) {
          grade = "초급";
          sal = "2300 ~ 4500";
        }else if(work>=6 && work<=8) {
          grade = "중급";
          sal = "4500 ~ 6500";
        }else if(work>=8 && work<=11) {
          grade = "고급";
          sal = "6500 ~ 7500";
        }else if(work>=12) {
          grade = "특급";
          sal = "7500 ~ 9500";
        }
        
        String ret = String.format("경력: %d 년 등급: %s 년봉: %s", work, grade, sal);
        
        return ret;

    }

}




