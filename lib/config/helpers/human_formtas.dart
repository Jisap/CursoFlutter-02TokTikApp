

import 'package:intl/intl.dart';

class HumanFormats {

  static String humanReadbleNumber(double number){ // Al ponerlo static no tengo que crear una instancia para llamar a sus métodos

    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol:'',
    ).format( number );

  return formatterNumber;
  }
}