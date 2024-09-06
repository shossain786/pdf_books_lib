// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  late String expenseType;
  late String expenseAmount;
  late String date;
  late String details;
  AddExpenseEvent({
    required this.expenseType,
    required this.expenseAmount,
    required this.date,
    required this.details,
  });
}


class EditExpenseEvent extends ExpenseEvent {
  late String expenseType;
  late String expenseAmount;
  late String date;
  late String details;
  EditExpenseEvent({
    required this.expenseType,
    required this.expenseAmount,
    required this.date,
    required this.details,
  });
}

class FetchExpenseEvent extends ExpenseEvent {}
