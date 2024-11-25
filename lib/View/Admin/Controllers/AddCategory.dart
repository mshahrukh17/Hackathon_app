// ignore_for_file: invalid_use_of_protected_member


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:hackathon_smit/export/AllExport.dart';

class AddCateogy extends GetxController {
  bool isloading = false;
  RxList catlist = [].obs;

  setloading(value) {
    isloading = value;
    update();
  }

  addcategorylist(String name) async {
    if (name.isEmpty) {
      Get.snackbar("Error", "Please Enter Category Name!");
    } else {
      setloading(true);
       var key = FirebaseDatabase.instance.ref("categorykey").push().key;
      var catobj = {"catname": name, "catkey": key,};
      CollectionReference catinst =
          FirebaseFirestore.instance.collection("category");
      await catinst.doc(key).set(catobj);
      Get.snackbar("Success", "Category added in list");
      setloading(false);
      getcategorylist();
    }
    update();
  }

  getcategorylist() async {
    catlist.value.clear();
    CollectionReference catinst =
        FirebaseFirestore.instance.collection("category");
    await catinst.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        catlist.value.add(doc.data());
        print(catinst);
      });
    });
    update();
  }
}