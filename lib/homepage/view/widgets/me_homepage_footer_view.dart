import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MEHomepageFooterView extends StatelessWidget {
  const MEHomepageFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Flagbearers for",
            style: GoogleFonts.workSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 1.17,
                color: const Color(0xffd5dbe2)),
          ),
          Text(
            "Accountants!",
            style: GoogleFonts.workSans(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              height: 1.17,
              color: const Color(0xffd5dbe2),
            ),
          ),
          Text(
            "Created with ♥️ at Miles Education",
            style: GoogleFonts.workSans(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              height: 1.17,
              color: const Color(0xffd5dbe2),
            ),
          )
        ],
      ),
    );
  }
}
