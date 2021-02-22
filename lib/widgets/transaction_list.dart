// packages import
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// models import
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: userTransactions.isEmpty
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                children: [
                  Text(
                    'No tansactions added yet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 130,
                    child: Image.asset(
                      'assets/images/noTransactions.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).accentColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userTransactions[index].title,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    DateFormat.yMMMMd()
                                        .format(userTransactions[index].date),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.delete_outline_rounded),
                                color: Colors.grey,
                                onPressed: () => deleteTransaction(userTransactions[index].id),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
