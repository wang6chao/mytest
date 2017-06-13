package Filter;

public class test {
	public void x(int x){
		x=x+1;
		System.out.println("hello");		
		System.out.println(x);
	}

	public static void main(String[] args) {
		test zz=new test();
		zz.x(5);
	}
}

