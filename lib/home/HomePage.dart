import 'package:flutter/material.dart';
import 'package:flutter_drawer/pages/AboutPage.dart';
import 'package:flutter_drawer/pages/ProfilePage.dart';
import 'package:flutter_drawer/pages/SettingsPage.dart';


class HomePage extends StatefulWidget {

  final drawerItems = [
    new DrawerItem("Profile", Icons.rss_feed),
    new DrawerItem("About us", Icons.local_pizza),
    new DrawerItem("Settings", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new ProfilePage();
      case 1:
        return new AboutPage();
      case 2:
        return new SettingsPage();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerItem{

  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
