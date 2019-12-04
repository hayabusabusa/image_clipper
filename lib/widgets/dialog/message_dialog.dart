import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String message;

  const MessageDialog({
    Key key,
    @required this.message,
  }): assert(message != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () { Navigator.of(context).pop(); },
        )
      ],
    );
  }
}