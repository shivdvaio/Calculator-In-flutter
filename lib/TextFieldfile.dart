import 'package:flutter/material.dart';
import 'package:calculator/main.dart';

class TextfiledWidget extends StatelessWidget {
  final String hinttext;
  Function function;

  TextfiledWidget({@required this.hinttext, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: function,
        style: TextStyle(color: Colors.black, fontSize: 15),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.blue),
            ),
            hintText: "$hinttext",
            hintStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
