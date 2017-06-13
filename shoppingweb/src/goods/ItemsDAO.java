package goods;

import java.sql.ResultSet;
import java.util.ArrayList;

import JDBC.JDBConnection;



//��Ʒ��ҵ���߼���
public class ItemsDAO {
// ������е���Ʒ��Ϣ
	public ArrayList<Items> getAllItems() {
		
		JDBConnection db = new JDBConnection(); 
		ArrayList<Items> list = new ArrayList<Items>(); // ��Ʒ����
		
		try {
			String sql = "select * from bookitems"; // SQL���
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setGoodsname(rs.getString("goodsname"));
				item.setAuthor(rs.getString("author"));
				item.setPublishing(rs.getString("publishing"));
				item.setImg(rs.getString("img"));
				item.setInfo(rs.getString("info"));
				item.setPrice(rs.getInt("price"));
				item.setKucun(rs.getInt("kucun"));
				item.setXiaoliang(rs.getInt("xiaoliang"));
				list.add(item);// ��һ����Ʒ���뼯��
			}
			return list; // ���ؼ��ϡ�
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}

	//�����ȡitem
	public ArrayList<Items> getItemsByFenlei(int i) {
		
		JDBConnection db = new JDBConnection(); 
		ArrayList<Items> list = new ArrayList<Items>(); // ��Ʒ����
		
		try {
			String sql = "select * from bookitems where fenlei="+i; // SQL���
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setGoodsname(rs.getString("goodsname"));
				item.setAuthor(rs.getString("author"));
				item.setPublishing(rs.getString("publishing"));
				item.setImg(rs.getString("img"));
				item.setInfo(rs.getString("info"));
				item.setPrice(rs.getInt("price"));
				item.setKucun(rs.getInt("kucun"));
				item.setXiaoliang(rs.getInt("xiaoliang"));
				list.add(item);// ��һ����Ʒ���뼯��
			}
			return list; // ���ؼ��ϡ�
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}
	// ������Ʒ��Ż����Ʒ����
	public Items getItemsById(int id) {
		JDBConnection db = new JDBConnection(); 
		try {
			String sql = "select * from bookitems where id="+id; // SQL���
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setGoodsname(rs.getString("goodsname"));
				item.setAuthor(rs.getString("author"));
				item.setCreatetime(rs.getString("createtime"));
				item.setPrice(rs.getInt("price"));
				item.setPublishing(rs.getString("publishing"));
				item.setImg(rs.getString("img"));
				item.setInfo(rs.getString("info"));
				item.setPrice(rs.getInt("price"));
				item.setKucun(rs.getInt("kucun"));
				item.setXiaoliang(rs.getInt("xiaoliang"));
				return item;
			} else {
				return null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}
	
public ArrayList<Items> getItemsBySearch(String a,String b,String c) {
		
		JDBConnection db = new JDBConnection(); 
		ArrayList<Items> list = new ArrayList<Items>(); // ��Ʒ����
		
		try {
			String sql = "select * from bookitems where goodsname like '%"+a+"%' and author like '%"+b+"%' and publishing like '%"+c+"%'" ; // SQL���
		
						
			System.out.println(sql);
			ResultSet rs = db.executeQuery(sql);
			while (rs.next()) {
				Items item = new Items();
				item.setId(rs.getInt("id"));
				item.setGoodsname(rs.getString("goodsname"));
				item.setAuthor(rs.getString("author"));
				item.setPublishing(rs.getString("publishing"));
				item.setImg(rs.getString("img"));
				item.setInfo(rs.getString("info"));
				item.setPrice(rs.getInt("price"));
				item.setKucun(rs.getInt("kucun"));
				item.setXiaoliang(rs.getInt("xiaoliang"));
				list.add(item);// ��һ����Ʒ���뼯��
			}
			return list; // ���ؼ��ϡ�
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}

	// ��ȡ��������ǰ������Ʒ��Ϣ
	public ArrayList<Items> getViewList(String list) {
		System.out.println("list:" + list);
		ArrayList<Items> itemlist = new ArrayList<Items>();
		int iCount = 5; // ÿ�η���ǰ������¼
		if (list != null && list.length() > 0) {
			String[] arr = list.split(",");
			System.out.println("arr.length=" + arr.length);
			// �����Ʒ��¼���ڵ���5��
			if (arr.length >= 5) {
				for (int i = arr.length - 1; i >= arr.length - iCount; i--) {
					itemlist.add(getItemsById(Integer.parseInt(arr[i])));
				}
			} else {
				for (int i = arr.length - 1; i >= 0; i--) {
					itemlist.add(getItemsById(Integer.parseInt(arr[i])));
				}
			}
			return itemlist;
		} else {
			return null;
		}

	}
}