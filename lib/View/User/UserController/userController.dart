import '../../../export/AllExport.dart';

class UserController extends GetxController {
  bool isloading = false;
  bool dishloading = false;
  var showcategory = []; // For categories
  var doctorlist = []; // For doctors

  setloading(value) {
    isloading = value;
    update();
  }

  setdishloading(value) {
    dishloading = value;
    update();
  }

  Future<void> getallcategory() async {
    setloading(true);
    try {
      CollectionReference catginst =
        FirebaseFirestore.instance.collection("category");
    await catginst.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        showcategory.add(doc.data());
        print(showcategory);
      });
    });
    getdoctor(0);
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      setloading(false);
      update();
    }
  }

  // Get doctors for a selected category
  getdoctor(index) async {
    setdishloading(true);

    // Reset selection for categories
    for (var i = 0; i < showcategory.length; i++) {
      showcategory[i]["selected"] = false;
    }
    showcategory[index]["selected"] = true;
    update();

    // Fetch doctors from the selected category
    CollectionReference doctors =
        FirebaseFirestore.instance.collection("doctors");
    await doctors
        .where("doctorcategory", isEqualTo: showcategory[index]["catkey"])
        .get()
        .then((QuerySnapshot snapshot) {
      final alldoctors = snapshot.docs.map((doc) => doc.data()).toList();
      doctorlist = alldoctors; // Store doctors in `dishlist`
      print(alldoctors);
      update();
    });

    setdishloading(false);
    update();
  }
}
