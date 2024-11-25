import '../export/AllExport.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          UserHome(), 
          AppointmentList(), 
         SearchDoctorsPage(),
          UserInfoPage()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
          color: Color(0xfff148BCC),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: GNav(
                rippleColor: Color(0xfff283393),
                hoverColor: Color(0xFF283393),
                backgroundColor: Color(0xfff148BCC),
                color: Colors.white,
                activeColor: Color(0xFF000000),
                tabBackgroundColor: Colors.white,
                duration: Duration(milliseconds: 400),
                gap: 8.0,
                padding: EdgeInsets.all(10.0),
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: "Home",
                  ),
                  GButton(
                      icon: Icons.medical_services_rounded, text: "Appointment"),
                  GButton(icon: Icons.search, text: "Search"),
                  GButton(icon: Icons.person, text: "Person")
                ]),
          ),
        ),
      ),
    );
  }
}
