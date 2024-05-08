
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geeksynery_assignment/utils/colors.dart';
import 'package:geeksynery_assignment/utils/constants.dart';
import 'package:geeksynery_assignment/widgets/sizedbox.dart';

import '../screens/company_info_screen.dart';

Widget customDrawer(BuildContext context, String name) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                size: 40.sp,
              ),
              height16,
              Row(
                children: [
                  Text(
                    "Name: ",
                    style: smallTextStyle,
                  ),
                  Text(
                    name,
                    style: headingStyle,
                  ),
                ],
              ),
            ],
          )),
          ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              color: gColor,
            ),
            title: Text("Company Info"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyInfoScreen(),));
            },
          ),
        ],
      ),
    );
  }