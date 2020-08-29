import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manageYourMoneyMobile/store/actions/expences.action.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';
import 'package:manageYourMoneyMobile/store/store.dart';

class ExpenseItemWidget extends StatelessWidget {
  const ExpenseItemWidget({Key key, this.pocketNameFrom, this.expence})
      : super(key: key);
  final int pocketNameFrom;
  final ExpenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
          child: Material(
              color: const Color.fromRGBO(251, 168, 170, 1),
              elevation: 25.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 5),
                                  child: Text(expence.name ?? 'Expense name',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 5),
                                    child: Text(
                                        expence.description ?? 'description'))
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 0),
                        child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                        '${expence.suma != null ? expence.suma.toString() : '14000'} grn',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700))),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: Text(
                                        ' from : ${pocketNameFrom != null ? pocketNameFrom.toString() : "Purse name"}')),
                                const Padding(
                                    padding: EdgeInsets.only(
                                      left: 9,
                                    ),
                                    child:
                                        //  Text(expenseDate.toString()
                                        //     // expenseDate.substring(0, 4)
                                        //     // '${expenseDate.toString().substring(5, 7)} ${expenseDate.toString().substring(8, 10)} ${expenseDate.toString().substring(0, 4)}'
                                        //     // expenseDate.toString()
                                        //     ??
                                        Text('Expense date')),
                                // ${expenseDate.toString().substring(4, 15)}${expenseDate.toString().substring(16, 21)}
                              ],
                            )),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          store.dispatch(RemoveExpencePending(expence.id)),
                    ),
                  )
                ],
              ))),
    );
  }
}
