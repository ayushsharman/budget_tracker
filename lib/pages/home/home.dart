import 'package:budget_tracker_application/components/expense_summary.dart';
import 'package:budget_tracker_application/components/expense_tile.dart';
import 'package:budget_tracker_application/data/expense_data.dart';
import 'package:budget_tracker_application/model/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add new expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter Amount",
              ),
              controller: newExpenseAmountController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "Enter Expense Name",
              ),
              controller: newExpenseNameController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: const Text("Save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          )
        ],
      ),
    );
  }

  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  void save() {
    String expenseName = newExpenseNameController.text;
    String expenseAmount = newExpenseAmountController.text;

    if (expenseName.isNotEmpty && expenseAmount.isNotEmpty) {
      ExpenseItem newExpense = ExpenseItem(
        name: expenseName,
        amount: expenseAmount,
        dateTime: DateTime.now(),
      );

      Provider.of<ExpenseData>(context, listen: false)
          .addNewExpense(newExpense);

      Navigator.pop(context);

      clear();
    } else {
      const SnackBar(
        content: Text('Please enter both fields.'),
      );
    }
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Add Expenses"),
        ),
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Welcome Please!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Add your expenses for the day",
              ),
            ),
            const SizedBox(height: 20),

            //Bar graph
            ExpenseSummary(startofWeek: value.startofWeekDate()),

            //Expenses
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getallExpenseList().length,
              itemBuilder: (context, index) => ExpenseTile(
                name: value.getallExpenseList()[index].name,
                amount: value.getallExpenseList()[index].amount,
                dateTime: value.getallExpenseList()[index].dateTime,
                deleteTapped: (p0) =>
                    deleteExpense(value.getallExpenseList()[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
