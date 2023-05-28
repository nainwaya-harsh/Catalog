import 'package:flutter/material.dart';
import "dart:convert";
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application/widgets/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p16
        .rounded
        .color(context.canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}
