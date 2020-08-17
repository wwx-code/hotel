package com.hotel.ssm.service;

import com.hotel.ssm.domain.SysLog;

import java.util.List;

public interface ISysLogService {
    //保存日志
    public void save(SysLog sysLog) throws Exception;

    //查询所有日志
    List<SysLog> findAll() throws Exception;
}
