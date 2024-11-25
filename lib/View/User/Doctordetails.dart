// ignore_for_file: must_be_immutable
// import 'UserController/UserAppointmentController.dart';

import '../../export/AllExport.dart';

class DoctorDetail extends StatefulWidget {
  var doctordata;
  DoctorDetail({super.key, required this.doctordata});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  @override
  void initState() {
    super.initState();
    widget.doctordata;
  }

  final appointmentController =
      Get.put(AppointmentController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doctor",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1.sh * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      colors: [Color(0xfff148BCC), Color(0xfff283393)]),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/Indian-Doctor-Png-Images-Hd-542x750.png'),
                      fit: BoxFit.contain)),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr.${widget.doctordata['doctorname']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.h,
                              color: Colors.black),
                        ),
                        Text(
                          widget.doctordata['categoryname'] + " Specialist",
                          style: TextStyle(
                              fontSize: 16.h,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text("4.9 (96 reviews)")
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xfff148BCC),
                          size: 35.h,
                        ),
                        Text(
                          "116+ \nPatience",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16.h),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(0xfff148BCC),
                          size: 35.h,
                        ),
                        Text(
                          "3+ \nYears",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16.h),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xfff148BCC),
                          size: 35.h,
                        ),
                        Text(
                          "4.9+ \nRatings",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16.h),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.message,
                          color: Color(0xfff148BCC),
                          size: 35.h,
                        ),
                        Text(
                          "90+ \nReveiws",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16.h),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "About Me",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.h),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Dr. ${widget.doctordata['doctorname']} is the top most ${widget.doctordata['categoryname']} specialist in Crist Hospital in London, UK. He achived several awards for his wonderful contribution Read More. . . ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 13.h),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Center(child: Obx(() {
                  return AppButton(
                    child: Text(
                      appointmentController.isbook(widget.doctordata)
                          ? "Cancel Appointment"
                          : "Book Appointment",
                      style: TextStyle(
                          fontSize: 18.h, fontWeight: FontWeight.bold),
                    ),
                    onpress: () {
                      if (appointmentController.isbook(widget.doctordata)) {
                        // Cancel the appointment
                        appointmentController
                            .cancelappointment(widget.doctordata);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Color(0xffFC40808),
                          content: Text("Appointment cancelled"),
                          action: SnackBarAction(
                            label: "Got it",
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        ));
                      } else {
                        // Book the appointment
                        appointmentController.bookedhere(widget.doctordata);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Color(0xFF1EE649),
                          content: Text("Appointment booked successfully"),
                          action: SnackBarAction(
                            label: "Got it",
                            textColor: Colors.black,
                            onPressed: () {},
                          ),
                        ));
                      }
                    },
                  );
                }))
              ],
            ),
          )
        ],
      )),
    );
  }
}
