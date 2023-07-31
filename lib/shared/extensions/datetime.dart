import 'package:intl/intl.dart';

extension LocalTimeExtension on DateTime {
  String toRussianTime() {
    return DateFormat('dd.MM.yyyy в hh:mm').format(this);
  }
}
