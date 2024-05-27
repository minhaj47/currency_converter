import 'dart:developer';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() {
    return _CurrencyConverterMaterialState();
  }
}

class _CurrencyConverterMaterialState
    extends State<CurrencyConverterMaterialPage> {
  double ans = 0;
  final textEditingController = TextEditingController();

  void convert() {
    log('Clicked');
    log(textEditingController.text);
    ans = double.parse(textEditingController.text) * 127.5;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 217, 232),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 10, 1, 51),
          ),
        ),
      ),
      body: ColoredBox(
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
                    'TK: ${ans != 0 ? ans.toStringAsFixed(3) : ans.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 100),
                  TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: "Enter amount in USD: ",
                      hintStyle: TextStyle(
                        color: Colors.deepPurple[900],
                      ),
                      prefixIcon: const Icon(Icons.monetization_on_outlined),
                      prefixIconColor: Colors.deepPurple[900],
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: convert,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 114, 73, 184),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      shadowColor: Colors.white,
                    ),
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
