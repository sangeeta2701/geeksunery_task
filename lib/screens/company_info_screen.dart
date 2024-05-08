
import 'package:flutter/material.dart';
import 'package:geeksynery_assignment/utils/colors.dart';
import 'package:geeksynery_assignment/utils/constants.dart';
import 'package:geeksynery_assignment/widgets/sizedbox.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        title: Text("Comapny Info"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 200,
                minHeight: 150
              ),
              decoration: BoxDecoration(
                color: wColor,
                borderRadius: BorderRadius.circular(8),
                 boxShadow:[ 
                 BoxShadow(
                    color: gColor.withOpacity(0.5),
                    spreadRadius: 5, 
                    blurRadius: 7,
                    offset: Offset(0, 2),
                 ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    infoRow("Company:","Geeksynergy Technologies Pvt Ltd"),
                    height4,
                    infoRow("Address:", "Sanjayanagar, Bengaluru-56"),
                    height4,
                    infoRow("Phone:", "XXXXXXXXX09"),
                    height4,
                    infoRow("Email:", "XXXXXX@gmail.com")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String que, String ans) {
    return Row(
                    children: [
                      Text(que,style: greyText,),
                      width4,
                      Text(ans,style: tFTextStyle,),
              
                    ],
                  );
  }
}