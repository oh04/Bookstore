package bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;

final class Database {
    Connection connect() throws SQLException {
        String url = System.getenv().getOrDefault("BOOKSTORE_DB_URL", "jdbc:mysql://localhost:3306/bookstore");
        return DriverManager.getConnection(url, "root", "");
    }

    boolean login(String email, String password) throws SQLException {
        String sql = "SELECT Email, Password FROM Customers";
        try (
                Connection connection = connect();
                Statement statement = connection.createStatement();
                ResultSet rows = statement.executeQuery(sql)) {
            while (rows.next()) {
                if (email.trim().equals(rows.getString("Email"))
                        && password.equals(rows.getString("Password"))) {
                    return true;
                }
            }
        }
        return false;

    }

    String search(String keyword) throws SQLException {
        String sql = """
                SELECT b.Title, a.AuthorName, b.Genre, b.Price
                FROM Books b INNER JOIN Authors a ON b.AuthorID = a.AuthorID
                ORDER BY b.Title
                """;
        String term = keyword.trim().toLowerCase(Locale.ROOT);
        StringBuilder books = new StringBuilder();
        try (Connection connection = connect();
                Statement statement = connection.createStatement();
                ResultSet rows = statement.executeQuery(sql)) {
            while (rows.next()) {
                String title = rows.getString("Title");
                String author = rows.getString("AuthorName");
                String genre = rows.getString("Genre");
                if (title.toLowerCase(Locale.ROOT).contains(term) || author.toLowerCase(Locale.ROOT).contains(term)
                        || genre.toLowerCase(Locale.ROOT).contains(term)) {
                    books.append(title).append(" | ").append(author).append(" | ").append(genre).append(" | $")
                            .append(rows.getString("Price")).append("\n");
                }
            }
        }
        return books.length() == 0 ? "No books found." : books.toString();
    }
}
