import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manageYourMoneyMobile/store/actions/incomes.action.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';
import 'package:manageYourMoneyMobile/store/store.dart';

class IncomeItemWidget extends StatelessWidget {
  const IncomeItemWidget({Key key, this.pocketNameTo, this.income})
      : super(key: key);
  final int pocketNameTo;
  final IncomeModel income;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
          child: Material(
              color: const Color.fromRGBO(191, 253, 225, 1),
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
                                  child: Text(income.name ?? 'Income name',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    child: Text(
                                        income.description ?? 'description')),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 20),
                        child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: Text(
                                        '${income.suma.toString()} grn' ??
                                            '14000 grn',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700))),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: Text(
                                        ' to : ${pocketNameTo != null ? pocketNameTo.toString() : "Purse name"}')),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 9,
                                    ),
                                    child: Text(income.data ?? 'IncomeData')),
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
                          store.dispatch(RemoveIncomePending(income.id)),
                    ),
                  )
                ],
              ))),
    );
  }
}
