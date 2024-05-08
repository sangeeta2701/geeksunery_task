
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynery_assignment/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customThemeButton(String buttonText, VoidCallback ontap) {
    return SizedBox(
      // height: 24.h,
      width: double.infinity,
      child: MaterialButton(
        color: themeColor,
        onPressed:ontap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            buttonText,
            style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: wColor,
                height: 1.4),
          ),
        ),
      ),
    );
  }