import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveItem});

  final void Function(Expense expense) onRemoveItem;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //ListView.builder create an element only its visible
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            vertical: 8,
          ),
        ),
        onDismissed: (direction) {
          onRemoveItem(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
