import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

// TickerProviderStateMixin esta cosa es para sincronizar el vertical sinc
class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  List<ChatMessage> _messages = [
    // ChatMessage(
    //   uid: '1',
    //   texto:
    //       'mensaje de prueba 1 qw eqw eqweqwweqw qw vamos a ver como queda esto',
    // ),
    // ChatMessage(
    //   uid: '1',
    //   texto: 'holis',
    // ),
    // ChatMessage(
    //   uid: '2',
    //   texto: 'mensaje de prueba 3',
    // ),
    // ChatMessage(
    //   uid: '1',
    //   texto: 'mensaje de prueba 4',
    // ),
  ];
  bool _estaEscribiendo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Column(
          children: [
            CircleAvatar(
                maxRadius: 14,
                child: Text('Te',
                    style: TextStyle(
                      fontSize: 12,
                    )),
                backgroundColor: Colors.blue[200]),
            SizedBox(
              height: 3,
            ),
            Text(
              'Test 1',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            Divider(
              height: 1,
            ),
            // TODO
            Container(
              color: Colors.white,
              // height: 50,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  _estaEscribiendo = true;
                } else {
                  _estaEscribiendo = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),
          // Boton para enviar el mensaje
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: (Platform.isIOS)
                ? CupertinoButton(
                    child: Text('Enviar'),
                    onPressed: _estaEscribiendo
                        ? () => _handleSubmit(_textController.text.trim())
                        : null)
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    // IconTheme solo para agregar el colorcito
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                        // color: Colors.blue[400],
                      ),
                    ),
                  ),
          )
        ],
      ),
    ));
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;
    print(texto);
    _focusNode.requestFocus();
    _textController.clear();
    final newMessage = new ChatMessage(
      texto: texto,
      uid: '1',
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: off sel socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
