package dev.el;
 
public class ELDTO {
  private String movie;
  private String name;
  
  // 기본 생성자
  public ELDTO(){
    this.movie = "암살";
    this.name = "전지현";
  }
  
  public ELDTO(String movie, String name){
    this.movie = movie;
    this.name = name;
  }
 
  public String getMovie() {
    System.out.println("getMovie() 호출됨");
    return movie;
  }
 
  public void setMovie(String movie) {
    this.movie = movie;
  }
  
  public String getName() {
    System.out.println("getName() 호출됨");
    
    return name;
  }
 
  public void setName(String name) {
    this.name = name;
  }
 
} 