import javax.swing.JOptionPane;
import java.util.*;

public class matrixCalculator {

	public static void main(String[] args) {
		
		// 2 4 3 5 6 4 2 3 5 3 2 7
		// x1 = 1.5
		// x2 = -5.5
		// x3 = 8
		
		// 4 2 1 2 8 3 4 5 4 2 6 3
		// x1 = 0.75
		// x2 = -0.6
		// x3 = 0.2



		
		String input = JOptionPane.showInputDialog("Input the 3x4 matrix's numbers separated by spaces");
		Scanner scanner = new Scanner(input);
		scanner.useDelimiter(" ");
		double a = scanner.nextDouble();
		double b = scanner.nextDouble();
		double c = scanner.nextDouble();
		double d = scanner.nextDouble();
		double e = scanner.nextDouble();
		double f = scanner.nextDouble();
		double g = scanner.nextDouble();
		double h = scanner.nextDouble();
		double i = scanner.nextDouble();
		double j = scanner.nextDouble();
		double k = scanner.nextDouble();
		double l = scanner.nextDouble();
		scanner.close();
		
		double rowEchelonQuestion = JOptionPane.showConfirmDialog(null, "Do you want to see your matrix "
				+ "in reduced row echelon format?");
		boolean rowEchelon = (rowEchelonQuestion == JOptionPane.YES_OPTION);
		
		if (rowEchelon == true)
		{	//get row echelon form 
			
			b = b/a;
			c = c/a;
			d = d/a;
			a = a/a; //get a = 1
			
			f = -e*b + f;
			g = -e*c + g;
			h = -e*d + h;
			e = -e*a + e; //get e = 0
			
			j = -i*b + j;
			k = -i*c + k;
			l = -i*d + l;
			i = -i*a + i; //get i = 0
			
			g = g/f;
			h = h/f;
			f = f/f; //get f = 1
			
			c = -b*g + c;
			d = -b*h + d;
			b = -b*f + b; //get b = 0
			
			k = -j*g + k;
			l = -j*h + l;
			j = -j*f + j; //get j = 0
			
			l = l/k;
			k = k/k; //get k = 1
			
			h = -g*l + h;
			g = -g*k + g; //get g = 0
			
			d = a - c*l;
			c = 0;
			
			double matrix[][] = new double[][]{
                {a, b, c, d,},
                {e, f, g, h,},
                {i, j, k, l}
            };

            for (int x = 0; x < 3; x++) 
            {
                System.out.println("");
                System.out.print("{");
                for (int y = 0; y < 4; y++) 
                {
                    System.out.print(matrix[x][y] + ", ");
                }
                System.out.print("}");
            }
		}
	}
}