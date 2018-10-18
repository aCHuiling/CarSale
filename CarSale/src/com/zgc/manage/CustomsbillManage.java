package com.zgc.manage;
import com.zgc.model.Customsbill;
import java.util.*;
import java.lang.Exception;

public interface CustomsbillManage 
{


public List<Customsbill> getAllCustomsbill(Customsbill customsbill);

public Customsbill getCustomsbillByCustomsbill(Customsbill customsbill);

public boolean addCustomsbill(Customsbill customsbill)throws Exception ;

public boolean updateCustomsbill(Customsbill customsbill)throws Exception ;

public boolean delCustomsbill(Customsbill customsbill)throws Exception ;

public boolean getCustomsbillByName(Customsbill customsbill);


}