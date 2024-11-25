import '../export/AllExport.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      checkdata();
    });
  }
  checkdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var checkstatus = prefs.getBool("login") ?? false;
    if (checkstatus) {
      var usertype = prefs.getString("usertype");
      if (usertype == "admin") {
        Get.offAll(()=> AdminDashboard());
      }else {
        Get.offAll(()=> Navbar());
      }
    } else {
      Get.offAll(()=> AuthScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: const [Color(0xfff148BCC), Color(0xfff283393)],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft),
      ),
      child: Center(
        child: Image.asset('assets/Group.png')
      ),
    ));
  }
}
