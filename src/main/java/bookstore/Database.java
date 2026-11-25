package bookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;
import java.util.HexFormat;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

final class Database {
    Connection connect() throws SQLException {
        String url = System.getenv().getOrDefault("BOOKSTORE_DB_URL", "jdbc:mysql://localhost:3306/bookstore");
        return DriverManager.getConnection(url, "root", "");
    }

    int login(String email, char[] password) throws SQLException {
        String sql = "SELECT CustomerID, Email, Password FROM Customers";
        try (
                Connection connection = connect();
                Statement statement = connection.createStatement();
                ResultSet rows = statement.executeQuery(sql)) {
            while (rows.next()) {
                if (email.trim().equals(rows.getString("Email"))
                        && matches(password, rows.getString("Password"))) {
                    return rows.getInt("CustomerID");
                }
            }
        }
        return 0;

    }

    // Stored password: random salt and PBKDF2 hash, both written as hex.
    static boolean matches(char[] password, String stored) throws SQLException {
        if (stored == null || !stored.matches("[0-9a-f]{32}:[0-9a-f]{64}")) return false;
        HexFormat hex = HexFormat.of();
        String[] parts = stored.split(":");
        PBEKeySpec spec = new PBEKeySpec(password, hex.parseHex(parts[0]), 600_000, 256);
        try {
            byte[] hash = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
                    .generateSecret(spec).getEncoded();
            return MessageDigest.isEqual(hash, hex.parseHex(parts[1]));
        } catch (GeneralSecurityException e) {
            throw new SQLException("Password verification unavailable.", e);
        } finally {
            spec.clearPassword();
        }
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
