package bookstore;

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.GridLayout;
import java.util.Arrays;
import java.util.concurrent.Callable;
import java.util.function.Consumer;
import javax.swing.*;

public final class BookstoreApp {
    private int customerId; // 0 means signed out; use this ID for orders and reviews.
    private final Database database = new Database();
    private final JFrame window = new JFrame("Bookstore");
    private final CardLayout cards = new CardLayout();
    private final JPanel pages = new JPanel(cards);
    private final JLabel status = new JLabel("Sign in to browse books.");
    private final JTextField email = new JTextField(24);
    private final JPasswordField password = new JPasswordField(24);
    private final JTextField keyword = new JTextField(24);
    private final JTextArea results = new JTextArea();

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new BookstoreApp().show());
    }

    private void show() {
        JButton login = new JButton("Sign in");
        JPanel form = new JPanel(new GridLayout(0, 1, 8, 8));
        form.setBorder(BorderFactory.createEmptyBorder(70, 140, 70, 140));
        form.add(new JLabel("Welcome to the bookstore"));
        form.add(new JLabel("Email"));
        form.add(email);
        form.add(new JLabel("Password"));
        form.add(password);
        form.add(login);
        pages.add(form, "login");
        JButton search = new JButton("Search");
        JButton logout = new JButton("Sign out");
        JPanel bar = new JPanel();
        bar.add(new JLabel("Title, author, or genre:"));
        bar.add(keyword);
        bar.add(search);
        bar.add(logout);
        JPanel catalog = new JPanel(new BorderLayout(10, 10));
        catalog.add(bar, BorderLayout.NORTH);
        results.setEditable(false);
        results.setMargin(new java.awt.Insets(12, 12, 12, 12));
        results.setFont(new java.awt.Font("SansSerif", java.awt.Font.PLAIN, 15));
        JTabbedPane tabs = new JTabbedPane();
        tabs.addTab("Books", new JScrollPane(results));
        // Teammates can replace these panels with their finished screens.
        tabs.addTab("Orders", placeholder("Orders", "Place orders and view order history here.",
                "Place order", "View history"));
        tabs.addTab("Reviews", placeholder("Reviews", "Read and write book reviews here.",
                "Read reviews", "Write review"));
        tabs.addTab("Admin", placeholder("Admin", "Manage the book catalog here.",
                "Add book", "Edit book", "Delete book"));
        tabs.addChangeListener(e -> window.getRootPane().setDefaultButton(
                tabs.getSelectedIndex() == 0 ? search : null));
        catalog.add(tabs, BorderLayout.CENTER);
        catalog.add(new JLabel("Leave the search blank to show all books."), BorderLayout.SOUTH);
        pages.add(catalog, "catalog");

        Runnable find = () -> {
            String term = keyword.getText();
            work(search, () -> database.search(term), books -> {
                results.setText(books.replace("\n", "\n\n"));
                results.setCaretPosition(0);
                status.setText("Customer ID: " + customerId + " | Search complete.");
            });
        };
        search.addActionListener(e -> find.run());
        keyword.addActionListener(e -> {
            if (search.isEnabled())
                find.run();
        });
        login.addActionListener(e -> {
            String address = email.getText();
            char[] entered = password.getPassword();
            password.setText("");
            work(login, () -> {
                try {
                    return database.login(address, entered);
                } finally {
                    Arrays.fill(entered, '\0');
                }
            }, id -> {
                customerId = id;
                if (customerId != 0) {
                    cards.show(pages, "catalog");
                    window.getRootPane().setDefaultButton(search);
                    keyword.requestFocusInWindow();
                    find.run();
                } else {
                    status.setText("Invalid email or password. Try again.");
                    password.requestFocusInWindow();
                }
            });
        });
        logout.addActionListener(e -> {
            if (!search.isEnabled())
                return;
            customerId = 0;
            tabs.setSelectedIndex(0);
            cards.show(pages, "login");
            keyword.setText("");
            results.setText("");
            status.setText("Signed out.");
            window.getRootPane().setDefaultButton(login);
        });
        window.add(pages);
        window.add(status, BorderLayout.SOUTH);
        window.getRootPane().setDefaultButton(login);
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        window.setSize(850, 480);
        window.setMinimumSize(new java.awt.Dimension(850, 480));
        window.setLocationRelativeTo(null);
        window.setVisible(true);
    }

    private JPanel placeholder(String title, String description, String... actions) {
        JPanel panel = new JPanel(new BorderLayout(10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(25, 25, 25, 25));
        panel.add(new JLabel(title), BorderLayout.NORTH);
        panel.add(new JLabel(description), BorderLayout.CENTER);
        JPanel buttons = new JPanel();
        for (String action : actions) {
            JButton button = new JButton(action);
            button.setEnabled(false);
            buttons.add(button);
        }
        panel.add(buttons, BorderLayout.SOUTH);
        return panel;
    }

    private <T> void work(JButton button, Callable<T> task, Consumer<T> done) {
        button.setEnabled(false);
        status.setText("Please wait...");
        new SwingWorker<T, Void>() {
            protected T doInBackground() throws Exception {
                return task.call();
            }

            protected void done() {
                button.setEnabled(true);
                try {
                    done.accept(get());
                } catch (Exception e) {
                    status.setText("Could not complete the request.");
                    JOptionPane.showMessageDialog(window, e.getCause() == null ? e.getMessage()
                            : e.getCause().getMessage(), "Database error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }.execute();
    }
}
