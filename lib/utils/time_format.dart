import 'package:intl/intl.dart';

String formatDate(String timestamp) {
  DateTime date = DateTime.parse(timestamp);

  return DateFormat('MMMM dd, yyyy \nhh:mm a').format(date);
}