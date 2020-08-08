import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/store.dart';

class PurseItemWidget extends StatelessWidget {
  const PurseItemWidget({
    Key key,
    // this.purseName,
    this.purseImg,
    // this.balance,
    this.availableMoney,
    this.purseLimit,
    this.dealCount,
    this.purse,
    this.func,
  }) : super(key: key);
  final Function func;
  // final String purseName;
  final String purseImg;
  // final int balance;
  final int availableMoney;
  final int purseLimit;
  final int dealCount;
  final PurseModel purse;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: FittedBox(
                      child: Material(
                          elevation: 25.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: const Image(
                                            // fit: BoxFit.contain,
                                            // alignment:
                                            //     Alignment.topLeft,
                                            image: NetworkImage(
                                                'https://www.birthdaywishes.expert/wp-content/uploads/2015/10/good-morning-image-sunflower.jpg'))),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, top: 0),
                                            child: Text(
                                                purse.name ?? 'purse name',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                  'Available: ${availableMoney ?? "0"} grn')),
                                          const Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Text('indicator')),
                                        ],
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 0),
                                              child: Row(children: <Widget>[
                                                const Text('Limit:'),
                                                const SizedBox(width: 5),
                                                Text(
                                                  purseLimit.toString() ?? '0',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16),
                                                ),
                                                const Text('grn',
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                              ])),
                                          Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: InkWell(
                                                onTap: () => func(),
                                                child: Text(
                                                    'Balance: ${purse.balance ?? "0"} grn'),
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                  'deal: ${dealCount ?? '0'}')),
                                        ],
                                      )),
                                ],
                              ),
                              Positioned(
                                top: -10,
                                right: -10,
                                child: IconButton(
                                    iconSize: 20,
                                    icon:
                                        Icon(Icons.delete, color: Colors.grey),
                                    onPressed: () => store.dispatch(
                                        RemovePursePending(purse.id))),
                              ),
                            ],
                          ))),
                ),
              ],
            )
          ],
        ));
  }
}
