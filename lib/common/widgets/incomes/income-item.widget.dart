import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IncomeItemWidget extends StatelessWidget {
  const IncomeItemWidget({
    Key key,
    this.incomeName,
    this.description,
    this.pocketNameTo,
    this.incomeDate,
  }) : super(key: key);
  final String incomeName;
  final String description;
  final int pocketNameTo;
  final int incomeDate;

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
              child: Row(
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
                              padding: const EdgeInsets.only(left: 8, top: 5),
                              child: Text(
                                  incomeName != null
                                      ? incomeName.toString()
                                      : 'Income name',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text(description != null
                                    ? description.toString()
                                    : 'description')),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 0),
                    child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: Text('14000 grn',
                                    style: TextStyle(
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
                                child: Text(incomeDate != null
                                    ? incomeDate.toString()
                                    : 'IncomeData')),
                          ],
                        )),
                  ),
                ],
              ))),
    );
  }
}
