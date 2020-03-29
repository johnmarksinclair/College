import java.io.*;

/*
 * A Contest to Meet (ACM) is a reality TV contest that sets three contestants at three random
 * city intersections. In order to win, the three contestants need all to meet at any intersection
 * of the city as fast as possible.
 * It should be clear that the contestants may arrive at the intersections at different times, in
 * which case, the first to arrive can wait until the others arrive.
 * From an estimated walking speed for each one of the three contestants, ACM wants to determine the
 * minimum time that a live TV broadcast should last to cover their journey regardless of the contestants’
 * initial positions and the intersection they finally meet. You are hired to help ACM answer this question.
 * You may assume the following:
 *     Each contestant walks at a given estimated speed.
 *     The city is a collection of intersections in which some pairs are connected by one-way
 * streets that the contestants can use to traverse the city.
 *
 * This class implements the competition using Dijkstra's algorithm
 */

public class CompetitionDijkstra {

	public final int NUM_OF_CONTESTANTS = 3;
	public int numOfIntersections;
	public int numOfStreets;
	public int aSpeed;
	public int bSpeed;
	public int cSpeed;
	public int aStart;
	public int bStart;
	public int cStart;
	public double[][] adjTable;

	/**
	 * @param filename: A filename containing the details of the city road network
	 * @param sA,       sB, sC: speeds for 3 contestants
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	CompetitionDijkstra(String filename, int sA, int sB, int sC) throws FileNotFoundException, IOException {
		this.aSpeed = sA;
		this.bSpeed = sB;
		this.cSpeed = sC;
		String[] streets = readFile(filename);
		int[] positions = initContestants();
		System.out.println("A started at Intersection: " + positions[0]);
		System.out.println("B started at Intersection: " + positions[1]);
		System.out.println("C started at Intersection: " + positions[2] + "\n");
		adjTable = createAdjacencyTable(streets);
		for (int i = 0; i < numOfIntersections; i++) {
			dijkstra(adjTable, i);
		}
		//printGraph(adjTable, "adjTable");
	}

	/**
	 * @return int: minimum minutes that will pass before the three contestants can
	 *         meet
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	public int timeRequiredforCompetition() throws FileNotFoundException, IOException {
		double[][] aTimeGraph = createTimeGraph(adjTable, this.aSpeed);
		double[][] bTimeGraph = createTimeGraph(adjTable, this.bSpeed);
		double[][] cTimeGraph = createTimeGraph(adjTable, this.cSpeed);
		//printGraph(aTimeGraph, "aTimeGraph");
		//printGraph(bTimeGraph, "bTimeGraph");
		//printGraph(cTimeGraph, "cTimeGraph");
		int time = (int) getMinTimeNeeded(aTimeGraph, bTimeGraph, cTimeGraph);
		return time;
	}

	public double[][] createTimeGraph(double[][] graph, int speed) {
		double[][] speedGraph = new double[numOfIntersections][numOfIntersections];
		for (int i = 0; i < numOfIntersections; i++) {
			for (int j = 0; j < numOfIntersections; j++) {
				speedGraph[i][j] = ((graph[i][j]) / speed) * 1000;
			}
		}
		return speedGraph;
	}

	public int[] initContestants() {
		int[] pos = new int[NUM_OF_CONTESTANTS];
		this.aStart = (int) (Math.floor(Math.random() * numOfIntersections));
		this.bStart = (int) (Math.floor(Math.random() * numOfIntersections));
		this.cStart = (int) (Math.floor(Math.random() * numOfIntersections));
		while (bStart == aStart) {
			if (bStart == aStart) {
				bStart = (int) Math.floor(Math.random() * numOfIntersections);
			}
		}
		while (cStart == aStart || cStart == bStart) {
			if (cStart == aStart || cStart == bStart) {
				cStart = (int) (Math.floor(Math.random() * numOfIntersections));
			}
		}
		pos[0] = aStart;
		pos[1] = bStart;
		pos[2] = cStart;
		return pos;
	}

	public String[] readFile(String file) throws FileNotFoundException, IOException {
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String street;
		int index = 0;
		numOfIntersections = Integer.parseInt(reader.readLine());
		numOfStreets = Integer.parseInt(reader.readLine());
		String[] streets = new String[numOfStreets];
		while ((street = reader.readLine()) != null) {
			streets[index] = street;
			index++;
		}
		reader.close();
		return streets;
	}

	public double[][] createAdjacencyTable(String[] streets) {
		int src;
		int dst;
		double length;
		double[][] adjTable = new double[numOfIntersections][numOfIntersections];
		for (int i = 0; i < streets.length; i++) {
			String[] street = streets[i].split(" ");
			src = Integer.parseInt(street[0]);
			dst = Integer.parseInt(street[1]);
			length = Double.parseDouble(street[2]);
			adjTable[dst][src] = length;
		}
		return adjTable;
	}

//	public void printGraph(double[][] graph, String title) {
//		System.out.println(title);
//		for (int i = 0; i < numOfIntersections; i++) {
//			for (int j = 0; j < numOfIntersections; j++) {
//				System.out.print(graph[i][j] + ", ");
//			}
//			System.out.println();
//		}
//		System.out.println();
//	}

	public int getMinTimeNeeded(double[][] aTimeGraph, double[][] bTimeGraph, double[][] cTimeGraph) {
		double[] aTimes = new double[numOfIntersections];
		double[] bTimes = new double[numOfIntersections];
		double[] cTimes = new double[numOfIntersections];
		for (int i = 0; i < numOfIntersections; i++) {
			aTimes[i] = aTimeGraph[i][aStart];
			bTimes[i] = bTimeGraph[i][bStart];
			cTimes[i] = cTimeGraph[i][cStart];
		}

		double minIndTime = Double.MAX_VALUE;
		int node = -1;

		for (int i = 0; i < numOfIntersections; i++) {
			double a = aTimes[i];
			double b = bTimes[i];
			double c = cTimes[i];
			double indTime = getMaxDouble(a, b, c);
			if (indTime < minIndTime) {
				minIndTime = indTime;
				node = i;
			}
		}
		System.out.println("They meet at Intersection: " + node);
		int returnedTime = (int) Math.ceil(minIndTime);
		return returnedTime;
	}

	public double getMaxDouble(double a, double b, double c) {
		double max = a;
		if (b > max)
			max = b;
		if (c > max)
			max = c;
		return max;
	}

	public int minDistance(double dist[], Boolean sptSet[]) {
		double min = Double.MAX_VALUE;
		int min_index = -1;

		for (int v = 0; v < numOfIntersections; v++)
			if (sptSet[v] == false && dist[v] <= min) {
				min = dist[v];
				min_index = v;
			}

		return min_index;
	}

	public void dijkstra(double graph[][], int src) {
		double dist[] = new double[numOfIntersections];
		Boolean sptSet[] = new Boolean[numOfIntersections];

		for (int i = 0; i < numOfIntersections; i++) {
			dist[i] = Integer.MAX_VALUE;
			sptSet[i] = false;
		}

		dist[src] = 0;

		for (int count = 0; count < numOfIntersections - 1; count++) {
			int u = minDistance(dist, sptSet);

			sptSet[u] = true;

			for (int v = 0; v < numOfIntersections; v++) {
				if (!sptSet[v] && graph[u][v] != 0 && dist[u] != Integer.MAX_VALUE && dist[u] + graph[u][v] < dist[v]) {
					dist[v] = dist[u] + graph[u][v];
					double val = dist[v] * 100;
					val = Math.round(val);
					dist[v] = val / 100;
				}
			}
		}
		for (int i = 0; i < numOfIntersections; i++) {
			adjTable[src][i] = dist[i];
		}
	}
}