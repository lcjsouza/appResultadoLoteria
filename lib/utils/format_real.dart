import 'package:intl/intl.dart';

String formatNumero(double valor){
  return NumberFormat.simpleCurrency(locale: 'pt_BR').format(valor);
}