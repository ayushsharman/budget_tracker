import 'package:budget_tracker_application/bargraph/bar_graph.dart';
import 'package:budget_tracker_application/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startofWeek;
  const ExpenseSummary({
    super.key,
    required this.startofWeek,
  });

  double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;

    List<double> values = [
      value.calculateDailyExpneseSummary()[sunday] ?? 0,
      value.calculateDailyExpneseSummary()[monday] ?? 0,
      value.calculateDailyExpneseSummary()[tuesday] ?? 0,
      value.calculateDailyExpneseSummary()[wednesday] ?? 0,
      value.calculateDailyExpneseSummary()[thursday] ?? 0,
      value.calculateDailyExpneseSummary()[friday] ?? 0,
      value.calculateDailyExpneseSummary()[saturday] ?? 0,
    ];

    values.sort();

    max = values.last * 1.1;

    return max == 0 ? 100 : max;
  }

  double calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpneseSummary()[sunday] ?? 0,
      value.calculateDailyExpneseSummary()[monday] ?? 0,
      value.calculateDailyExpneseSummary()[tuesday] ?? 0,
      value.calculateDailyExpneseSummary()[wednesday] ?? 0,
      value.calculateDailyExpneseSummary()[thursday] ?? 0,
      value.calculateDailyExpneseSummary()[friday] ?? 0,
      value.calculateDailyExpneseSummary()[saturday] ?? 0,
    ];

    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    //get yymmdd for each day of this week
    String sunday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startofWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Week Total: "),
                Text(
                    "Rs. ${calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}"),
              ],
            ),
          ),
          SizedBox(
            height: calculateMax(value, sunday, monday, tuesday, wednesday,
                thursday, friday, saturday),
            child: MyBarGraph(
              maxY: 100,
              sunAmount: value.calculateDailyExpneseSummary()[sunday] ?? 0,
              monAmount: value.calculateDailyExpneseSummary()[monday] ?? 0,
              tueAmount: value.calculateDailyExpneseSummary()[tuesday] ?? 0,
              wedAmount: value.calculateDailyExpneseSummary()[wednesday] ?? 0,
              thurAmount: value.calculateDailyExpneseSummary()[thursday] ?? 0,
              friAmount: value.calculateDailyExpneseSummary()[friday] ?? 0,
              satAmount: value.calculateDailyExpneseSummary()[saturday] ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
