import 'package:money2/money2.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import 'currency_rates.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter(
      {super.key, required this.srcCurrency, required this.destCurrency});

  final String srcCurrency;
  final String destCurrency;

  @override
  State<StatefulWidget> createState() {
    return _CurrencyConverterState(
        CommonCurrencies().usd, CommonCurrencies().aud);
  }
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final Currency src;
  final Currency dest;
  late Money srcValue;
  late Money destValue;
  final srcValueController = TextEditingController();
  final destValueController = TextEditingController();

  _CurrencyConverterState(this.src, this.dest);

  @override
  void initState() {
    super.initState();

    srcValue = Money.fromNumWithCurrency(1.0, src);
    destValue = srcValue.exchangeTo(getExchangeRate(src, dest));

    srcValueController.text = srcValue.toString();
    destValueController.text = destValue.toString();
    srcValueController.addListener(() {
      setState(() {
        srcValue = Money.parseWithCurrency(srcValueController.text, src);
        destValue = srcValue.exchangeTo(getExchangeRate(src, dest));
        destValueController.text = destValue.toString();
      });
    });
    destValueController.addListener(() {
      setState(() {
        destValue = Money.parseWithCurrency(destValueController.text, dest);
        srcValue = destValue.exchangeTo(getExchangeRate(src, dest));
        srcValueController.text = srcValue.toString();
      });
    });
  }

  @override
  void dispose() {
    srcValueController.dispose();
    destValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: srcValueController,
          // inputFormatters: [CurrencyTextInputFormatter(name: src.code)],
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: destValueController,
          // inputFormatters: [CurrencyTextInputFormatter()],
          keyboardType: TextInputType.number,
        ),
        // Text("USD \$${value.toStringAsPrecision(precision)}"),
        // TextField(controller: valueController),
        // Text("AUS \$${resultValue.toStringAsPrecision(precision)}"),
      ],
    );
  }
}
