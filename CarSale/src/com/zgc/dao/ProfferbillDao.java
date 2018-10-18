package com.zgc.dao;
import com.zgc.model.Profferbill;
import java.util.*;
import java.lang.Exception;

public interface ProfferbillDao 
{


public List<Profferbill> getAllProfferbill(Profferbill profferbill);

public Profferbill getProfferbillByProfferbill(Profferbill profferbill);

public int addProfferbill(Profferbill profferbill)throws Exception ;

public int updateProfferbill(Profferbill profferbill)throws Exception ;

public int delProfferbill(Profferbill profferbill)throws Exception ;


}