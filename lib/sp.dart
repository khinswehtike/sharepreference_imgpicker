

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareP extends StatefulWidget {
  @override
  _SharePState createState() => _SharePState();
}

class _SharePState extends State<ShareP> {
  SharedPreferences _preferences;
  var i=0;
  var rcount=2;
  bool status=false;
  int count=1;
  double amount=0.0;
  String data="GGGG";
  String info="d";
  Map<String,dynamic> infos={
    "name":"Tin",
    "age":23,
    "phone":0988888777,
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _preferenceFuture=SharedPreferences.getInstance();
    _preferenceFuture.then((preference) {
    _preferences=preference;
    read();

   write();
    }
     );
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Share Preference'),backgroundColor: Colors.green,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Status is $status'),
           Text('Count is $count'),
            Text('Double is $amount'),
             Text('String is $data'),
             Text("SInfo is $info"),
        Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(onPressed: (){
            write();
          },
          child:Text('Write')
          ),
        ),
           Container(
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(onPressed: (){
           
            setState(() {
               read();
            });
          },
          child:Text('Read')
          ),
        )
      ],),
    );
  }
write() async{
   await _preferences.setBool("status", true);
   rcount++;
  await _preferences.setInt("count", rcount);
 await _preferences.setDouble("amount", 100000);
 var myVal=[1,2,3,4];
 var valStrinig=myVal.toString();
 var vals=myVal.join(",");

var inif= jsonEncode(infos);
await _preferences.setString("info", inif);
  await _preferences.setString("data", vals);

}
read(){

status=_preferences.getBool("status");
count=_preferences.getInt("count");
amount=_preferences.getDouble("amount");
data=_preferences.getString("data");
var infos=_preferences.getString("info");
var infoMap=jsonDecode(infos) as Map<String,dynamic>;
print(infoMap["name"]);
setState(() {
  
});
}
}