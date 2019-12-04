import 'package:flutter/material.dart';
import 'package:image_clipper/repository/repositories.dart';
import 'package:image_clipper/widgets/add_clip/add_clip_widgets.dart';
import 'package:image_clipper/widgets/dialog/dialog_widgets.dart';

// MARK: - Stateful widget

class AddClipScreen extends StatefulWidget {
  final SharedPreferencesRepository repository;

  AddClipScreen({
    Key key,
    @required this.repository
  }): assert(repository != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() => _AddClipScreenState();
}

// MARK: - State

class _AddClipScreenState extends State<AddClipScreen> {

  // MARK: Private method

  void _endEditnigForm(String text) async {
    // validation
    if (text.contains('http')) {
      await widget.repository.saveImageURL(text);
      Navigator.of(context).pop();
    } else {
      showDialog(
        context: context,
        builder: (context) => MessageDialog(message: 'URLの形式が正しくありません。',),
      );
    }
  }

  // MARK: Build widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Center(
        child: AddClipForm(endEditing: _endEditnigForm,)
      ),
    );
  }
}