package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.contents.ContentsProc")
  public class ContentsProc implements ContentsProcInter {
    @Autowired
    private ContentsDAOInter contentsDAO;

    @Override
    public int create(ContentsVO contentsVO) {
      int cnt=this.contentsDAO.create(contentsVO);
      return cnt;
    }

}