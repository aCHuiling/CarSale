package com.zgc.dao;
import com.zgc.model.Salebill;
import java.util.*;
import java.lang.Exception;

public interface SalebillDao 
{


public List<Salebill> getAllSalebill(Salebill salebill);

public Salebill getSalebillBySalebill(Salebill salebill);

public int addSalebill(Salebill salebill)throws Exception ;

public int updateSalebill(Salebill salebill)throws Exception ;

public int delSalebill(Salebill salebill)throws Exception ;

public List<Salebill> getAllSalebillSta(Salebill sale);

public List<Salebill> getAllSalebillByDate(Salebill sale);

public List<Salebill> getSalebillByName(Salebill salebill);

public List<Salebill> getSalebillByYear(Salebill salebill);

public List<Salebill> getSalebillByMonth(Salebill salebill);

public List<Salebill> getSalebillBySex(Salebill salebill);

public List<Salebill> getSalebillByKind(Salebill salebill);

public List<Salebill> getSalebillByGroup(Salebill salebill);

public List<Salebill> getallSalebillNotPage(Salebill sale);

public List<Salebill> getAllSalebillByName(Salebill sale);




}