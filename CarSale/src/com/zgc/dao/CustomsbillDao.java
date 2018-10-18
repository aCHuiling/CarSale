package com.zgc.dao;
import com.zgc.model.Customsbill;
import java.util.*;
import java.lang.Exception;

public interface CustomsbillDao 
{


public List<Customsbill> getAllCustomsbill(Customsbill customsbill);

public Customsbill getCustomsbillByCustomsbill(Customsbill customsbill);

public int addCustomsbill(Customsbill customsbill)throws Exception ;

public int updateCustomsbill(Customsbill customsbill)throws Exception ;

public int delCustomsbill(Customsbill customsbill)throws Exception ;


}