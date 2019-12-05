import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_clipper/main.dart';
import 'package:image_clipper/models/App/app_models.dart';
import 'package:image_clipper/repository/repositories.dart';
import 'package:image_clipper/widgets/home/home_widgets.dart';

// MARK: - Stateful widget

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

// MARK: - State
// RouteAware: https://qiita.com/najeira/items/89d8014a30102204babb

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  List<String> _imageURLs;

  // MARK: Lifecycle

  @override
  void initState() {
    super.initState();
    _getImageURLs();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // MARK: Transition event

  @override
  void didPopNext() {
    _getImageURLs();
  }

  // MARK: Private methods
  
  Future<void> _getImageURLs() async {
    var storedImageURLs = await widget.repository.getImageURLs();
    setState(() {
      _imageURLs = storedImageURLs;
    });
  }

  // MARK: Build widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.settings), 
          onPressed: () { 
            Navigator.of(context).pushNamed(RouteKeys.settings); 
          },
        ),
        ],
      ),
      body: _imageURLs == null
        ? HomeGridEmptyWidget()
        : HomeGridView(imageURLs: _imageURLs,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed(RouteKeys.addClip);
        },
      ),
    );
  }
}