import 'dart:ui';
import '../../export/AllExport.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/Group.png', color: Colors.black,)),
             Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Image.asset('assets/Group.png', color: Colors.black,)),
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
