import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  var formattedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateDate();
  }

  void updateDate() {
    try {
      final DateFormat dateFormat = DateFormat('EEEE, d MMMM');
      formattedDate.value = dateFormat.format(DateTime.now());
    } catch (e) {
      print('Error formatting date: $e');
      formattedDate.value = 'Date format error';
    }
  }
}
