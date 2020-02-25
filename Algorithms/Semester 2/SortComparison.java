// -------------------------------------------------------------------------

/**
 * This class contains static methods that implementing sorting of an array of
 * numbers using different sort algorithms.
 *
 * @author
 * @version HT 2020
 */

class SortComparison {

	/**
	 * Sorts an array of doubles using InsertionSort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order.
	 *
	 */
	static double[] insertionSort(double a[]) {
		for (int i = 1; i < a.length; i++) {
			double cur = a[i];
			int j = i - 1;
			while (j >= 0 && a[j] > cur) {
				a[j + 1] = a[j];
				j--;
			}
			a[j + 1] = cur;
		}
		return a;
	}

	/**
	 * Sorts an array of doubles using Selection Sort. This method is static, thus
	 * it can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] selectionSort(double a[]) {
		for (int i = 0; i < a.length - 1; i++) {
			int min = i;
			for (int j = i + 1; j < a.length; j++) {
				if (a[j] < a[min]) {
					min = j;
				}
			}
			double temp = a[min];
			a[min] = a[i];
			a[i] = temp;
		}
		return a;
	}

	/**
	 * Sorts an array of doubles using Quick Sort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] quickSort(double a[]) {
		return quickSortRecursive(a, 0, a.length-1);
	}

	static double[] quickSortRecursive(double a[], int lo, int hi) {
		if (lo < hi) {
			int split = split(a, lo, hi);
			quickSortRecursive(a, lo, split - 1);
			quickSortRecursive(a, split + 1, hi);
		}
		return a;
	}

	static int split(double a[], int lo, int hi) {
		double piv = a[hi];
		int index = lo - 1;
		for (int i = lo; i < hi; i++) {
			if (a[i] < piv) {
				index++;
				double temp = a[index];
				a[index] = a[i];
				a[i] = temp;
			}
		}
		double temp = a[index + 1];
		a[index + 1] = a[hi];
		a[hi] = temp;
		return index + 1;
	}

	/**
	 * Sorts an array of doubles using Merge Sort. This method is static, thus it
	 * can be called as SortComparison.sort(a)
	 * 
	 * @param a: An unsorted array of doubles.
	 * @return array sorted in ascending order
	 *
	 */
	static double[] mergeSort(double a[]) {
		return null;
	}

	/**
	 * Sorts an array of doubles using iterative implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a: An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */

	static double[] mergeSortIterative(double a[]) {
		return null;
	}

	/**
	 * Sorts an array of doubles using recursive implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a: An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */
	static double[] mergeSortRecursive(double a[]) {
		return a;
	}

	static void printArr(double a[]) {
		int i = 0;
		while (i < a.length) {
			System.out.println(a[i]);
			i++;
		}
	}

	public static void main(String[] args) {
		double a[] = { 8, 6, 2, 5, 7, 9, 1, 4, 3 };
		printArr(quickSort(a));
	}
}
