import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tennis_tournament/favorites_page.dart';
import 'package:tennis_tournament/constants.dart';

import 'main_tournament_page.dart';

void main() => runApp(MyApp());
Logger logger = Logger();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: Constants.mainTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget mainFragment = MainTournamentPage();
  String title;

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            title: Text(Constants.mainTitle),
            onTap: () {
              setState(() {
                title = Constants.mainTitle;
                mainFragment = MainTournamentPage();
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(Constants.favoritesPageTitle),
            onTap: () {
              setState(() {
                title = Constants.favoritesPageTitle;
                mainFragment = FavoritesPage();
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    title = widget.title;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => logger.d('add is presses'),
          )
        ],
        title: Text(title),
        centerTitle: true,
      ),
      body: mainFragment,
    );
  }
}
