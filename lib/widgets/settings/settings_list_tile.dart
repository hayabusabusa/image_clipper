import 'package:flutter/material.dart';
import 'package:image_clipper/screens/screens.dart';
import 'package:image_clipper/models/settings/settings_models.dart';

class SettingsListTile extends StatelessWidget {
  final SettingsCellType cellType;

  const SettingsListTile({
    Key key,
    @required this.cellType
  }): assert(cellType != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (cellType) {
      // - About
      case SettingsCellType.about:
        return ListTile(
          title: Text('このアプリについて'),
          leading: Icon(Icons.info, color: Colors.transparent,),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => WebViewScreen(url: 'https://github.com/hayabusabusa/image_clipper',))
            );
          },
        );
      // - OSS
      case SettingsCellType.oss:
        return ListTile(
          title: Text('OSSライセンス'),
          leading: Icon(Icons.info, color: Colors.transparent,),
          onTap: () {
            showLicensePage(context: context);
          },
        );
      // - Version
      case SettingsCellType.version:
        return ListTile(
          title: Text('バージョン'),
          leading: Icon(Icons.info, color: Colors.transparent,),
          trailing: Text('0.0.1'),
        );
      // - Remove all
      case SettingsCellType.removeAll:
        return ListTile(
          title: Text(
            'データを削除する',
            style: TextStyle(color: Colors.red[300]),
          ),
          leading: Icon(Icons.delete, color: Colors.red[300],),
          onTap: () {
            // TODO: ここに repository の処理を持ってきたい
            // でも上位のWidgetが持つrepositoryをここにコンストラクタで伝達してくるのは辛い...
            // -> 今こそ InheritedWidget を使う時
          },
        );
      default:
        return ListTile(
          title: Text('UNKNOWN'),
        );
    }
  }
}