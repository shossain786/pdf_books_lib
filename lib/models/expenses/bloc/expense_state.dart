// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'expense_bloc.dart';

@immutable
sealed class ExpenseState {}

final class ExpenseInitial extends ExpenseState {}

//! Add Expense Events
class AddExpenseSuccessState extends ExpenseState {
  late String successMessage;
  AddExpenseSuccessState({
    required this.successMessage,
  });
}

class AddExpenseFailedsState extends ExpenseState {
  late String failureMessage;
  AddExpenseFailedsState({
    required this.failureMessage,
  });
}

//! Edit Expense Events
class EditExpenseLoadingState extends ExpenseState {}

class EditExpenseSuccessState extends ExpenseState {
  late String successMessage;
  EditExpenseSuccessState({
    required this.successMessage,
  });
}

class EditExpenseFailedsState extends ExpenseState {
  late String failureMessage;
  EditExpenseFailedsState({
    required this.failureMessage,
  });
}

//! Fetch Expense List State

class FetchExpenseLoadingState extends ExpenseState {}

class FetchExpenseListLoaedState extends ExpenseState {
  late List<Map<String, dynamic>> expenseList;
  FetchExpenseListLoaedState({
    required this.expenseList,
  });
}

class FetchExpenseListFailedState extends ExpenseState {
  late String errorMessage;
  FetchExpenseListFailedState({
    required this.errorMessage,
  });
}