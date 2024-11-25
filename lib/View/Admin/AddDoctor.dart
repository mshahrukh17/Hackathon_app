import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_smit/Components/AppButton.dart';
import '../../Components/Inputfield.dart';
import 'Controllers/AddDoctorController.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  var adddoctor = Get.put(AdminDoctorController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getallcategory();
    });
  }

  getallcategory() async {
    await adddoctor.getcategory();
  }

  adddoctors() {
    adddoctor.adddoctorinCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Doctor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<AdminDoctorController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Inputfield(
                  controller: controller.doctorname,
                  hinttext: 'Doctor Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                Inputfield(
                  controller: controller.doctoremail,
                  hinttext: 'Doctor Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                Inputfield(
                  controller: controller.doctorpassword,
                  hinttext: 'Doctor Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: controller.setdropdownvalue == ""
                            ? Text('Select Category')
                            : Text(controller.setdropdownvalue.toString()),
                        onChanged: (newValue) {
                          newValue as Map;
                          controller.setdropdown(newValue);
                        },
                        items: controller.catlist.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item["catname"]),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                    child: controller.isloading
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                        : Text("Add Doctor",
                        ),
                    onpress: () {
                      adddoctors();
                    }),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          controller.catlist.length,
                          (index) => GestureDetector(
                            onTap: () => controller.getdoctor(index),
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color:Colors.blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  controller.catlist[index]['catname']
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 const SizedBox(width: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.doctorlist.length,
                      itemBuilder: (context, index) {
                        final doctor = controller.doctorlist[index];
                        return Card(
                          child: ListTile(
                            title: Text(doctor["doctorname"] ?? "N/A"),
                            subtitle: Text(doctor["doctoremail"] ?? "N/A"),
                            trailing: Text(doctor["categoryname"] ?? "N/A"),
                          ),
                        );
                      },
                    ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
