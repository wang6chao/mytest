package JDBC;



public  class idnumadd {  
    
    public idnumadd() {}  
      
    public idnumadd(int interval, int maxNum) {  
        this.interval = interval;  
        this.maxNum = maxNum;  
    }  
    
    public static void main(String[] args) throws Exception {
    	idnumadd idnum =new idnumadd();
		System.out.println(idnum.cal());
		System.out.println(idnum.cal());
		System.out.println(idnum.cal());
	}
    public synchronized int cal() throws Exception {  
        if (serialNum == -1) {  
            serialNum = initStartNum(); // �Ѿ�ʹ�õ����к�һ�� С�� ��������к�  
            intervalMax = serialNum + interval;  
            updateStartNum(intervalMax);  
            return serialNum;  
        }  
        if (isMax(serialNum)) { // �ﵽԤ�������ֵ  
            resetSerialNum();  
            return serialNum;  
        }  
        serialNum++;  
        if (serialNum >= (intervalMax - 1)) { // �����������ֵ  
            intervalMax += interval;  
            updateStartNum(intervalMax);  
        }  
        return serialNum;  
    }  
      
    /** 
     * ��ʼ�����кţ��ӻ���ϵͳ�������������ݿ⡢�ļ��� 
     * @return ��ʼ���к� 
     * @throws Exception 
     */  
    public int initStartNum() throws Exception {
		return 0;
	}  
      
    /** 
     * �����������ֵ������ϵͳ���������ݿ⡢�ļ��С� 
     * @param intervalMax �������ֵ 
     * @throws Exception 
     */  
    public void updateStartNum(int intervalMax) throws Exception {
	}  
      
    /** 
     * �������кţ���1��ʼ 
     */  
    protected void resetSerialNum() throws Exception {  
        this.serialNum = 1;  
        intervalMax = serialNum + interval;  
        updateStartNum(intervalMax);  
    }  
      
    /** 
     * �Ƿ������ֵ 
     * @param num 
     * @return 
     */  
    private boolean isMax(int num) {  
        return num >= maxNum;  
    }  
      
    public int getInterval() {  
        return this.interval;  
    }  
      
    public int getMaxNum() {  
        return this.maxNum;  
    }  
      
    /** �������ֵ */  
    protected int intervalMax = 0;  
      
    /** ÿ�������� */  
    protected int interval = 20;  
      
    /** Ԥ�������ֵ */  
    protected int maxNum = 9999;  
      
    /** ���к� */  
    protected int serialNum = -1;  
}  