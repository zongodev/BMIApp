import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.ismale, required this.result, required this.age})
      : super(key: key);
  final bool ismale;
  final double result;
  final int age;

  String get resulthelth {
    String resulttext = "";
    if (result >= 30.0) {
      resulttext = "obese";
    } else if (result >= 18.5 && result <= 24.9) {
      resulttext = "Normal";
    } else if (result >= 25.0 && result <= 29) {
      resulttext = "overweight";
    } else {
      resulttext = "thin";
    }

    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "gender: ${ismale ? "male" : "female"}",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "result:" "${result.toStringAsFixed(1)}",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "healthiness: $resulthelth",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text(
              "age : " "$age",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
