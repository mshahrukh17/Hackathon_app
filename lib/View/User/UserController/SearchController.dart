import '../../../export/AllExport.dart';

class DoctorSearchController extends GetxController {
  RxString searchQuery = ''.obs;
  RxList searchResults = [].obs;

  Future<void> fetchDoctors(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    try {
      final result = await FirebaseFirestore.instance
          .collection('doctors')
          .where('doctorname', isGreaterThanOrEqualTo: query)
          .where('doctorname', isLessThanOrEqualTo: query + '\uf8ff')
          .get();

      searchResults.value = result.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching doctors: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    debounce(searchQuery, (query) {
      fetchDoctors(query);
    }, time: Duration(milliseconds: 300));
  }
}
