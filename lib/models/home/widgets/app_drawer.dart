import 'package:flutter/material.dart';
import 'package:pdf_books_lib/constants/project_const.dart';
import 'package:pdf_books_lib/models/expenses/screen/view_expense_screen.dart';
import 'package:pdf_books_lib/models/pdf_books/screens/display_books.dart';

class MyDarwerScreen extends StatelessWidget {
  const MyDarwerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Saddam Hossain',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            accountEmail: const Text(
              'sddam@in.com',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(drawerUrl),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(drawerBgImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.my_library_books_rounded),
            title: const Text('My Expense Manager'),
            trailing: const Icon(Icons.arrow_right_rounded),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExpenseViewScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.my_library_books_rounded),
            title: const Text('My Library'),
            trailing: const Icon(Icons.arrow_right_rounded),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DisplayBooksScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_right_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
