import org.junit.Test;

import java.util.Arrays;

import static org.junit.Assert.*;

public class SortComparisonTest {
	public double unsorted[] = { 4, -2, -1, 2, -5, 0, 3, 1, -3, -4, 5 };
	public double sorted[] = { -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5 };
	
	@Test
	public void testInsertionSort() {
		assertTrue(Arrays.equals(sorted, SortComparison.insertionSort(unsorted)));
	}

	@Test
	public void testSelectionSort() {
		assertTrue(Arrays.equals(sorted, SortComparison.selectionSort(unsorted)));
	}

	@Test
	public void testQuickSort() {
		assertTrue(Arrays.equals(sorted, SortComparison.quickSort(unsorted)));
	}

	@Test
	public void testMergeSortRecurssive() {
		assertTrue(Arrays.equals(sorted, SortComparison.mergeSortRecursive(unsorted)));
	}

	@Test
	public void testMergeSortIterative() {
		assertTrue(Arrays.equals(sorted, SortComparison.mergeSortIterative(unsorted)));
	}
}
