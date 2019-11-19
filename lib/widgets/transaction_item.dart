import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListCreater extends StatelessWidget {
  const TransactionListCreater({
    Key key,
    @required this.transaction,
    @required this.removeTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function removeTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: EdgeInsets.all(3),
            child: FittedBox(
                child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text("Delete"),
                onPressed: () =>
                    removeTransaction(transaction.id),
              )
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    removeTransaction(transaction.id),
              ),
      ),
    );
  }
}