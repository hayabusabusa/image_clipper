import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeGridView extends StatelessWidget {
  final List<String> imageURLs;

  HomeGridView({
    Key key,
    @required this.imageURLs
  }): assert(imageURLs != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: imageURLs.map((imageURL) {
        return FadeInImage.memoryNetwork(
          fit: BoxFit.cover,
          image: imageURL,
          placeholder: kTransparentImage,
          fadeInCurve: Curves.easeInOut,
        );
      } ).toList(),
    );
  }
}