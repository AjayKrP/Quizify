import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  _cardItems(String itemText, String itemSubTitle) {
    return Column(
      children: [
        Text(
          itemText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(itemSubTitle),
      ],
    );
  }

  _iconButton(String name, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: color),
              shape: BoxShape.circle,
              color: color
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(name),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
          ),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )),
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            top: MediaQuery
                .of(context)
                .size
                .height / 2 - 100,
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Card(
                elevation: 10.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cardItems('100%', 'Competition'),
                          _cardItems('100%', 'Competition')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cardItems('100%', 'Competition'),
                          _cardItems('100%', 'Competition'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 250.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _iconButton('Play Again', Icons.refresh, Colors.blue),
                      _iconButton('Review Answer', Icons.remove_red_eye, Colors.blue),
                      _iconButton('Share Score', Icons.share, Colors.teal),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _iconButton('Generate PDF', Icons.description, Colors.blue),
                      _iconButton('Home', Icons.home, Colors.blue),
                      _iconButton('LeaderBoard', Icons.assessment, Colors.blue),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
