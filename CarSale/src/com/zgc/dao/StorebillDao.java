package com.zgc.dao;
import com.zgc.model.Storebill;
import java.util.*;
import java.lang.Exception;

public interface StorebillDao 
{


public List<Storebill> getAllStorebill(Storebill storebill);

public Storebill getStorebillByStorebill(Storebill storebill);

public int addStorebill(Storebill storebill)throws Exception ;

public int updateStorebill(Storebill storebill)throws Exception ;

public int delStorebill(Storebill storebill)throws Exception ;


}