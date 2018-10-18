package com.zgc.manage;
import com.zgc.model.Salebill;
import java.util.*;
import java.lang.Exception;

public interface SalebillManage 
{


public List<Salebill> getAllSalebill(Salebill salebill);

public Salebill getSalebillBySalebill(Salebill salebill);

public boolean addSalebill(Salebill salebill)throws Exception ;

public boolean updateSalebill(Salebill salebill)throws Exception ;

public boolean delSalebill(Salebill salebill)throws Exception ;

public boolean ckSalebillBySaleId(Salebill salebill);

public List<Salebill> getAllSalebillSta(Salebill sale);

public List<Salebill> getAllSalebillByDate(Salebill sale);

public List<Salebill> getAllSalebillByName(Salebill sale);

public List<Salebill> getSalebillByName(Salebill salebill);

public List<Salebill> getSalebillByYear(Salebill salebill);

public List<Salebill> getSalebillByMonth(Salebill salebill);

public List<Salebill> getSalebillBySex(Salebill salebill);

public List<Salebill> getSalebillByKind(Salebill salebill);

public List<Salebill> getSalebillByGroup(Salebill salebill);

public List<Salebill> getallSalebillNotPage(Salebill sale);




}