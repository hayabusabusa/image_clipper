import 'package:flutter/material.dart';
import 'package:image_clipper/repository/repositories.dart';

class SettingsInheritedWidget extends InheritedWidget {
  final SharedPreferencesRepository repository;

  SettingsInheritedWidget({
    Key key,
    @required this.repository,
    @required Widget child,
  }): assert(repository != null),
      super(key: key, child: child);

  static SettingsInheritedWidget of(BuildContext context, { @required bool listen }) {
    return listen
      ? context.inheritFromWidgetOfExactType(SettingsInheritedWidget) as SettingsInheritedWidget
      : context
          .ancestorInheritedElementForWidgetOfExactType(SettingsInheritedWidget)
          .widget as SettingsInheritedWidget;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}