import 'package:flutter/material.dart';
import 'package:image_clipper/models/settings/settings_models.dart';
import 'package:image_clipper/widgets/settings/settings_widgets.dart';

class SettingsListSection extends StatelessWidget {
  final SettingsSectionModel section;

  const SettingsListSection({
    Key key,
    @required this.section,
  }): assert(section != null),
      super(key: key);

  List<SettingsListTile> _mapToListTile(List<SettingsCellType> rows) {
    return rows.map((row) => SettingsListTile(cellType: row,)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // - Title
            Row(
              children: <Widget>[
                SizedBox(width: 16,),
                Text(
                  section.title,
                  textAlign: TextAlign.left,
                ),
              ],
            ),

            // - Rows
            SizedBox(height: 8,),
            Column(
              children: _mapToListTile(section.rows),
            ),
          ],
        ),
      ),
    );
  }
}