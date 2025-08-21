import 'package:flutter/material.dart' as M;
import 'package:flutter/widgets.dart';
import 'ui_kit.dart' as U;

enum TextFont {
  iranSans,
  yekan,
}

enum TextSize {
  s10,
  s12,
  s14,
  s16,
  s18,
  s20,
}

enum TextWeight {
  light,
  regular,
  medium,
  bold,
}

class Text extends M.StatelessWidget {
  //
  final String text;

  final TextFont font;

  final TextSize size;

  final TextWeight weight;

  final Color color;

  const Text(
    this.text, {
    super.key,
    this.font = TextFont.iranSans,
    this.size = TextSize.s14,
    this.weight = TextWeight.regular,
    this.color = U.Theme.onBackground,
  });

  String get _font {
    switch (font) {
      case TextFont.iranSans:
        return 'IranSans';
      case TextFont.yekan:
        return 'Yekan';
    }
  }

  double get _size {
    switch (size) {
      case TextSize.s10:
        return 10;
      case TextSize.s12:
        return 12;
      case TextSize.s14:
        return 14;
      case TextSize.s16:
        return 16;
      case TextSize.s18:
        return 18;
      case TextSize.s20:
        return 20;
    }
  }

  FontWeight get _weight {
    switch (weight) {
      case TextWeight.light:
        return FontWeight.w300;
      case TextWeight.regular:
        return FontWeight.w400;
      case TextWeight.medium:
        return FontWeight.w500;
      case TextWeight.bold:
        return FontWeight.w600;
    }
  }

  @override
  M.Widget build(M.BuildContext context) {
    return M.Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: _size,
        fontFamily: _font,
        fontWeight: _weight,
      ),
    );
  }
}
