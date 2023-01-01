import 'package:money2/money2.dart';

ExchangeRate getExchangeRate(Currency src, Currency dest) {
  // TODO: hard-coded
  // https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml
  return ExchangeRate.fromFixed(Fixed.fromNum(1.34),
      fromCode: src.code, toCode: dest.code);
}
