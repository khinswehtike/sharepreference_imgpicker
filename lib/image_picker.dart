import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  var _picker=ImagePicker();
  File _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),backgroundColor: Colors.green,
        actions: [
          IconButton(icon: Icon(Icons.camera_front), onPressed: (){
            pickImage(ImageSource.gallery);

          })
        ],
      
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          if(_imageFile!=null)
          Image.file(_imageFile)
        ],),
      ),

    );
  }
  pickImage(ImageSource source) async{
    //var source=ImageSource.camera;
   var pickFile= await _picker.getImage(source: source);
   if(pickFile!=null){
     print(pickFile.path);
     var cropImage = await ImageCropper.cropImage(sourcePath: pickFile.path);
      _imageFile= cropImage;
      setState(() {
        
      });
   }else{
     print('User Cancelllllllll');
   }

  }
}