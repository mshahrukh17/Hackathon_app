import 'package:hackathon_smit/View/Admin/Controllers/AdminHomeController.dart';
import '../../export/AllExport.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final AdminHomeController adminHomeController =
      Get.put(AdminHomeController());
  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => AuthScreen());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => dashboarddata());
  }

  dashboarddata() async {
    await adminHomeController.getadmindashboarddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: drawerdata()),
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        centerTitle: true,
      ),
      body: GetBuilder<AdminHomeController>(
        builder: (controller) {
          return controller.isloading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainerWidget(
                            context,
                            adminHomeController.userscount.toString(),
                            "Users",
                            Color(0xE40000FF)),
                        ContainerWidget(
                          context,
                          adminHomeController.categorycount.toString(),
                          "Categories",
                          Color(0xFF09747C),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ContainerWidget(
                            context,
                            adminHomeController.doctorcount.toString(),
                            "Doctors",
                            Color(0xFFEB0C0C)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                  ],
                );
        },
      ),
    );
  }
}

Container ContainerWidget(BuildContext context, title, subtitle, color) {
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width * 0.44,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1F1F3)),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 17.h,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF1F1F3)),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
