import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../export/AllExport.dart';


class AdminDoctorController extends GetxController {
  bool isloading = false;

 // => Store the categories in this list <= \\ 
  var catlist = [];

   // => Store the Dishes in this list <= \\
  var doctorlist = [];

 // => TextField Controller of Dish page <= \\
  TextEditingController doctoremail = TextEditingController();
  TextEditingController doctorpassword = TextEditingController();
  TextEditingController doctorname = TextEditingController();
  // => dropdown values <= \\

  var setdropdownvalue = "";
  var selectdropdownkey = "";
  var currentIndex = 0;

 // => Loader <= \\
  setloading(value) {
    isloading = value;
    update();
  }
// => Dropdown Values <= \\
  setdropdown(value) {
    setdropdownvalue = value["catname"];
    selectdropdownkey = value["catkey"];
    update();
  }

 // => Get categories to show in admin panel <= \\
  getcategory() async {
    setloading(true);
    CollectionReference catginst =
        FirebaseFirestore.instance.collection("category");
    await catginst.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        catlist.add(doc.data());
        print(catlist);
      });
    });
        
    setloading(false);
    update();
  }

  adddoctorinCategory() async {
  try {
    if (doctorname.text.isEmpty) {
      Get.snackbar("Error", "Please enter Doctor name");
    } else if (doctoremail.text.isEmpty) {
      Get.snackbar("Error", "Please enter Doctor email");
    } else if (doctorpassword.text.isEmpty) {
      Get.snackbar("Error", "Please enter Doctor password");
    } else if (setdropdownvalue == "") {
      Get.snackbar("Error", "Please select Category ");
    } else {
      setloading(true);

      final UserCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: doctoremail.text,
        password: doctorpassword.text,
      );
      var uid = UserCredential.user!.uid;

      var doctorData = {
        "doctorname": doctorname.text,
        "doctoremail": doctoremail.text,
        "doctorpassword": doctorpassword.text,
        "doctorkey": uid,
        "doctorcategory": selectdropdownkey,
        "categoryname": setdropdownvalue,
        "usertype": "doctors",
      };

      CollectionReference doctorsCollection = FirebaseFirestore.instance.collection("doctors");
      await doctorsCollection.doc(uid).set(doctorData);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', true);
      prefs.setString('name', doctorname.text);
      prefs.setString('email', doctoremail.text);
      prefs.setString('userID', uid);
      prefs.setString('usertype', 'doctors');

      setloading(false);
      doctorname.clear();
      doctoremail.clear();
      doctorpassword.clear();

      Get.snackbar("Success", "Doctor added successfully");
      getdoctor(currentIndex);
      update();
    }
  } catch (e) {
    setloading(false);
    Get.snackbar("Error", e.toString());
  }
}


  getdoctor(index) async {
    currentIndex=index;
    for (var i = 0; i < catlist.length; i++) {
      catlist[i]["selected"] = false;
    }
    catlist[index]["selected"] = true;
    update();
    CollectionReference dishinst =
        FirebaseFirestore.instance.collection("doctors");
    await dishinst
        .where("doctorcategory", isEqualTo: catlist[index]["catkey"])
        .get()
        .then((QuerySnapshot snapshot){
          final alldoctors = snapshot.docs.map((doc) => doc.data()).toList();

          doctorlist = alldoctors;
        } );
        print(doctorlist);
        update();
  }
}