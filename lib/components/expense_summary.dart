import 'package:budget_tracker_application/bargraph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startofWeek;
  const ExpenseSummary({
    super.key,
    required this.startofWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => const SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: 100,
          sunAmount: 20,
          monAmount: 10,
          tueAmount: 50,
          wedAmount: 200,
          thurAmount: 25,
          friAmount: 150,
          satAmount: 20,
        ),
      ),
    );
  }
}
