import 'package:flutter/material.dart';

class IndonesiaPanel extends StatelessWidget {
  final List dataCountries;

  const IndonesiaPanel({Key key, this.dataCountries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red[800],
            count: dataCountries[94]['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[800],
            count: dataCountries[94]['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green[800],
            count: dataCountries[94]['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.purple[100],
            textColor: Colors.purple[800],
            count: dataCountries[94]['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(3),
      height: 80, width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),)
          ,Text(count, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),)
        ],
      ),
    );
  }
}