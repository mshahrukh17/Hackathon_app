import '../../../export/AllExport.dart';

class AdminHomeController extends GetxController {
  bool isloading = false;
  var userscount = 0;
  var categorycount = 0;
  var doctorcount = 0;

  setloading(value) {
    isloading = value;
    update();
  }

  getadmindashboarddata() async {
    setloading(true);
    CollectionReference usersref = FirebaseFirestore.instance.collection("users");
    await usersref.get().then((QuerySnapshot snapshot){
      print("Users ${snapshot.docs.length}");
      userscount = snapshot.docs.length;
    });

     CollectionReference catref = FirebaseFirestore.instance.collection("category");
    await catref.get().then((QuerySnapshot snapshot){
      print("Categories ${snapshot.docs.length}");
      categorycount = snapshot.docs.length;
    });

     CollectionReference dishref = FirebaseFirestore.instance.collection("doctors");
    await dishref.get().then((QuerySnapshot snapshot){
      print("Doctors ${snapshot.docs.length}");
      doctorcount = snapshot.docs.length;
    });
    setloading(false);
    update();
  }
}
