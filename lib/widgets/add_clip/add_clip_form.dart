import 'package:flutter/material.dart';

class AddClipForm extends StatelessWidget {
  final TextEditingController _editingController = TextEditingController();
  final Function(String) endEditing;

  AddClipForm({
    Key key,
    @required this.endEditing,
  }): assert(endEditing != null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // - Text
          Text(
            '画像のURLを入力もしくは\nクリップボードにコピーしたURLを\nそのまま貼り付けることができます。',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          // - Spacer
          SizedBox(height: 4,), 
          // - Input form
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // - TextField
                Flexible(
                  child: TextField(
                  controller: _editingController,
                    decoration: InputDecoration(
                      labelText: '画像URLを入力',
                      hintText: '画像URL',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
                    ),
                  ),
                ),
                // - Spacer
                SizedBox(width: 8,), 
                // - Button
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    endEditing(_editingController.text);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}