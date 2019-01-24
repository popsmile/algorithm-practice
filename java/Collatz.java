package easy;

class Collatz {
	
	// return how many times it takes to make num 1
	public int collatz(int num) {
		long n = (long)num;
		for(int i = 0; i<500; i++) {
			if(n==1) return i;
			if(n%2==0) {
				n=n/2;
			}else{
				n=n*3+1;
			}
		}
		return -1;
	}

	// testing code
	public static void main(String[] args) {
		Collatz c = new Collatz();
		int ex = 6;
		System.out.println(c.collatz(ex));
	}
}