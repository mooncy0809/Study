package dev.mvc.bcate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.bcate.BcateProc")
public class BcateProc implements BcateProcInter {

  @Autowired
  private BcateDAOInter bcateDAO;
 
  public BcateProc() {
    System.out.println("-> CateProc created");
  }
  
  @Override
  public int create(BcateVO bcateVO) {
    int cnt = this.bcateDAO.create(bcateVO);
    return cnt;
  }

}