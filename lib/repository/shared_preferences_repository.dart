import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {

  final String kImageURLArrayKey = 'kImageURLArrayKey';

  Future<void> saveImageURL(String imageURL) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> storedList = prefs.getStringList(kImageURLArrayKey);

    // 思った通り何も保存されていないと null で返ってくるので null チェックが必要
    if (storedList == null) {
      storedList = [imageURL];
    } else {
      storedList.add(imageURL);
    }

    return await prefs.setStringList(kImageURLArrayKey, storedList);
  }

  Future<List<String>> getImageURLs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(kImageURLArrayKey);
  }
}