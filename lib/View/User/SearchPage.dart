import 'package:hackathon_smit/View/User/UserController/SearchController.dart';
import 'package:hackathon_smit/export/AllExport.dart';

class SearchDoctorsPage extends StatelessWidget {
  final DoctorSearchController controller = Get.put(DoctorSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Doctors"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                labelText: 'Search Doctors',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.searchResults.isEmpty) {
                return Center(child: Text("No results found"));
              }
              return ListView.builder(
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  final doctor = controller.searchResults[index];
                  return Card(
              color: Color(0xfff148BCC),
              margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            'assets/Indian-Doctor-Png-Images-Hd-542x750.png'),
                      ),
                      title: Text('Dr.'+doctor['doctorname'], style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                      subtitle: Text(doctor['categoryname']+' Specailist',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                      ),
                      onTap: () {
                        Get.to(() => DoctorDetail(doctordata: doctor));
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
