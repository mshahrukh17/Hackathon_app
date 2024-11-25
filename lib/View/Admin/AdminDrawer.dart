import '../../export/AllExport.dart';

class drawerdata extends StatefulWidget {
  const drawerdata({super.key});

  @override
  State<drawerdata> createState() => _drawerdataState();
}

class _drawerdataState extends State<drawerdata> {
  var name = "";
  var email = "";

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    email = prefs.getString("email")!;
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => AuthScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                  ),
                  Text(
                    name.toString(),
                    style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    email.toLowerCase(),
                    style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(height: 6.0),
            Divider(
              thickness: 2,
              color: Color(0xFF000000),
            ),
            SizedBox(height: 12.0),
            Card(
              elevation: 5,
              color: Colors.grey.shade200,
              child: ListTile(
                onTap: () {
                  Get.to(() => AddDoctor());
                },
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  "D O C T O R S",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.grey.shade200,
              child: ListTile(
                onTap: () {
                  Get.to(() => AdddoctorCat());
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: Text(
                  "C A T E G O R Y",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 5,
                color: Colors.grey.shade200,
                child: ListTile(
                  leading: Icon(
                    Icons.category,
                    color: Colors.black,
                  ),
                  title: Text(
                    "A B O U T",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Logout",
                      ),
                      content: Text(
                        "Are You Sure?",
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No")),
                        TextButton(
                            onPressed: () {
                              logout();
                            },
                            child: Text("Yes"))
                      ],
                    );
                  },
                );
              },
              child: Card(
                elevation: 5,
                color: Colors.grey.shade200,
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text(
                    "L O G O U T",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
