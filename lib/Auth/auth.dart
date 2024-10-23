import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon_smit/Auth/LoginPage.dart';
import 'package:hackathon_smit/Auth/Signup.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Center(
            child: Lottie.network(
                'https://lottie.host/55f697cd-3bcc-40f0-9d6f-94ac16115fa4/Dhr2se9vA5.json',
                repeat: true,
                reverse: false),
          ),
          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: 1.sw * 0.9,
                  height: 1.sh * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      ),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                            dividerColor: Colors.transparent,
                            indicatorColor: Color(0xfff148BCC),
                            unselectedLabelColor: Colors.grey,
                            automaticIndicatorColorAdjustment: true,
                            isScrollable: false,
                            splashBorderRadius: BorderRadius.circular(20),
                            unselectedLabelStyle: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            labelStyle: TextStyle(
                                fontSize: 20.h,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff148BCC)),
                            physics: const BouncingScrollPhysics(),
                            // labelColor: Color(0xfff148BCC),
                            tabs: [Tab(text: "SignUp"), Tab(text: "Login")]),
                        Expanded(
                          child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [SignUpPage(), LoginPage()]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
