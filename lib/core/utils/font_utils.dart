import 'package:all_in_one_flutter/gen/assets.gen.dart';
import 'package:all_in_one_flutter/gen/fonts.gen.dart';
import 'package:flutter_tex/flutter_tex.dart';

class FontUtils {
  const FontUtils._();

  static List<TeXViewFont> fonts = [
    TeXViewFont(
      fontFamily: FontFamily.nanumMyeongjo,
      src: Assets.fonts.nanumMyeongjo,
    ),
    TeXViewFont(
      fontFamily: FontFamily.kaTeXMain,
      src: Assets.fonts.kaTeXMainRegular,
    ),
    TeXViewFont(
      fontFamily: FontFamily.kaTeXMainItalic,
      src: Assets.fonts.kaTeXMainItalic,
    ),
  ];
}
