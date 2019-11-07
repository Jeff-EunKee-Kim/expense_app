// import 'package:expense_app/widgets/user_transactions.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test2',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.green,
          errorColor: Colors.grey,
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'SpaceQuest',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                button: TextStyle(
                  color: Colors.white,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontFamily: 'SpaceQuest',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: "Nike",
      amount: 40.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: "t2",
      title: "BMW",
      amount: 20.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: "t3",
      title: "Benz",
      amount: 10.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: "t4",
      title: "Ball",
      amount: 30.99,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: "t5",
      title: "Food",
      amount: 20.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: "t6",
      title: "Clothes",
      amount: 20.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: "t7",
      title: "House",
      amount: 20.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransactions(String title, double amount, DateTime chosenDate) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransactions);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HooHaHooHa',
          style: Theme.of(context).appBarTheme.textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
