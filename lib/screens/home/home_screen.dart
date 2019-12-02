import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_clipper/repository/repositories.dart';
import 'package:image_clipper/screens/screens.dart';
import 'package:image_clipper/widgets/home/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  final SharedPreferencesRepository repository;

  HomeScreen({
    Key key,
    @required this.repository
  }): assert(repository != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _imageURLs;

  @override
  void initState() {
    super.initState();
    _getImageURLs();
  }
  
  Future<void> _getImageURLs() async {
    var storedImageURLs = await widget.repository.getImageURLs();
    setState(() {
      _imageURLs = storedImageURLs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.settings), 
          onPressed: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen())); 
          },
        ),
        ],
      ),
      body: _imageURLs == null
        ? HomeGridEmptyWidget()
        : HomeGridView(imageURLs: _imageURLs,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (context) => HomeDialog(onPressedOK: (text) {
            if (text.contains('http')) {
              widget.repository.saveImageURL(text);
              _getImageURLs();
            }
          }));
        },
      ),
    );
  }
}