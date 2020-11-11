import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String ruta;
  final String subtitle;
  final String title;

  const CustomLabel(
      {Key key,
      @required this.ruta,
      @required this.subtitle,
      @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, this.ruta);
      },
      child: Column(
        children: [
          Text(this.subtitle,
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: 10,
          ),
          Text(this.title,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
