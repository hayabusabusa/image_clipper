import 'package:flutter/material.dart';

class HomeGridEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Image not clipped.',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
    );
  }
}