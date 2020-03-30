import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();

  TextComposer(this._sendMessage);

  final Function({String text, File file}) _sendMessage;
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final TextEditingController _textEditingController = TextEditingController();

  void reset() {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
              final File file =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              if (file == null) return;
              widget._sendMessage(file: file);
            },
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration:
                  InputDecoration.collapsed(hintText: "Enviar uma mensagem"),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget._sendMessage(text: text);
                reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.orange,
            onPressed: _isComposing
                ? () {
                    widget._sendMessage(text: _textEditingController.text);
                    reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
