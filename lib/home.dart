import 'package:app_bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  double height = 170.0;
  int age = 20;
  double weight = 70.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      m1Expanded(context, 'male'),
                      const SizedBox(
                        width: 10,
                      ),
                      m1Expanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "height",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "CM",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Slider(
                          value: height,
                          onChanged: (val) {
                            setState(() {
                              height = val;
                            });
                          },
                          min: 70,
                          max: 220,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      m2Expanded(context, 'age'),
                      const SizedBox(
                        width: 10,
                      ),
                      m2Expanded(context, 'weight'),
                    ],
                  ),
                ),
              ),
              Container(
                //colors=teal
                color: Colors.teal,
                width: double.infinity,
                height: MediaQuery.of(context).size.height/16,
                child: TextButton(
                    onPressed: () {
                      double rslt= weight / pow(height/100, 2);
                      print(rslt);
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return  Result(ismale: ismale, result: rslt, age: age);
                      }));
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == 'male' ? ismale = true : ismale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (ismale && type == "male")
                ? Colors.teal
                : (!ismale && type == "female")
                    ? Colors.teal
                    : Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              type == "male" ? Icons.male : Icons.female,
              size: 90,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              type == 'male' ? "male" : "female",
              style: Theme.of(context).textTheme.headline2,
            )
          ]),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            type == 'age' ? "age" : "weight",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            type == "age" ? '$age' : '$weight',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type=="age" ? "age++" : "weight++",
                onPressed: () {
                  setState(() {
                    type == "age" ? age++ : weight++;
                  });
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                heroTag: type=="age" ? "age--" : "weight--",
                onPressed: () {
                  setState(() {
                    type == "age" ? age-- : weight--;
                  });
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
