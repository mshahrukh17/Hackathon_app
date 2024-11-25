
import '../../export/AllExport.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController =
        Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointment's"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (appointmentController.bookappointmentlist.isEmpty) {
          return Center(
            child: Text(
              "No Appointments Booked Yet",
              style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w500),
            ),
          );
        }
        return ListView.builder(
          itemCount: appointmentController.bookappointmentlist.length,
          itemBuilder: (context, index) {
            final doctor = appointmentController.bookappointmentlist[index];
            return Card(
              color: Color(0xfff148BCC),
              margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                      'assets/Indian-Doctor-Png-Images-Hd-542x750.png'),
                ),
                title: Text(
                  "Dr." + doctor['doctorname'],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.h,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${doctor['categoryname']} Specialist",
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.h),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {
                    appointmentController.cancelappointment(doctor);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Appointment cancelled for ${doctor.name}"),
                      backgroundColor: Colors.red,
                    ));
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
