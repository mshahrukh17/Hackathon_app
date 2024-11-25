import '../../export/AllExport.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  void initState() {
    super.initState();
    setdata();
  }

  var name = "";
  var email = "";
  var userID = "";

  setdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    email = prefs.getString("email")!;
    userID = prefs.getString("userID")!;
    setState(() {});
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => AuthScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "P R O F I L E",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            name.toString().toUpperCase(),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            email.toString(),
          ),
          SizedBox(
            height: 40.0,
          ),
          InkWell(
              onTap: () {
                // Get.to(()=> UserTabbar());
              },
              child: GestureDetector(
                  // onTap: () => Get.to(() => UserOrder()),
                  child: options(context, "Appoitments".toString(),
                      Icons.arrow_forward_ios))),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              // onTap: () => Get.to(()=> UserChatPage(userId: userID,)),
              child: options(
                  context, "Contact".toString(), Icons.arrow_forward_ios)),
          SizedBox(
            height: 20.0,
          ),
          options(context, "Help".toString(), Icons.arrow_forward_ios),
          SizedBox(
            height: 20.0,
          ),
          options(
              context, "Privacy Policy".toString(), Icons.arrow_forward_ios),
          SizedBox(
            height: 20.0,
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
                          "Are you sure?",
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
                        backgroundColor: Colors.grey.shade200,
                      );
                    });
              },
              child: options(context, "Logout".toString(), Icons.logout))
        ],
      )),
    );
  }

  Material options(BuildContext context, text, icon) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
              ),
              Icon(icon)
            ],
          ),
        ),
      ),
    );
  }
}
