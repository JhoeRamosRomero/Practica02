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
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(color: HexColor("f6f6f6")),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [PanelPersonal(), PanelAccount(), PanelContact()],
          ),
        ),
      ),
    )));
  }
}

class PanelInformaTextField extends StatelessWidget {
  final String name;
  const PanelInformaTextField({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        name,
        textAlign: TextAlign.left,
        style:
            TextStyle(fontWeight: FontWeight.bold, color: HexColor("4d4d4d")),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String placeholder;

  const CustomTextField({this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: HexColor("e8e8e8")),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white),
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholder,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class CustomGroup extends StatelessWidget {
  final String title;
  final placeholder;
  const CustomGroup({this.title, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PanelInformaTextField(
            name: title,
          ),
          CustomTextField(
            placeholder: placeholder,
          ),
        ],
      ),
      margin: EdgeInsets.all(7),
    );
  }
}

class CustomGroupDate extends StatelessWidget {
  final String title;
  const CustomGroupDate({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PanelInformaTextField(
            name: title,
          ),
          Row(
            children: [
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: "Month",
                    child: Text("Month"),
                  )
                ],
                value: "Month",
              ),
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: "Day",
                    child: Text("Day"),
                  )
                ],
                value: "Day",
              ),
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: "Year",
                    child: Text("Year"),
                  )
                ],
                value: "Year",
              )
            ],
          )
        ],
      ),
      margin: EdgeInsets.all(7),
    );
  }
}

class PanelPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PanelAgrupador(
          panelName: "Personal",
        ),
        CustomGroup(
          title: "Name",
          placeholder: "Anthony Ramos",
        ),
        CustomGroupDate(
          title: "Date of Birth",
        )
      ],
    );
  }
}

class PanelAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PanelAgrupador(
          panelName: "Account",
        ),
        CustomGroup(
          title: "Email",
          placeholder: "anthonyramosdev@gmail.com",
        ),
        CustomGroup(
          title: "Password",
          placeholder: "",
        ),
        CustomGroup(
          title: "Verify Password",
          placeholder: "",
        ),
      ],
    );
  }
}

class PanelContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PanelAgrupador(
          panelName: "Contact",
        ),
        CustomGroup(
          title: "Addres",
          placeholder: "938 Jackson St.",
        ),
        CustomGroup(
          title: "City",
          placeholder: "938 Jackson St.",
        ),
        CustomGroup(
          title: "Phone",
          placeholder: "8373833678",
        ),
      ],
    );
  }
}

class PanelAgrupador extends StatelessWidget {
  final String panelName;
  const PanelAgrupador({this.panelName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        panelName,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: HexColor("e8e8e8")))),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
