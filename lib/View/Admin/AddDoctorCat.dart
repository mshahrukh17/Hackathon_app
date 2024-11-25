import 'package:hackathon_smit/Components/AppButton.dart';
import 'package:hackathon_smit/export/AllExport.dart';

import 'Controllers/AddCategory.dart';

class AdddoctorCat extends StatefulWidget {
  const AdddoctorCat({super.key});

  @override
  State<AdddoctorCat> createState() => _AdddoctorCatState();
}

class _AdddoctorCatState extends State<AdddoctorCat> {
  TextEditingController _adddoctor = TextEditingController();
  var addcategory = Get.put(AddCateogy());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getcat();
    });
  }

  addcat() async {
    await addcategory.addcategorylist(_adddoctor.text);
  }

  getcat() async {
    await addcategory.getcategorylist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Doctor"),
        centerTitle: true,
      ),
      body: GetBuilder<AddCateogy>(builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                cursorColor: Colors.black,
                controller: _adddoctor,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  )),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  )),
                ),
              ),
            ),
            AppButton(
                child: Text("Add"),
                onpress: () {
                  addcat();
                  _adddoctor.clear();
                }),
            const SizedBox(
              height: 20,
            ),
            ...List.generate(controller.catlist.length, (index) => ListTile(
              leading: Text((index + 1).toString()),
              title: Text(controller.catlist[index]['catname']),
            ))
          ],
        );
      }),
    );
  }
}
