package goods;
import java.util.UUID;
public class zzz {
	        public static String getOrderIdByUUId() {
	            int machineId = 1;//���֧��1-9����Ⱥ��������
	            int hashCodeV = UUID.randomUUID().toString().hashCode();
	            if(hashCodeV < 0) {//�п����Ǹ���
	                hashCodeV = - hashCodeV;
	            }
	            // 0 ����ǰ�油��0     
	            // 4 ������Ϊ4     
	            // d �������Ϊ������
	            return machineId + String.format("%015d", hashCodeV);
	        }
	        public static void main(String[] args) {
	            System.out.println(getOrderIdByUUId());
	        }
	}
