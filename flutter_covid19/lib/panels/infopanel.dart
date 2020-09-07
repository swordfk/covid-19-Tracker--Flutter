import 'package:flutter/material.dart';
import 'package:flutter_covid19/dataSource.dart';
import 'package:flutter_covid19/pages/faqs.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQsPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('FAQS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/en/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DONATE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('MYTH BUSTERS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),),
                  Icon(Icons.arrow_forward, color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
