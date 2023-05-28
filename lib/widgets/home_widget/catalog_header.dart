import 'package:flutter/material.dart';
import "dart:convert";
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(context.theme.accentColor)
            .make(), //to write text in velocity
        "Trending Products".text.xl2.make()
      ],
    );
  }
}
