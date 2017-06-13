package account;

import java.util.ArrayList;  
import java.util.Iterator;  
import java.util.List;  
  
  
public class cart {  
    List<CartItem> items = new ArrayList<CartItem>();  
  
    public List<CartItem> getItems() {  
        return items;  
    }  
  
    public void setItems(List<CartItem> items) {  
        this.items = items;  
    }  
       
    public void add(CartItem ci,int n) {  
        for (Iterator<CartItem> iter = items.iterator(); iter.hasNext();) {  
            CartItem item = iter.next();  
            if(item.getitems().getId() == ci.getitems().getId()) {  
                item.setCount(item.getCount() + n);  
                return;  
            }  
        }  
        items.add(ci);  
    }  
      
    public double getTotalPrice() {  
        double d = 0.0;  
        for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {  
            CartItem current = it.next();  
            d += current.getitems().getPrice() * current.getCount();  
        }  
        return d;  
    }  
      
    public void deleteItemById(String ItemsId) {  
        for (Iterator<CartItem> iter = items.iterator(); iter.hasNext();) {  
            CartItem item = iter.next();  
            if((item.getitems().getId()+"").equals(ItemsId)) {  
                iter.remove();  
                return;  
            }  
        }  
    }  
      
}  