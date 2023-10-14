import 'package:flutter/material.dart';

const primaryColor = Color(0xFF723837);
const secondaryColor = Color(0xFF1D7B58);
const colorWhite = Color(0xFFFFFFFF);
const colorBlack = Color(0xFF000000);
const backgroundColor = Color(0xFFFFF5EA);
const textDarkColor = Color(0xFF5E2829);
const textBlackColor = Color(0xFF182427);
const hintColor = Color.fromARGB(60, 114, 56, 55);
const primaryColor1 = Color(0xFF552929);
const primaryColor2 = Color(0xFF7A4443);
const borderColorSell = Color(0xFFDFCDCD);
const borderColorSell1 = Color(0xFFAA8787);
const borderColorSell2 = Color(0xFFF3E6DB);
const transparent = Color(0xFFFFFFFF);
const colorLightGreen = Color(0xFF0E9A38);
const colorGreyLight = Color(0xFF8B9192);
const boutiqueColor = Color(0xFFF6E6D4);
const colorGreyLight2 = Color(0xFFD0D3D3);
const colorGreyLight3 = Color(0xFFEFEFEF);
const colorGreyLight4 = Color(0xFFF7F7F7);
const brownShadow = Color(0xFFFAEFE5);
const backgroundTransparentColor = Color(0xA6FFFFFF);
const colorGreen = Color(0xFF0E9A38);
const colorBrown = Color(0xFF9A700E);
const colorYellow = Color(0xFFC7C009);
const colorRed = Color(0xFFC70909);
// const myColor = Color(0xFF#0E9A38);

const paddingButton = Color(0xFFC7C009);
const paddingButtonBackground = Color(0xFFF5EBCF);
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}