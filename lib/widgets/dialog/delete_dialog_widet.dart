import 'package:flutter/material.dart';

class DeleteDialogWidget extends StatelessWidget {
  final String message;
  final VoidCallback action;

  const DeleteDialogWidget({
    Key key,
    @required this.message,
    @required this.action,
  }): assert(message != null),
      assert(action != null),
      super(key: key); 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text('キャンセル'),
          onPressed: () { Navigator.of(context).pop(); },
        ),
        FlatButton(
          child: Text('削除', style: TextStyle(color: Colors.red[300]),),
          onPressed: action,
        ),
      ],
    );
  }
}