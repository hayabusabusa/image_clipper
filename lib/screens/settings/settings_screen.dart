import 'package:flutter/material.dart';
import 'package:image_clipper/models/settings/settings_models.dart';
import 'package:image_clipper/widgets/settings/settings_widgets.dart';

class SettingsScreen extends StatelessWidget {
  final List<SettingsSectionModel> _sections = [
    SettingsSectionModel(title: 'アプリについて', rows: [SettingsCellType.about, SettingsCellType.oss, SettingsCellType.version]),
    SettingsSectionModel(title: 'データについて', rows: [SettingsCellType.removeAll]),
  ];

  // MARK: Build widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView.separated(
        itemCount: _sections.length,
        itemBuilder: (context, index) => SettingsListSection(section: _sections[index],),
        separatorBuilder: (context, index) => SizedBox(height: 8,),
      ),
    );
  }
}