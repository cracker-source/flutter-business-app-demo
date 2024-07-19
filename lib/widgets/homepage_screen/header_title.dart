import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 30,
              height: 30,
              color: AppColors.primaryColor,
              child: const Icon(
                Icons.shop,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            text: "GROW",
            style: GoogleFonts.lilitaOne(
              color: Colors.black,
              fontSize: 20,
            ),
            children: [
              TextSpan(
                text: " MORE",
                style: GoogleFonts.lilitaOne(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
