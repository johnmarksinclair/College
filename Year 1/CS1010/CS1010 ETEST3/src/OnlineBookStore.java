import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class OnlineBookStore {
	public static int ISBN_INDEX = 0;
	public static int TITLE_INDEX = 1;
	public static int AUTHOR_INDEX = 2;
	public static int PUBLISHER_INDEX = 3;
	public static int PUBLISHER_YEAR_INDEX = 4;
	public static int QUANTITY_INDEX = 5;
	public static int PRICE_INDEX = 6;

	public static void main(String[] args) {
		ArrayList<Book> bookList = new ArrayList<Book>();
		try {
			FileReader fileReader = new FileReader("books.txt");// Enter the entire path of the file if needed
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			boolean endOfFile = false;
			while (!endOfFile) {
				String bookLine = bufferedReader.readLine();
				if (bookLine != null) {
					String[] bookData = bookLine.split(", ");
					String isbn = bookData[ISBN_INDEX];
					String title = bookData[TITLE_INDEX];
					String author = bookData[AUTHOR_INDEX];
					String publisher = bookData[PUBLISHER_INDEX];
					int publishYear = Integer.parseInt(bookData[PUBLISHER_YEAR_INDEX]);
					int quantity = Integer.parseInt(bookData[QUANTITY_INDEX]);
					double price = Double.parseDouble(bookData[PRICE_INDEX]);
					Book book = new Book(isbn, title, author, publisher, publishYear, quantity, price);
					bookList.add(book);

				} else {
					endOfFile = true;
				}
			}
			bufferedReader.close();
			fileReader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		printBookDetails(bookList);
		purchaseBook(bookList);
	}

	public static void printBookDetails(ArrayList<Book> bookList) {
		for (int index = 0; index < bookList.size(); index++) {
			System.out.println(bookList.get(index).toString());
		}
	}

	public static Book getBook(ArrayList<Book> bookList, String title) {
		for (int index = 0; index < bookList.size(); index++) {
			if (bookList.get(index).getTitle().equals(title)) {
				return bookList.get(index);
			}
		}
		return null;
	}

	public static void topUpCard(ChargeCard card, double amount) {
		card.topUpFunds(amount);
	}

	public static void purchaseBook(ArrayList<Book> bookList) {
		Scanner scanner = new Scanner(System.in);
		double amount = 0;
		Book book = null;
		ChargeCard card = new ChargeCard();
		System.out.print("\nEnter top up amount: ");
		if (scanner.hasNextDouble()) {
			amount = scanner.nextDouble();
			if (amount > 0)
				topUpCard(card, amount);
		}
		boolean finished = false;
		while (!finished) {
			System.out.print("\nEnter book title or type 'quit': ");
			Scanner input = new Scanner(System.in);
			String title = input.nextLine();
			if (title.equals("quit"))
				finished = true;
			book = getBook(bookList, title);
			if (book != null) {
				if (book.getQuantity() > 0 && card.getFunds() > book.getPrice()) {
					book.setQuantity(book.getQuantity() - 1);
					card.removeFunds(book.getPrice());
					printBookDetails(bookList);
					System.out.printf("Wallet: " + card.getFunds());
				}
			}
			else if (finished == false)
				System.out.println("No matches");
		}
	}
}