import 'package:flutter/material.dart';

class HomeDialog extends StatelessWidget {
  final Function(String) onPressedOK;
  final TextEditingController _editingController = TextEditingController();

  HomeDialog({
    Key key,
    @required this.onPressedOK
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Input image URL'),
      content: TextField(
        controller: _editingController,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
            onPressedOK(_editingController.text);
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}