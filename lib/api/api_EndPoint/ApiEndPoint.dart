import 'package:intl/intl.dart';

class EndPoints {
  static const String reciters = "reciters";
  static const String radios = "radios";

  static String getTimeEndpoint() {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    return "timingsByCity/${formatter.format(now)}";
  }
}
