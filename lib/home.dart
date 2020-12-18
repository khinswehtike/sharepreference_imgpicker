import 'package:flutter/material.dart';
import 'package:third_partydemo_week10/image_picker.dart';
import 'package:third_partydemo_week10/ph.dart';
import 'package:third_partydemo_week10/sp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context,index){
          Widget widget;
          Widget page;
          switch (index) {

                case 0: 
                widget=Card(child: ListTile(title:Text('Share Preference')));
                   page=ShareP();
                  break;
                  case 1: 
                
                widget=Card(child: ListTile(title:Text('Image Picker')));
                   page=ImagePick();
                  break;
                     case 2:
                widget=Card(child: ListTile(title:Text('Permission Handaler')));
                   page=PHTest();
                  break;
                 
                default:break;
              }
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>page));
            },
              child: widget,
          );
           
        }
      )
      
    );
  }
}