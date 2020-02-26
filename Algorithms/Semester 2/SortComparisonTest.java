import org.junit.Test;

import java.io.*;
import java.util.Arrays;

import static org.junit.Assert.*;

/* 							Insert		Selection	Merge Recursive		Merge Iterative		Quick
 * 1) 10 Random				7ms			9ms			5ms					5ms					10ms
 * 2) 100 Random			12ms		15ms		6ms					5ms					10ms
 * 3) 1000 Random			22ms		21ms		11ms				11ms				11ms
 * 4) 1000 Few Unique		25ms		24ms		9ms					9ms					8ms
 * 5) 1000 Nearly Ordered	16ms		28ms		12ms				11ms				10ms
 * 6) 1000 Reverse Order	35ms		27ms		11ms				10ms				27ms	
 * 7) 1000	Sorted			11ms		29ms		10ms				10ms				24ms
 * 
 * a) Quick - Deals very well with a randomised set but the time increases rapidly when the set is in reverse order
 * b) Insertion - this is because while it has to cycle through the whole set regardless, it will not have to perform any moving operations with the sorted array
 * c) Insertion - this is because its O(N^2), due to the two nested loops
 * d) I did not, altough I did have a larger deviation of values before the time was average with iterative
 * e) 1) Merge 2) Merge 3) Merge/ Quick 4) Quick 5) Quick 6) Iterative Merge 7) Merge
 */

public class SortComparisonTest {

	@Test
	public void testInsertionSort() {
		double unsorted[] = { 4, -2, -1, 2, -5, 0, 3, 1, -3, -4, 5 };
		double sorted[] = { -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 };
		assertTrue(Arrays.equals(sorted, SortComparison.insertionSort(unsorted)));
	}

	@Test
	public void testSelectionSort() {
		double unsorted[] = { 4, -2, -1, 2, -5, 0, 3, 1, -3, -4, 5 };
		double sorted[] = { -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 };
		assertTrue(Arrays.equals(sorted, SortComparison.selectionSort(unsorted)));
	}

	@Test
	public void testQuickSort() {
		double unsorted[] = { 4, -2, -1, 2, -5, 0, 3, 1, -3, -4, 5 };
		double sorted[] = { -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 };
		assertTrue(Arrays.equals(sorted, SortComparison.quickSort(unsorted)));
	}

	@Test
	public void testMergeSortRecurssive() {
		double unsorted[] = { 4, -2, -1, 2, -5, 0, 3, 1, -3, -4, 5 };
		double sorted[] = { -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 };
		assertTrue(Arrays.equals(sorted, SortComparison.mergeSortRecursive(unsorted)));
	}

	@Test
	public void testMergeSortIterative() {
		double unsorted[] = { 4, -2, -1, 2, -5, 0, 3, 1, -3, -4, 5 };
		double sorted[] = { -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 };
		assertTrue(Arrays.equals(sorted, SortComparison.mergeSortIterative(unsorted)));
	}

	public static void main(String[] args) throws IOException {
		long startTime = System.currentTimeMillis();
		File file = new File("C:\\Users\\John\\Documents\\Eclipse\\Algorithms\\assignment input data files\\numbers1000Duplicates.txt");
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String string;
		double[] arr = new double[1000];
		int index = 0;
		double number = 0;
		while ((string = reader.readLine()) != null) {
			number = Double.valueOf(string);
			arr[index++] = number;
		}
		SortComparison.quickSort(arr);
		long endTime = System.currentTimeMillis();
		long overallTime = endTime - startTime;
		System.out.println("Runtime: " + overallTime);
		reader.close();
	}
}
