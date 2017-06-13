package goods;

import java.sql.ResultSet;
import java.util.ArrayList;

import JDBC.JDBConnection;



//商品的业务逻辑类
public class ItemsDAO {
// 获得所有的商品信息
	public ArrayList<Items> getAllItems() {
		
		JDBConnection db = new JDBConnection(); 
		ArrayList<Items> list = new ArrayList<Items>(); // 商品集合
		
		try {
			String sql = "select * from bookitems"; // SQL语句
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
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}

	//分类获取item
	public ArrayList<Items> getItemsByFenlei(int i) {
		
		JDBConnection db = new JDBConnection(); 
		ArrayList<Items> list = new ArrayList<Items>(); // 商品集合
		
		try {
			String sql = "select * from bookitems where fenlei="+i; // SQL语句
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
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}
	// 根据商品编号获得商品资料
	public Items getItemsById(int id) {
		JDBConnection db = new JDBConnection(); 
		try {
			String sql = "select * from bookitems where id="+id; // SQL语句
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
		ArrayList<Items> list = new ArrayList<Items>(); // 商品集合
		
		try {
			String sql = "select * from bookitems where goodsname like '%"+a+"%' and author like '%"+b+"%' and publishing like '%"+c+"%'" ; // SQL语句
		
						
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
				list.add(item);// 把一个商品加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}

	// 获取最近浏览的前五条商品信息
	public ArrayList<Items> getViewList(String list) {
		System.out.println("list:" + list);
		ArrayList<Items> itemlist = new ArrayList<Items>();
		int iCount = 5; // 每次返回前五条记录
		if (list != null && list.length() > 0) {
			String[] arr = list.split(",");
			System.out.println("arr.length=" + arr.length);
			// 如果商品记录大于等于5条
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