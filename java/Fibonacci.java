package easy;

class Fibonacci {
	
	// time complexity : O(N)
	public long fibonacci(int num) {
		long[] fibo_memo = new long[num+1];
		fibo_memo[0] = 0;
		fibo_memo[1] = 1;    
		for(int i = 2; i < fibo_memo.length; i++) {
			fibo_memo[i] = fibo_memo[i-1] + fibo_memo[i-2];
		}
		return fibo_memo[num];
	}

	// testing code
	public static void main(String[] args) {
		Fibonacci c = new Fibonacci();
		int testCase = 3;
		System.out.println(c.fibonacci(testCase));
	}
}
