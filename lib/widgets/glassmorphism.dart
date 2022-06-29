import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism(
      {Key? key,
      required this.child,
      required this.blur,
      required this.border,
      required this.opacity,
      required this.borderradius,
      required this.color,
      required this.height,
      required this.width})
      : super(key: key);
  final Widget child;
  final double border;
  final double opacity;
  final double blur;
  final Color color;
  final double borderradius;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderradius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur,sigmaY: blur),
          child: SizedBox(
            height: height,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color.withOpacity(opacity),
                    border: Border.all(
                        width: border, color: color.withOpacity(01))),
                child: child),
          ),
        ),
      ),
    );
  }
}
