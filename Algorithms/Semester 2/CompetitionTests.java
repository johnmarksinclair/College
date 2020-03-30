import java.io.FileNotFoundException;
import java.io.IOException;

import org.junit.Test;

public class CompetitionTests {

	public final int NUM_OF_CONTESTANTS = 3;

	@Test
	public void testDijkstraConstructor() throws FileNotFoundException, IOException {
		System.out.println("\nDijkstra:");
		int[] speeds = getSpeeds();
		CompetitionDijkstra comp = new CompetitionDijkstra(
				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\1000EWD.txt", speeds[0],
				speeds[1], speeds[2]);
//		CompetitionDijkstra comp = new CompetitionDijkstra(
//				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\tinyEWD.txt", 1,
//				1, 1);
		System.out.println("\nA is walking at " + comp.aSpeed + " m/m and started at Intersection " + comp.aStart);
		System.out.println("B is walking at " + comp.bSpeed + " m/m and started at Intersection " + comp.bStart);
		System.out.println("C is walking at " + comp.cSpeed + " m/m and started at Intersection " + comp.cStart);
		int time = comp.timeRequiredforCompetition();
		System.out.println("\nMinimum time required for competition: " + time + " minutes\n");
	}

	@Test
	public void testFWConstructor() throws FileNotFoundException, IOException {
		System.out.println("\nFloydWarshall:");
		int[] speeds = getSpeeds();
		CompetitionFloydWarshall comp = new CompetitionFloydWarshall(
				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\1000EWD.txt", speeds[0],
				speeds[1], speeds[2]);
//		CompetitionFloydWarshall comp = new CompetitionFloydWarshall(
//				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\tinyEWD.txt", 1,
//				1, 1);
		System.out.println("\nA is walking at " + comp.aSpeed + " m/m and started at Intersection " + comp.aStart);
		System.out.println("B is walking at " + comp.bSpeed + " m/m and started at Intersection " + comp.bStart);
		System.out.println("C is walking at " + comp.cSpeed + " m/m and started at Intersection " + comp.cStart);
		int time = comp.timeRequiredforCompetition();
		System.out.println("\nMinimum time required for competition: " + time + " minutes\n");
	}

	public int[] getSpeeds() {
		int[] speeds = new int[NUM_OF_CONTESTANTS];
		for (int i = 0; i < NUM_OF_CONTESTANTS; i++) {
			speeds[i] = (int) (Math.floor(Math.random() * 50) + 50);
		}
		return speeds;
	}
}