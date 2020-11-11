import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLogo extends StatelessWidget {
  final String mensaje;

  const CustomLogo({Key key, @required this.mensaje}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svg/GO BLANCO.svg',
              semanticsLabel: 'Alv',
            ),
            SizedBox(height: 20),
            Text(
              this.mensaje,
              style: TextStyle(fontSize: 34, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
