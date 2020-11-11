import 'package:chat/pages/Loading_page.dart';
import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading': (context) => LoadingPage(),
  'chat': (context) => ChatPage(),
  'login': (context) => LoginPage(),
  'register': (context) => RegisterPage(),
  'usuario': (context) => UsuarioPage(),
};
