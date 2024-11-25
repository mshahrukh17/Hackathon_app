import '../../export/AllExport.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final usercontroller = Get.put(UserController(), permanent: true);
  int _currentIndex = 0;
  var name = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getcategory();
    });
    setdata();
  }

  getcategory() async {
    await usercontroller.getallcategory();
  }

  setdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<UserController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 28.h,
                              backgroundImage: NetworkImage(
                                  "https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png"),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, Welcome back',
                                  style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  name.toString().toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.notifications_none_sharp,
                              color: Color(0xfff283393),
                              size: 30.h,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider.builder(
                    itemCount: fp.length,
                    itemBuilder: (BuildContext context, index, realIndex) {
                      return Stack(
                        children: [
                          Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              width: 1.sw,
                              height: 1.sh * 0.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xfff148BCC),
                                  Color(0xfff283393)
                                ]),
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Medical Center",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.h,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Best Doctors available,\ntry now today and take \nexperiance.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.h,
                                              color: Colors.white),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      fp[index].image,
                                      height: 180.h,
                                      width: 180.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      height: 1.sh * 0.2,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 18,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: fp.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => setState(() => _currentIndex = entry.key),
                      child: Container(
                        width: _currentIndex == entry.key ? 30.0 : 8.0,
                        height: _currentIndex == entry.key ? 8.0 : 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: _currentIndex == entry.key
                              ? Color(0xfff283393)
                              : Color(0xfff148BCC),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22.h),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 18.h),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                controller.isloading
                    ? CircularProgressIndicator()
                    : controller.showcategory.isEmpty
                        ? Text("No Category")
                        : Container(
                            height: 60.h,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: controller.showcategory.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var showcat = controller.showcategory[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.getdoctor(index);
                                    },
                                    child: Container(
                                      height: 60.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: showcat['selected']
                                              ? LinearGradient(
                                                  colors: [
                                                    Color(0xfff148BCC),
                                                    Color(0xfff283393)
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                )
                                              : null, // No gradient when not selected
                                          color: showcat['selected']
                                              ? null
                                              : Color(0xfff148BCC)
                                                  .withOpacity(0.2)),
                                      child: Center(
                                        child: Text(
                                          showcat['catname']
                                              .toString()
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: showcat['selected']
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: showcat['selected']
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                SizedBox(
                  height: 5.h,
                ),
                controller.isloading
                    ? Center(
                        child: Center(
                        child: Text("No Doctor in this category"),
                      ))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.doctorlist.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var doctor = controller.doctorlist[index];
                            return InkWell(
                              onTap: () => Get.to(() => DoctorDetail(
                                    doctordata: doctor,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1.sh * 0.2,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xfff148BCC),
                                          Color(0xfff283393)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'assets/Indian-Doctor-Png-Images-Hd-542x750.png'),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                "Dr." + doctor['doctorname'],
                                                style: TextStyle(
                                                    fontSize: 16.h,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              "Specialist in ${doctor['categoryname']}\ngive an appointment \nand experiance of \nour services",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13.h),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                ),
                                                Text(
                                                  "4.9",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade300,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15.h),
                                                ),
                                                SizedBox(
                                                  width: 110.w,
                                                ),
                                                InkWell(
                                                  onTap: () => Get.to(() =>
                                                      DoctorDetail(
                                                          doctordata: doctor)),
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.black,
                                                      )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
