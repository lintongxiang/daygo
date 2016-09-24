package com.daygo.test;

import java.sql.SQLException;
import java.util.ArrayList;

import com.daygo.dao.AddressDao;
import com.daygo.entity.Address;



public class AddressTest {
	
	@org.junit.Test
	public void add(){
		AddressDao dao = new AddressDao();
		Address address = new Address();
		address.setA_tel("55555");
		address.setA_name("5555");
		address.setA_add("4555");
		address.setU_id(555);
		dao.addAddress(address);
	}
	@org.junit.Test
	public void delete(){
		AddressDao dao = new AddressDao();
		dao.deleteAddress(4);
	}
	@org.junit.Test
	public void update(){
		AddressDao dao = new AddressDao();
		Address address = new Address();
		address.setA_tel("55555");
		address.setA_name("5555");
		address.setA_add("4555");
		address.setU_id(555);
		dao.updateAddress(address);
	}
	@org.junit.Test
	public void queryall() throws SQLException{
		AddressDao dao = new AddressDao();
		ArrayList<Address> list = (ArrayList<Address>) dao.queryAllAddress();
		for (Address address : list) {
			System.out.println(address);

		}
	}

		@org.junit.Test
		public void querybyuid() throws SQLException{
			AddressDao dao = new AddressDao();
			ArrayList<Address> list = (ArrayList<Address>) dao.queryByUId(99);
			for (Address address : list) {
				System.out.println(address);

			}

	}
}
