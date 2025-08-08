import 'package:intl/intl.dart';

String formatRupiah(num value) {
  try {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(value);
  } catch (e) {
    return 'Rp0'; // fallback for invalid input
  }
}