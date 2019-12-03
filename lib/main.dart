import 'package:flutter/material.dart';
import 'package:image_clipper/models/App/app_models.dart';
import 'package:image_clipper/repository/repositories.dart';
import 'package:image_clipper/screens/screens.dart';

void main() => runApp(App(sharedPreferenceRepository: SharedPreferencesRepository(),));

// MARK: - App

class App extends StatelessWidget {
  final SharedPreferencesRepository sharedPreferenceRepository;

  App({
    Key key,
    @required this.sharedPreferenceRepository
  }): assert(sharedPreferenceRepository != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clipper',
      theme: ThemeData(
        // - Colors
        primaryColor: Colors.white,
      ),
      home: HomeScreen(repository: sharedPreferenceRepository,),
      routes: {
        RouteKeys.settings: (context) => SettingsScreen(),
      },
    );
  }
}