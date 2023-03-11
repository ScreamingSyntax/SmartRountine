import 'package:flutter/material.dart';

class FirstPageBackImage extends DecorationImage {
  final String imageData;
  FirstPageBackImage({required this.imageData})
      : super(
            image: AssetImage(
              imageData,
            ),
            opacity: 0.7,
            filterQuality: FilterQuality.low,
            colorFilter:
                const ColorFilter.mode(Colors.black, BlendMode.colorDodge),
            fit: BoxFit.cover);
}
