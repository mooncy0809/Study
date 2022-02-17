package beans;

public class SungjukService {
    SungjukVO sungjukVO = null;
    
    public SungjukService() {
        System.out.println("-> SungjukService created...");
    }
    
    public SungjukService(SungjukVO sungjukVO) {
        System.out.println("-> SungjukService created....");       
        this.sungjukVO = sungjukVO;
    }
    public void tot() {
        int tot = sungjukVO.getJava() + sungjukVO.getJsp() + sungjukVO.getSpring();
        sungjukVO.setTot(tot);
    }
    
    public void avg() {
        int avg = sungjukVO.getTot()/3;
        sungjukVO.setAvg(avg);
    }
}

