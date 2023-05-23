import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  TextWidget(this.text, {super.key, this.fontStyleNumber, this.fontSize});

  String text;
  double? fontSize;
  int? fontStyleNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: fontStyleNumber == 0 || fontStyleNumber == 1
          ? TextAlign.center
          : TextAlign.start,
      text,
      style: fontStyleNumber == 0
          ? GoogleFonts.arima(
              fontSize: fontSize ?? 24,
              color: const Color.fromARGB(255, 242, 234, 255),
            )
          : fontStyleNumber == 1
              ? GoogleFonts.actor(
                  fontSize: fontSize ?? 22,
                  color: const Color.fromARGB(255, 242, 234, 255),
                )
              : GoogleFonts.akshar(fontSize: 16, color: Colors.white),
    );
  }
}
