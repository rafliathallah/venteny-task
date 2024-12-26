import 'package:intl/intl.dart';

class DateTimeUtil {
  static const second = 1000;
  static const fifteenSeconds = 15 * second;

  static const formatFull = "yyyy-MM-dd HH:mm:ss.SSS'Z'";
  static const formatSimple = "dd MMM yyyy";
  static const formatSimpleReverse = "yyyy-MM-dd";

  static const locale = 'id_ID';

  String translateDateTime(
    String dateTime, {
    String fromFormat = formatFull,
    String toFormat = formatSimple,
  }) {
    try {
      var dt = DateFormat(fromFormat).parse(dateTime);
      return DateFormat(toFormat, locale).format(dt);
    } on FormatException catch(_) {
      return dateTime;
    }
  }
}
DateTime toDate({required String dateTime}) {
  final utcDateTime = DateTime.parse(dateTime);
  return utcDateTime.toLocal();
}

String formatDate({
  required String dateTime,
  format = "dd MMM, yyyy"
}) {
  final localDateTime = toDate(dateTime: dateTime);
  return DateFormat(format).format(localDateTime);
}

