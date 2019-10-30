import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addText;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addText);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                  // onChanged: (val) => titleInput = val,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Price"),
                  controller: amountController,
                  // onChanged: (val) => amountInput = val,
                ),
                FlatButton(child: Text("Add Transaction"),
                  textColor: Colors.purple,
                  onPressed:() {
                    // print(titleInput);
                    // print(amountInput);
                    addText(titleController.text, double.parse(amountController.text));
                  },
                )
              ]),
            ),
          );
  }
}