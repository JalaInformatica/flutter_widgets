import 'package:intl/intl.dart';

String formatRupiah(num value) {
  try {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(value);
  } catch (e) {
    return 'Rp0';
  }
}

String formatThousands(dynamic text){
  try {
    return NumberFormat("#,###", "id_ID").format(text);
  } catch (e) {
    return "0";
  }
}

num unFormatThousands(String strNumber){
  try {
    strNumber = strNumber.replaceAll('.','');
    return num.parse(strNumber);
  } catch (e){
    return 0;
  }
}

String dateToUserFormat(String dateTime, {String? format}){
  try {
    final date = DateTime.tryParse(dateTime);
    if(date!=null){
      return DateFormat(format ?? 'dd-MM-yyyy').format(date);
    }
    return '';
  }
  catch (e) {
    return '';
  }
}

String dateToAPIFormat(String dateTime){
  try {
    final date = DateTime.tryParse(dateTime);
    if(date!=null){
      return DateFormat("yyyy-MM-dd").format(date);
    }
    return '';
  }
  catch (e) {
    return '';
  }
}

String getPercentage(int of, int from, {int decimalPoint=2}) {
  try {
    if (from == 0) return "0.00%";
    double percentage = (of / from) * 100;
    return "${percentage.toStringAsFixed(decimalPoint)}%";
  }
  catch(e){
    return "";
  }
}

String capitalizeEachWord(String text) {
  if (text.trim().isEmpty) return text;
  return text
      .split(' ')
      .map((word) => word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '')
      .join(' ');
}
