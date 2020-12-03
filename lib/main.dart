import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: home1()));
}

class home1 extends StatefulWidget {
  @override
  _home1State createState() => _home1State();
}

class _home1State extends State<home1> {
  int d, m, y;
  String day1 = "", month1 = "", year1 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Center(
            child: Text(
          'AGE CALCULATOR',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Texturina',
              color: Colors.white70),
        )),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
              child: new Text(
                'YEAR OF BIRTH',
                style: TextStyle(color: Colors.white70),
              ),
              borderSide: new BorderSide(color: Colors.orange[800], width: 3.0),
              color: Colors.white,
              textColor: Colors.white,
              onPressed: () {
                a1();
              },
            ),
            Text(
              year1 + " " + month1 + " " + day1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  fontFamily: 'Texturina',
                  color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }

  Future a1() async {
    DateTime date1 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    setState(() {
      d = int.parse(DateFormat('dd ').format(date1));
      m = int.parse(DateFormat('MM ').format(date1));
      y = int.parse(DateFormat('yy ').format(date1));
      int d1 = int.parse(DateFormat('dd ').format(DateTime.now()));
      int m1 = int.parse(DateFormat('MM').format(DateTime.now()));
      int y1 = int.parse(DateFormat('yy ').format(DateTime.now()));
      int day = finddays(m1, y1);
      if (d1 - d > 0)
        day1 = (d1 - d).toString() + " days ";
      else {
        day1 = (d1 + day - d).toString() + " days";

        m1 = m1 - 1;
      }
      if (m1 - m > 0)
        month1 = (m1 - m).toString() + " months";
      else {
        month1 = (m1 + 12 - m).toString() + " months";

        y1 = y1 - 1;
      }
      year1 = (y1 - y).toString() + " years";
    });
  }

  int finddays(int m2, int y2) {
    int day2;
    if (m2 == 1 || m2 == 3 || m2 == 5 || m2 == 8 || m2 == 10 || m2 == 12)
      day2 = 31;
    else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11)
      day2 = 30;
    else {
      if (y2 % 4 == 0)
        day2 = 29;
      else
        day2 = 28;
    }
    return day2;
  }
}
