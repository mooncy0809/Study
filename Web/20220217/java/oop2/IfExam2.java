package oop2;

public class IfExam2 {

    public String process(int rank) {
        String product = "";
        
        if (rank == 1) {
            product="노트북";
        } else if (rank == 2) {
            product="무한 복합 프린터";
        } else if (rank == 3) {
            product="512 SSD";
        } else {
            product="다음 기회에...";
        }
        
        String ret = String.format("등수: %d 상품: %s", rank, product);
        
        return ret;
    }

}





