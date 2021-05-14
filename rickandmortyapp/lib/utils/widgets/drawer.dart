import 'package:flutter/material.dart';
import 'package:rickandmortyapp/utils/widgets/alert-dialog-sign-out.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 9,
      child: _buildMenu(context),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Column(children: <Widget>[
      DrawerHeader(
        child: Container(),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/rickandmorty.jpg'),
          ),
        ),
      ),
      Expanded(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildSignOut(context),
            SizedBox(height: 100),
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            "©2021 @christiansc96",
            style: TextStyle(
              fontSize: 15.5,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ))
    ]);
  }

  Widget _buildSignOut(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text(
        'Cerrar Sesión',
        style: TextStyle(
          fontSize: 16.2,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        _showIsLoggedinDialog(context);
      },
    );
  }

  Future _showIsLoggedinDialog(context) {
    return showDialog(
      builder: (context) {
        return AlertSignOut();
      },
      context: context,
    );
  }
}
