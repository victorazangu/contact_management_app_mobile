import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  DateTime parsedDate = DateTime.parse(inputDate);
  String day = DateFormat('d').format(parsedDate);
  String daySuffix = _getDaySuffix(int.parse(day));
  String formattedDate = DateFormat("MMMM y").format(parsedDate);
  return '$day$daySuffix $formattedDate';
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
