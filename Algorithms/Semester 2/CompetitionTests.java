import java.io.FileNotFoundException;
import java.io.IOException;

import org.junit.Test;

public class CompetitionTests {

	public final int NUM_OF_CONTESTANTS = 3;

	@Test
	public void testDijkstraConstructor() throws FileNotFoundException, IOException {
		System.out.println("\nDijkstra:");
		int[] speeds = getSpeeds();
		CompetitionDijkstra smallComp = new CompetitionDijkstra(
				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\tinyEWD.txt", speeds[0],
				speeds[1], speeds[2]);
		System.out.println("\nSmall Comp\nA is walking at " + smallComp.aSpeed + " m/m and started at Intersection "
				+ smallComp.aStart);
		System.out.println(
				"B is walking at " + smallComp.bSpeed + " m/m and started at Intersection " + smallComp.bStart);
		System.out.println(
				"C is walking at " + smallComp.cSpeed + " m/m and started at Intersection " + smallComp.cStart);
		int smallTime = smallComp.timeRequiredforCompetition();
		System.out.println("\nMinimum time required for competition: " + smallTime + " minutes\n");
		CompetitionDijkstra bigComp = new CompetitionDijkstra(
				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\1000EWD.txt", speeds[0],
				speeds[1], speeds[2]);
		System.out.println(
				"\nBig Comp\nA is walking at " + bigComp.aSpeed + " m/m and started at Intersection " + bigComp.aStart);
		System.out.println("B is walking at " + bigComp.bSpeed + " m/m and started at Intersection " + bigComp.bStart);
		System.out.println("C is walking at " + bigComp.cSpeed + " m/m and started at Intersection " + bigComp.cStart);
		int bigTime = bigComp.timeRequiredforCompetition();
		System.out.println("\nMinimum time required for competition: " + bigTime + " minutes\n");
	}

	@Test
	public void testFWConstructor() throws FileNotFoundException, IOException {
		System.out.println("\nFloydWarshall:");
		int[] speeds = getSpeeds();
		CompetitionFloydWarshall smallComp = new CompetitionFloydWarshall(
				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\tinyEWD.txt", speeds[0],
				speeds[1], speeds[2]);
		System.out.println("\nSmall Comp\nA is walking at " + smallComp.aSpeed + " m/m and started at Intersection "
				+ smallComp.aStart);
		System.out.println(
				"B is walking at " + smallComp.bSpeed + " m/m and started at Intersection " + smallComp.bStart);
		System.out.println(
				"C is walking at " + smallComp.cSpeed + " m/m and started at Intersection " + smallComp.cStart);
		int smallTime = smallComp.timeRequiredforCompetition();
		System.out.println("\nMinimum time required for competition: " + smallTime + " minutes\n");
		CompetitionFloydWarshall bigComp = new CompetitionFloydWarshall(
				"C:\\Users\\John\\Documents\\Git Repos\\College\\Algorithms\\Semester 2\\1000EWD.txt", speeds[0],
				speeds[1], speeds[2]);
		System.out.println(
				"\nBig Comp\nA is walking at " + bigComp.aSpeed + " m/m and started at Intersection " + bigComp.aStart);
		System.out.println("B is walking at " + bigComp.bSpeed + " m/m and started at Intersection " + bigComp.bStart);
		System.out.println("C is walking at " + bigComp.cSpeed + " m/m and started at Intersection " + bigComp.cStart);
		int bigTime = bigComp.timeRequiredforCompetition();
		System.out.println("\nMinimum time required for competition: " + bigTime + " minutes\n");
	}

	public int[] getSpeeds() {
		int[] speeds = new int[NUM_OF_CONTESTANTS];
		for (int i = 0; i < NUM_OF_CONTESTANTS; i++) {
			speeds[i] = (int) (Math.floor(Math.random() * 50) + 50);
		}
		return speeds;
	}
}