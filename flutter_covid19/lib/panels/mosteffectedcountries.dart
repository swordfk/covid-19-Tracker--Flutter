import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {
  final List dataCountries;

  const MostEffectedPanel({Key key, this.dataCountries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            children: <Widget>[
              Image.network(dataCountries[index]['countryInfo']['flag'], height: 20,),
              SizedBox(width: 15,),
              Text(dataCountries[index]['country'], style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 15,),
              Text("Cases : "+dataCountries[index]['cases'].toString(),style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
            ],
          ),
        );
      },
        itemCount: 5,
      ),
    );
  }
}
