import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double ans = 0;
  final textEditingController = TextEditingController();

  void convert() {
    log('Clicked');
    log(textEditingController.text);
    ans = double.parse(textEditingController.text) * 127.5;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 230, 217, 232),
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 64, 2, 95),
          ),
        ),
      ),
      child: ColoredBox(
        color: const Color.fromARGB(255, 230, 217, 232),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tk. ${ans != 0 ? ans.toStringAsFixed(3) : ans.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                        color: Color.fromARGB(255, 71, 3, 105)),
                  ),
                  const SizedBox(height: 60),
                  CupertinoTextField(
                    controller: textEditingController,
                    placeholder: "Enter amount in USD: ",
                    placeholderStyle: const TextStyle(
                      fontSize: 25,
                      color: CupertinoColors.inactiveGray,
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 81, 2, 121),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    prefix: const Icon(CupertinoIcons.money_dollar),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CupertinoButton(
                    onPressed: convert,
                    color: const Color.fromARGB(255, 114, 73, 184),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: const Text('CONVERT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
