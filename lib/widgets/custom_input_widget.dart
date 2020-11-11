import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icono;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType inputType;
  final bool esPassWorld;

  const CustomInput(
      {Key key,
      @required this.icono,
      @required this.placeHolder,
      @required this.textController,
      this.inputType = TextInputType.text,
      this.esPassWorld = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String text = '';
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(right: 20,),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5),
          ]),
      child: TextField(
        controller: textController,
        autocorrect: false,
        keyboardType: this.inputType,
        obscureText: this.esPassWorld,
        decoration: InputDecoration(
          prefixIcon: Icon(this.icono),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.placeHolder,
        ),
        // ALIDAR EL TAMAÑO DEL STRING
        // onChanged: (String newValue) {
        //   if (newValue.length <= 5) {
        //     text = newValue;
        //   } else {
        //     this.textController.value = new TextEditingValue(
        //         text: text,
        //         selection: new TextSelection(
        //             baseOffset: 5,
        //             extentOffset: 5,
        //             affinity: TextAffinity.downstream,
        //             isDirectional: false),
        //         composing: new TextRange(start: 0, end: 5));
        //   }
        // },
      ),
    );
  }
}
