// ignore_for_file: depend_on_referenced_packages, unused_element

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pdf_books_lib/global/utils/database_helper.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final DatabaseHelper db = DatabaseHelper();

  ExpenseBloc() : super(ExpenseInitial()) {
    on<AddExpenseEvent>((event, emit) {});
    on<EditExpenseEvent>((event, emit) {});
    on<FetchExpenseEvent>((event, emit) {});
  }

  Future<FutureOr<void>> _fetchExpenseList(
      FetchExpenseEvent event, Emitter<ExpenseState> emit) async {
    emit(FetchExpenseLoadingState());
    try {
      List<Map<String, dynamic>> expenseList =
          await db.queryAllRows(table: "ExpenseData");
      if (expenseList.isNotEmpty) {
        emit(FetchExpenseListLoaedState(expenseList: expenseList));
      } else {
        emit(FetchExpenseListFailedState(errorMessage: "No data found"));
      }
    } catch (e) {
      emit(FetchExpenseListFailedState(errorMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> _addExpense(
      AddExpenseEvent event, Emitter<ExpenseState> emit) async {
    emit(AddExpenseLoadingState());
    try {
      int outPutResult = await db.insert(table: "ExpenseData", values: {
        'name': event.expenseType,
        'amount': event.expenseAmount,
        'date': event.date,
        'details': event.details,
      });
      if (outPutResult > 0) {
        emit(AddExpenseSuccessState(
            successMessage: 'Expense added successfully'));
      } else {
        emit(AddExpenseFailedsState(failureMessage: 'Failed to add expense'));
      }
    } catch (e) {
      emit(AddExpenseFailedsState(failureMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> _editExpense(
      EditExpenseEvent event, Emitter<ExpenseState> emit) async {
    emit(EditExpenseLoadingState());
    try {
      int outPutResult = await db.update(table: "ExpenseData", values: {
        'name': event.expenseType,
        'amount': event.expenseAmount,
        'date': event.date,
        'details': event.details,
      });
      if (outPutResult > 0) {
        emit(AddExpenseSuccessState(
            successMessage: 'Expense edit successfully'));
      } else {
        emit(AddExpenseFailedsState(failureMessage: 'Failed to edit expense'));
      }
    } catch (e) {
      emit(AddExpenseFailedsState(failureMessage: e.toString()));
    }
  }
}
