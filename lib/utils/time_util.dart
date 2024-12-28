import 'package:intl/intl.dart';

class TimeUtil {
  static String getCurrentTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(now);
  }

  static bool isMorning() {
    final int hour = DateTime.now().hour;
    return hour >= 6 && hour < 12;
  }

  static bool isAfternoon() {
    final int hour = DateTime.now().hour;
    return hour >= 12 && hour < 18;
  }

  static bool isEvening() {
    final int hour = DateTime.now().hour;
    return hour >= 18 && hour < 22;
  }
}