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
		return quickSortRecursive(a, 0, a.length - 1);
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
	/**
	 * Sorts an array of doubles using iterative implementation of Merge Sort. This
	 * method is static, thus it can be called as SortComparison.sort(a)
	 *
	 * @param a: An unsorted array of doubles.
	 * @return after the method returns, the array must be in ascending sorted
	 *         order.
	 */

	static double[] mergeSortIterative(double a[]) {
		if (a.length > 1) {
			int mid = a.length / 2;
			double[] left = new double[mid];
			double[] right = new double[a.length - mid];
			for (int i = 0; i < mid; i++) {
				left[i] = a[i];
			}
			for (int i = mid; i < a.length; i++) {
				right[i - mid] = a[i];
			}
			mergeSortIterative(left);
			mergeSortIterative(right);
			int l = 0;
			int r = 0;
			int x = 0;
			while (l < left.length && r < right.length) {
				if (left[l] < right[r]) {
					a[x] = left[l];
					l++;
				} else {
					a[x] = right[r];
					r++;
				}
				x++;
			}
			while (l < left.length) {
				a[x] = left[l];
				l++;
				x++;
			}
			while (r < right.length) {
				a[x] = right[r];
				r++;
				x++;
			}
		}
		return a;
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
		return mergeSort(a, 0, a.length - 1);
	}

	static double[] mergeSort(double a[], int left, int right) {
		if (left < right) {
			int mid = (left + right) / 2;
			mergeSort(a, left, mid);
			mergeSort(a, mid + 1, right);
			merge(a, left, mid, right);
		}
		return a;
	}

	static void merge(double a[], int left, int mid, int right) {
		int leftLength = mid - left + 1;
		int rightLength = right - mid;
		double leftArr[] = new double[leftLength];
		double rightArr[] = new double[rightLength];
		for (int i = 0; i < leftLength; i++) {
			leftArr[i] = a[left + i];
		}
		for (int i = 0; i < rightLength; i++) {
			rightArr[i] = a[mid + 1 + i];
		}
		int leftI = 0;
		int rightI = 0;
		int i = left;
		while (leftI <  leftLength && rightI < rightLength) {
			if (leftArr[leftI] <= rightArr[rightI]) {
				a[i] = leftArr[leftI];
				leftI++;
			} else {
				a[i] = rightArr[rightI];
				rightI++;
			}
			i++;
		}
		while (leftI <  leftLength) {
			a[i] = leftArr[leftI];
			leftI++;
			i++;
		}
		while (rightI < rightLength) {
			a[i] = rightArr[rightI];
			rightI++;
			i++;
		}
	}

//	static void printArr(double a[]) {
//		int i = 0;
//		while (i < a.length) {
//			System.out.println(a[i]);
//			i++;
//		}
//	}
//
//	public static void main(String[] args) {
//		double a[] = { 8, 6, 2, -1, 5, 7, 9, 1, 0, 4, 3 };
//		printArr(mergeSortIterative(a));
//	}
}
