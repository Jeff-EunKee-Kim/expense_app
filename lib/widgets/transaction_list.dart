import './transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
// import './user_transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (cxt, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  "No transactions, but instead you have pikachu 피카피카",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/pikachu.jpeg',
                      // 'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        :
        // ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return TransactionListCreater(transaction: transactions[index], removeTransaction: removeTransaction);
        //     },
        //     itemCount: transactions.length,
        //   );
        ListView(
            children: transactions
                .map(
                  (tx) => TransactionListCreater(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    removeTransaction: removeTransaction,
                  ),
                )
                .toList(),
          );
  }
}
