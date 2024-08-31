import 'package:flutter/material.dart';
import 'package:pdf_books_lib/models/expenses/screen/add_expense_screen.dart';

class ExpenseViewScreen extends StatefulWidget {
  const ExpenseViewScreen({super.key});

  @override
  State<ExpenseViewScreen> createState() => _ExpenseViewScreenState();
}

class _ExpenseViewScreenState extends State<ExpenseViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle_outline_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
