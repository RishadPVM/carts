import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {

    var type2profileImgPath = ''.obs;
    var type3profileImgPath = ''.obs;

  List<String> socialmedia = ["Instagram", "Facebook", "Whatsapp", "Twitter"];
  Rx<List<String>> selectedoptionlist = Rx<List<String>>([]);
 // Rx<List<IconData>> iconTypes = Rx<List<IconData>>([]);
  var selectedOption = "".obs;

 type3changeImage(context,)async{
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
      if(img == null) return; 
      type3profileImgPath.value = img.path;
    }on PlatformException catch (e) {
    }
  }
type2changeImage(context,)async{
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
      if(img == null) return; 
      type2profileImgPath.value = img.path;
    }on PlatformException catch (e) {
    }
  }
   
}
