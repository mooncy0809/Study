package dev.mvc.contents;

import java.io.File;

public class Contents {
    /** 페이지당 출력할 레코드 갯수 */
    public static int RECORD_PER_PAGE = 10;
    
    /** 블럭당 페이지 수, 하나의 블럭은 1개 이상의 페이지로 구성됨 */
    public static int PAGE_PER_BLOCK = 10;

    /** 목록 파일명 */
    public static String LIST_FILE = "list_by_cateno_search_paging.do"; 

    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "C:/kd1/deploy/resort_v1sbm3c/contents/storage/";
            // System.out.println("Windows 10: " + path);
            
        } else {
            // System.out.println("Linux");
            path = "/home/ubuntu/deploy/resort_v1sbm3c/contents/storage/";
        }
        
        return path;
    }
    
}