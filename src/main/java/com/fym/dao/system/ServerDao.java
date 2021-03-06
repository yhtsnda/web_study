package com.fym.dao.system;

import com.fym.dao.base.BaseOper;
import com.fym.entity.ProxyServerEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;

import java.util.List;

public interface ServerDao extends BaseOper {

    List<HashPageData> getAllServers(PageEntity page);

    List<ProxyServerEntity> getCanUseServers();

    int add(HashPageData data);
    void delete(HashPageData data);
    void update(HashPageData data);

}
