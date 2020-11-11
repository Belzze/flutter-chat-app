import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final Function onPress;

  const BotonAzul({Key key, @required this.texto, @required this.onPress})
      : super(key: key);
  // const BotonAzul({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: StadiumBorder(),
        child: Container(
          height: 50,
          width: double.infinity,
          child: Center(
              child: Text(
            this.texto,
            style: TextStyle(color: Colors.white, fontSize: 17),
          )),
        ),
        onPressed: this.onPress);
  }
}
