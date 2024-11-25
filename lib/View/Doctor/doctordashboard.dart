import '../../export/AllExport.dart';

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
     logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => AuthScreen());
  }
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            logout();
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}