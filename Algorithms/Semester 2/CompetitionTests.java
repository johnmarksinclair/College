import java.io.FileNotFoundException;
import java.io.IOException;

import org.junit.Test;

public class CompetitionTests {

	public final int NUM_OF_CONTESTANTS = 3;

	@Test
	public void testDijkstraConstructor() throws FileNotFoundException, IOException {
		int min = Integer.MAX_VALUE;
		int max = 0;
		for (int i = 0; i < 100000; i++) {
			int[] speeds = getSpeeds();
			CompetitionDijkstra comp = new CompetitionDijkstra(
					"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\tinyEWD.txt", speeds[0],
					speeds[1], speeds[2]);
			int time = comp.timeRequiredforCompetition();
			System.out.println("\nMinimum time required for competition: " + time + " minutes\n");
			if (time < min) min = time;
			if (time > max) max = time;
		}
		System.out.println("\nMin: " + min + " minutes");
		System.out.println("\nMax: " + max + " minutes");
	}

	@Test
	public void testFWConstructor() {

	}

	public int[] getSpeeds() {
		int[] speeds = new int[NUM_OF_CONTESTANTS];
		for (int i = 0; i < NUM_OF_CONTESTANTS; i++) {
			speeds[i] = (int) (Math.floor(Math.random() * 50) + 50);
		}
		return speeds;
	}
}