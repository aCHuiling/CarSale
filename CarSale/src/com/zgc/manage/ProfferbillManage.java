package com.zgc.manage;
import com.zgc.model.Profferbill;
import java.util.*;
import java.lang.Exception;

public interface ProfferbillManage 
{


public List<Profferbill> getAllProfferbill(Profferbill profferbill);

public Profferbill getProfferbillByProfferbill(Profferbill profferbill);

public boolean addProfferbill(Profferbill profferbill)throws Exception ;

public boolean updateProfferbill(Profferbill profferbill)throws Exception ;

public boolean delProfferbill(Profferbill profferbill)throws Exception ;

public boolean ckProfferId(String profferId);

public List<Profferbill> getAllProfferId(Profferbill proffer);


}