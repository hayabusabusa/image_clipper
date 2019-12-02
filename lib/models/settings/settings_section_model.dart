import 'package:flutter/material.dart';
import 'package:image_clipper/models/settings/settings_models.dart';

class SettingsSectionModel {
  final String title;
  final List<SettingsCellType> rows;

  SettingsSectionModel({
    @required this.title,
    @required this.rows,
  }): assert(title != null),
      assert(rows != null);
}