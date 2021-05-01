import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 02 - Anthony Ramos',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            
            children: [
              PanelInformaTextField(),
              CustomTextField(),
            ],

          )
        ],
      ),
    ));
  }
}

class PanelInformaTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Personal",
      textAlign: TextAlign.left,
    );
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Prueba",
            enabledBorder: InputBorder.none,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10
        ),
      );
  }
}
