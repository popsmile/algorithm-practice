package easy;

class ProductMatrix {
	public int[][] productMatrix(int[][] A, int[][] B) {
		
		int sum;
		int P = A.length;
		int Q = A[0].length;
		int R = B[0].length;
		
		int[][] answer = new int[P][R];

		for(int i=0; i<P; i++) {
			for(int j=0; j<R; j++) {
				sum = 0;
				for(int k=0; k<Q; k++) {
					sum += A[i][k] * B[k][j];
				}
				answer[i][j] = sum;
			}
		}
		return answer;
	}

	public static void main(String[] args) {
		ProductMatrix c = new ProductMatrix();
		int[][] a = { { 1, 2 }, { 2, 3 } };
		int[][] b = { { 3, 4 }, { 5, 6 } };
		
      // testing code
		System.out.println("Çà·ÄÀÇ °ö¼À");
		int[][] p = new int[a.length][b[0].length];
		p = c.productMatrix(a, b);
		for(int i=0; i<p.length; i++) {
			for(int j=0; j<p[0].length; j++) {
				System.out.print(p[i][j] + " ");
			}
			System.out.print("\n");
		}
	}
}
