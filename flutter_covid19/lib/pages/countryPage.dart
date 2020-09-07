import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List dataCountries;
  fetchDataCountries() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      dataCountries = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchDataCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Country Static'),
      ),
      body: dataCountries==null?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.blueGrey[50],boxShadow: [
              BoxShadow(color: Colors.white, blurRadius: 10, offset: Offset(0, 10))
            ]),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(dataCountries[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Image.network(dataCountries[index]['countryInfo']['flag'], height: 50,width: 60,),
                    ],
                  ),
                ),
                Expanded(child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('CONFIRMED : '+ dataCountries[index]['cases'].toString(),style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                      Text('ACTIVE : '+ dataCountries[index]['active'].toString(),style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                      Text('RECOVERED : '+ dataCountries[index]['recovered'].toString(),style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                      Text('DEATHS : '+ dataCountries[index]['deaths'].toString(),style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ))
              ],
            ),
          );
        },
        itemCount: dataCountries == null ? 0 : dataCountries.length,
      ),
    );
  }
}
