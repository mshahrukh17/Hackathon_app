import 'package:get/get.dart';

class AppointmentController extends GetxController{
  var isloading = false.obs;
  RxList bookappointmentlist = [].obs;

  setloading(val){
    isloading.value = val;
  }

  bool isbook(index){
  return bookappointmentlist.contains(index);
  }

  void bookedhere(index){
   if (!isbook(index)) {
     bookappointmentlist.add(index);
   }
  }

  void cancelappointment(index){
    bookappointmentlist.remove(index);
  }

  List getbookedcars(){
    print(bookappointmentlist);
    return bookappointmentlist;
  }

}
