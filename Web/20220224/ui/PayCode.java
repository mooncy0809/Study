package dev.ui;

public class PayCode {
  private Pay pay;
  private String value;
  
  public PayCode(Pay pay, String value) {
    this.pay = pay;
    this.value = value;
  }

  public Pay getPay() {
    return pay;
  }

  public String getValue() {
    return value;
  }
  
}