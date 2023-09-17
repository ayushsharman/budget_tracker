import 'package:budget_tracker_application/datetime/date_time_helper.dart';
import 'package:budget_tracker_application/model/expense_item.dart';

class ExpenseData {
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getallExpenseList() {
    return overallExpenseList;
  }

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }

  void deleteExpense(ExpenseItem newExpense) {
    overallExpenseList.remove(newExpense);
  }

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thurs';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  DateTime startofWeekDate() {
    DateTime? startofWeek;

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startofWeek = today.subtract(Duration(days: i));
      }
    }

    return startofWeek!;
  }

  Map<String, double> calculateDailyExpneseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }
}
