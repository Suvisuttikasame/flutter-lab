import 'dart:math';

import 'package:expense_traker/widgets/expense_list/expenses_list.dart';
import 'package:expense_traker/model/expense.dart';
import 'package:expense_traker/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
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
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpense)),
        ],
      ),
    );
  }
}
