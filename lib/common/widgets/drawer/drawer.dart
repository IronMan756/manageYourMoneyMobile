import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    
    Widget _createHeader() {
      
      return DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Stack(children: <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text('Flutter Step-by-Step',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500))),
          ]));
    }

    Widget _createDrawerItem(
        {IconData icon, String text, GestureTapCallback onTap}) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Contacts',
            // onTap: () =>   
            // Navigator.pushReplacementNamed(context, Routes.contacts)
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Events',
            // onTap: () =>
            //     Navigator.pushReplacementNamed(context, Routes.events)
          ),
          _createDrawerItem(
            icon: Icons.note,
            text: 'Notes',
            // onTap: () =>
            //     Navigator.pushReplacementNamed(context, Routes.notes)
          ),
          const Divider(),
          _createDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
          _createDrawerItem(icon: Icons.face, text: 'Authors'),
          _createDrawerItem(
              icon: Icons.account_box, text: 'Flutter Documentation'),
          _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
          const Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: const Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
