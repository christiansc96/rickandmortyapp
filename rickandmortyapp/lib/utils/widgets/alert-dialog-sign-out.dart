import 'package:flutter/material.dart';
import 'package:rickandmortyapp/auth/screens/ui/login.dart';

class AlertSignOut extends StatelessWidget {
  const AlertSignOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog(context);
  }

  _buildDialog(context) {
    return AlertDialog(
      title: Text(''),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      content: Container(
          margin: EdgeInsets.only(top: 10),
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Container(
              height: 50,
              width: 100,
              transform: Matrix4.translationValues(0, -60, 0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/rickandmorty.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              '¿Está seguro que desea cerrar sesión? 🤔',
              style: TextStyle(
                fontSize: 17,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ])),
      actions: <Widget>[
        _buildButtonOk(context),
        _buildButtonCancel(context),
      ],
    );
  }

  Widget _buildButtonOk(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white,
        child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.green,
              ),
            ),
            child: Center(
              child: Text(
                'Aceptar',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            )),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (Route<dynamic> route) => false);
        });
  }

  Widget _buildButtonCancel(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white,
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.green,
            ),
          ),
          child: Center(
            child: Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
