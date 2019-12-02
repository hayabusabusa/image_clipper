import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: imageURLs.length,
      staggeredTileBuilder: (index) => StaggeredTile.count(1, index.isEven ? 1 : 0.5),
      itemBuilder: (context, index) => FadeInImage.memoryNetwork(
        fit: BoxFit.cover,
        image: imageURLs[index],
        placeholder: kTransparentImage,
        fadeInCurve: Curves.easeInOut,
      ),
    );
  }
}