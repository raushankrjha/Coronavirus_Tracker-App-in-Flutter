import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
 static List datacases =[];
List datadeaths =[];
 List datasuspected =[];
List dataconfirmed =[];
List datarecovered =[];

var cases="https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/cases";
var deaths="https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/deaths";
 var suspected="https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/cases/suspected";
var confirmed="https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/cases/confirmed";
var recovered="https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/recovered";
@override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

Future<String> getdata()async
{
 var casesresponse = await  http.get(Uri.encodeFull(cases),
 headers: {HttpHeaders.authorizationHeader: "Bearer 774c85c1-d3cc-3abf-ba5f-5462920cb60f"},
 );
 var deathsresponse = await  http.get(Uri.encodeFull(deaths),
 headers: {HttpHeaders.authorizationHeader: "Bearer 774c85c1-d3cc-3abf-ba5f-5462920cb60f"},
 );
 var suspectedresponse = await  http.get(Uri.encodeFull(suspected),
 headers: {HttpHeaders.authorizationHeader: "Bearer 774c85c1-d3cc-3abf-ba5f-5462920cb60f"},
 );
 var confirmedresponse = await  http.get(Uri.encodeFull(confirmed),
 headers: {HttpHeaders.authorizationHeader: "Bearer 774c85c1-d3cc-3abf-ba5f-5462920cb60f"},
 );
 var recoveredresponse = await  http.get(Uri.encodeFull(recovered),
 headers: {HttpHeaders.authorizationHeader: "Bearer 774c85c1-d3cc-3abf-ba5f-5462920cb60f"},
 );
print(casesresponse.body);

setState(() {
  datacases=json.decode(casesresponse.body);
  datadeaths=json.decode(deathsresponse.body);
  datasuspected=json.decode(suspectedresponse.body);
  dataconfirmed=json.decode(confirmedresponse.body);
  datarecovered=json.decode(recoveredresponse.body);

});
}
 
 
  static var entry=new CircularStackEntry(
    <CircularSegmentEntry>[
      new CircularSegmentEntry(3202, Colors.red, rankKey: 'deaths'),
      new CircularSegmentEntry(51187, Colors.green, rankKey: 'recovered'),
      new CircularSegmentEntry(39000, Colors.blue[200], rankKey: 'confirmed'),
      new CircularSegmentEntry(54406, Colors.yellow[200], rankKey: 'closes'),
    ],
    rankKey: 'Corona Virus',
  );
List<CircularStackEntry> data = <CircularStackEntry>[entry];
 Widget _buildchart(BuildContext context)
 {
   return new AnimatedCircularChart(
    
    size: const Size(200.0, 200.0),
    initialChartData: data,
    chartType: CircularChartType.Pie,
    
  );
}
  @override
  Widget build(BuildContext context) {
    var appBar =AppBar(
          title: Text("Coronavirus_Tracker"),
          actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/logo.png'),
              ),
          ],
        );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: appBar,
        body: Container(
      
        
          child: 
          datacases.isEmpty?Center(child: CircularProgressIndicator()):
          ListView(
            children: <Widget>[
              
              _buildchart(context),
              Container(
                height: 90,
                child: Card(
                  elevation: 10,
                   color: Colors.white,
                   
                  shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0),
    ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset('assets/cases.png'),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20,3,10,0),
                        child: Text("CASES",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xffFF3031)),),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(20,2,10,0),
                        child: Text("Total cases",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                      ),
                      trailing:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(datacases[0]['cases'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2C3335)),),
                      ),
                    ),
                  ),
                ),
              )
            ,Container(
                height: 90,
                child: Card(
                  elevation: 10,
                   color: Colors.white,
                   
                  shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0),
    ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset('assets/suspect.png'),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20,3,10,0),
                        child: Text("SUSPECTED CASES",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xffEEC213)),),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(20,2,10,0),
                        child: Text("Total Suspected cases",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                      ),
                      trailing:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(datasuspected[0]['data'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2C3335)),),
                      ),
                    ),
                  ),
                ),
              )
            ,Container(
                height: 90,
                child: Card(
                  elevation: 10,
                   color: Colors.white,
                   
                  shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0),
    ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset('assets/confirmed.png'),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20,3,10,0),
                        child: Text("CONFIRMED CASES",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Color(0xff30336B)),),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(20,2,10,0),
                        child: Text("Total Confirmed cases",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                      ),
                      trailing:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataconfirmed[0]['data'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2C3335)),),
                      ),
                    ),
                  ),
                ),
              )
            , 
             Container(
                height: 90,
                child: Card(
                  elevation: 10,
                   color: Colors.white,
                   
                  shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0),
    ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset('assets/death.png'),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20,3,10,0),
                        child: Text("DEATHS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xffBA2F16)),),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(20,2,10,0),
                        child: Text("Total Deaths",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                      ),
                      trailing:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(datadeaths[0]['data'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2C3335)),),
                      ),
                    ),
                  ),
                ),
              )
            ,
             Container(
                height: 90,
                child: Card(
                  elevation: 10,
                   color: Colors.white,
                   
                  shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0),
    ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset('assets/recovered.png'),
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(20,3,10,0),
                        child: Text("RECOVERED",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff019031)),),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(20,2,10,0),
                        child: Text("Total Recovered cases",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.black),),
                      ),
                      trailing:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(datarecovered[0]['data'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2C3335)),),
                      ),
                    ),
                  ),
                ),
              )
            ,
            ],
          )
        ),

      ),
    );
  }
}