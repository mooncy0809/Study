package dev.boot.mvc;

public class YoutubeTest {

    public static void main(String[] args) {
        String url = "<iframe width=\"950\" height=\"534\" src=\"https://www.youtube.com/embed/yNvjituGDLQ\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>";
        String[] url_split = url.split(" "); //문자열을 공백으로 분리
    //    for(int i=0;i<url_split.length;i++) {
    //        System.out.println(url_split[i]);
    //    }
        
    //    System.out.println(url_split[1]);
    //    System.out.println(url_split[2]);
        
        int width1 = url.indexOf("\"");
        System.out.println(width1);
        
        int width2 = url.indexOf("\"",width1+1);
        System.out.println(width2);
        
        int height1 = url.indexOf("\"",width2+1);
        System.out.println(height1);
        
        int height2 = url.indexOf("\"",height1+1);
        System.out.println(height2);
    
    }

}
