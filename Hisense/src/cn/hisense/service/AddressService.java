package cn.hisense.service;

import cn.hisense.pojo.Address;

import java.util.List;

/**
 * 地址业务处理接口
 * @author 王叔叔
 * @create 2022/8/6 20:19
 */
public interface AddressService {


    List<Address> getAddressByuid(String uid);

    Address getAddressByaid(String uid, String aid);

    void updateAddress(String uid, Address address);

    void addAddress(Address address);

    void delAddress(String uid, String aid);

    Address getAddressByoid(String aid);
}
