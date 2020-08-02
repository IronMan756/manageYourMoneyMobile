import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PocketItemWidget extends StatelessWidget {
  const PocketItemWidget(
      {Key key,
      this.purseName,
      this.purseImg,
      this.balance,
      this.availableMoney,
      this.purseLimit,
      this.dealCount})
      : super(key: key);
  final String purseName;
  final String purseImg;
  final int balance;
  final int availableMoney;
  final int purseLimit;
  final int dealCount;
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
                          child: Row(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 0),
                                        child: Text(purseName ?? 'purse name',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold)),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
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
                                              purseLimit != null
                                                  ? purseLimit.toString()
                                                  : '0',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16),
                                            ),
                                            const Text('grn',
                                                style: TextStyle(fontSize: 10)),
                                          ])),
                                      Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                              'Balance: ${balance ?? "0"} grn')),
                                      Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                              'deal: ${dealCount ?? '0'}')),
                                    ],
                                  )),
                            ],
                          ))),
                ),
              ],
            )
          ],
        ));
  }
}
