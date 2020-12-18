import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class PHTest extends StatefulWidget {
  @override
  _PHTestState createState() => _PHTestState();
}

class _PHTestState extends State<PHTest> {
  Location _location=Location();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permission Handaler'),backgroundColor: Colors.green),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: RaisedButton(child:Text('Get Permission'),color: Colors.green,
          onPressed: (){
           if(Platform.isIOS) 
            getIosPermission() ;
           else if(Platform.isAndroid)
            getAndroidPermission();

          },
          ),
        )
      ],),
  
    
      
    );
  }
  getIosPermission() async{
    var status=await Permission.location.status;
    if(status.isUndetermined){
      var requestPermission= await Permission.location.request();
      if(requestPermission.isGranted){

      }else if (requestPermission.isDenied){

    }

    }else if(status.isGranted){

    }else if (status.isDenied){

    }
  }
  getAndroidPermission() async{
    print('Android Permission Handaler');
     var requestPermission= await Permission.location.request();
      if(requestPermission.isGranted){
        print('Permission Granted');
        getLocation();

      }else if (requestPermission.isDenied){
        print("Permission Denied");
        var url="http://www.google.com";
        var status=canLaunch(url);
        status.then((value) { if(value) launch("http://www.google.com");});
        
       

    }

  }
  getLocation() async{
    var location= await _location.getLocation();
    //print('lat:${location.latitude} and lonh:${location.longitude}');For one time
    // _location.onLocationChanged.listen((location) { 
    //   print('lat:${location.latitude} and lonh:${location.longitude}');
    // });

  }
}