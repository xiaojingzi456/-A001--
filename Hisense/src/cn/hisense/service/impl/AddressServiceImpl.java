package cn.hisense.service.impl;

import cn.hisense.dao.AddressDao;
import cn.hisense.pojo.Address;
import cn.hisense.service.AddressService;

import java.util.List;


public class AddressServiceImpl implements AddressService {

    AddressDao addressDao = new AddressDao();

    @Override
    public List<Address> getAddressByuid(String uid) {

        return addressDao.getAddressByuid(uid);
    }

    @Override
    public Address getAddressByaid(String uid, String aid) {
        return addressDao.getAddressByaid(uid,aid);
    }

    @Override
    public void updateAddress(String uid, Address address) {

        addressDao.updateAddress(uid,address);
    }

    @Override
    public void addAddress(Address address) {
        addressDao.addToAddress(address);
    }

    @Override
    public void delAddress(String uid, String aid) {
        addressDao.updateAddressByadstatus("0",aid,uid);
    }

    @Override
    public Address getAddressByoid(String aid){
        return addressDao.getAddressByoid(aid);
    }
}
