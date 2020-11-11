import 'package:chat/widgets/botonAzul_widget.dart';
import 'package:chat/widgets/custom_input_widget.dart';
import 'package:chat/widgets/custom_label_widget.dart';
import 'package:chat/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3c1361),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLogo(mensaje: 'Menssenger',),
                _Form(),
                CustomLabel(
                  subtitle: 'No tienes cuenta?',
                  title: 'Crear una ahora!',
                  ruta: 'register',
                ),
                Text('Términos y condiciones de uso',
                    style: TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.white54))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passworldController = TextEditingController();
  // final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icono: Icons.email_outlined,
            placeHolder: 'Correo',
            inputType: TextInputType.text,
            textController: emailController,
          ),
          CustomInput(
            icono: Icons.lock_outlined,
            placeHolder: 'Contraseña',
            inputType: TextInputType.number,
            textController: passworldController,
            esPassWorld: true,
          ),
          BotonAzul(
            texto: 'Ingrese!',
            onPress: () {
              print('vamos a ver que peped');
            },
          )
        ],
      ),
    );
  }
}
