import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTournamentPage extends StatelessWidget {
  const MainTournamentPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('賽事名稱'),
                Text('比賽日期'),
                Text('比賽地點'),
                Text('報名日期'),
                Text('比賽級別'),
              ],
            ),
          ),
        );
      },
    );
  }
}
