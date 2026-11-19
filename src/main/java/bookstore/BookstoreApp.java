package bookstore;

import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;

public final class BookstoreApp {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(BookstoreApp::run);
    }

    private static void run() {
        String email = JOptionPane.showInputDialog("Email:");
        if (email == null)
            return;
        String password = JOptionPane.showInputDialog("Demo password (visible):");
        if (password == null)
            return;

        Database database = new Database();
        try {
            if (!database.login(email, password)) {
                JOptionPane.showMessageDialog(null, "Invalid email or password.");
                return;
            }
            while (true) {
                String keyword = JOptionPane
                        .showInputDialog("Search by title, author, or genre. Leave blank to show all books.");
                if (keyword == null)
                    return;
                JOptionPane.showMessageDialog(null, database.search(keyword), "Search Results",
                        JOptionPane.PLAIN_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error: " + e.getMessage(),
                    "Database Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
