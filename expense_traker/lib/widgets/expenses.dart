import 'dart:math';

import 'package:expense_traker/widgets/chart/chart.dart';
import 'package:expense_traker/widgets/expense_list/expenses_list.dart';
import 'package:expense_traker/model/expense.dart';
import 'package:expense_traker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Flutter',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flutter',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Flutter',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _overlayAndDisplayModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (modalContext) => NewExpenses(
              addNewExpense: _addNewExpense,
            ));
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('expense deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpense.insert(index, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No expense! please add an expense'));

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpense,
        removeExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter expense tracker'),
        actions: [
          IconButton(
              onPressed: _overlayAndDisplayModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpense),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
