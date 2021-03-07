import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizify/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _topBar(String count, {left = true, color = Colors.green}) {
    List<Widget> _items = [
      Text(
        count,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.0,
          color: color
        ),
      ),
      Container(
        height: 10.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    ];
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        child: Container(
          width: 50.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: left ? _items : _items.reversed.toList()),
        ),
      ),
    );
  }

  _optionButton(String value, {Color borderColor=Colors.black38, IconData optionIcon}) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          print('option presses');
        },
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(color: borderColor),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    shape: BoxShape.circle,
                    color: optionIcon != null ? borderColor : Colors.white
                  ),
                  child: optionIcon != null ? FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      optionIcon,
                    ),
                  ) : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          Positioned(
            right: 40.0,
            left: 40.0,
            top: 200.0,
            child: Container(
              height: 200.0,
              width: 50.0,
              child: Card(
                elevation: 10.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _topBar('06'),
                        _topBar('07', left: false, color: Colors.red),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                          'Question 13/20',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Container(
                        child: Text(
                          'What is flutter all about? In what language it it written in?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150.0,
            left: 120.0,
            right: 120.0,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent, width: 10.0),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '18',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                _optionButton('First Option', borderColor: Colors.red, optionIcon: Icons.close),
                _optionButton('Second Option'),
                _optionButton('Third Option', borderColor: Colors.green, optionIcon: Icons.check),
                _optionButton('Fourth Option'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
