import 'package:flutter/material.dart';
import 'TextFieldfile.dart';
import 'package:calculator/CalculatorFeatures.dart';
void main() {
  runApp(MyApp());
}

int firstnumber;
int secondnumber;
dynamic output  = "";

CalcFeatures calcFeatures = CalcFeatures();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String calculatedAns = '323';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment(
                  0.3, 0.0), // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xff6ebfb5),
                const Color(0xff5e6f64)
              ], // whitish to gray
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('Asset/shiv.png'),
                colorFilter: ColorFilter.mode(
                    Colors.white10.withOpacity(0.2), BlendMode.dstATop))),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Simple Calculator"),
            backgroundColor: Colors.white10.withOpacity(0.3),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Output:$output',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextfiledWidget(
                  hinttext: 'Enter First Number',
                  function: (value) {
                    firstnumber = int.parse(value);
                  },
                ),
                TextfiledWidget(
                  hinttext: 'Enter Second Number',
                  function: (value) {
                    secondnumber = int.parse(value);
                  },
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                     BUTTON(button: '+',function: (){
                       setState(() {
                         output = calcFeatures.add(n1: firstnumber,n2: secondnumber);
                       });

                     },),

                      BUTTON(button: '-',function: (){
                       setState(() {
                         output = calcFeatures.add(n1: firstnumber,n2: secondnumber);
                       });
                      },),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BUTTON(button: '/',function: (){
                     setState(() {
                       output  = calcFeatures.division(n1: firstnumber,n2: secondnumber);
                     });
                    },),
                    BUTTON(button: '*',function: (){
                      setState(() {
                        output  = calcFeatures.division(n1: firstnumber,n2: secondnumber);
                      });
                    },),
                  ],
                )
              ],
            ),
          ),
          backgroundColor: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
  }
}

class BUTTON extends StatelessWidget {
  final String button;
  Function function;

  BUTTON({@required this.button,this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
       color: Colors.grey,
       child: Text("$button",style: TextStyle(fontSize: 30),),);
  }
}
