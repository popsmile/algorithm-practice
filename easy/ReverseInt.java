package easy;

import java.util.Arrays;

public class ReverseInt {

	// 정수 내림차순으로 배치하기
	public int reverseInt(int n){
		String num = Integer.toString(n);
		int[] arr = new int[num.length()];
		for(int i=0; i<arr.length; i++) {
			arr[i] = n%10;
			n = n/10;
		}
		Arrays.sort(arr);
		String answer = "";
		for(int i=0; i<arr.length; i++) {
			answer += arr[arr.length-1-i];
		}
		return Integer.parseInt(answer);
	}
  
	// testing code
	public static void  main(String[] args){
		ReverseInt ri = new ReverseInt();
		System.out.println(ri.reverseInt(875063366));

	}
}