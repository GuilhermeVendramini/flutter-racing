import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/controllers/googleSignIn.dart';

Widget buildSideDrawer(BuildContext context) {
  final _user = Provider.of<UserService>(context);
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  _user.getCurrentUser().photoUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            _user.getCurrentUser().displayName,
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
            ),
            onTap: () {},
          ),
          Divider(
            height: 10.0,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              _user.logout();
            },
          ),
        ],
      ),
    ),
  );
}
