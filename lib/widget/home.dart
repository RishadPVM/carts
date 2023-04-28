

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:flip_card/flip_card.dart';
import '../constants/constants.dart';
import '../home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> fontStyles = [
    'Roboto',
    'Poppins',
    'Oswald',
    'PlayfairDisplay'
  ];
  final List<String> types = ['Type 1','Type 2','Type 3'];
  var dammy=[];
   var temblist=[] ;
   int a=0;
  var listlength= 0;
  bool insta = false;
  bool face = false;
  bool whats = false;
  bool twitter = false;
  var controller = Get.put(HomeController());

  final nameController = TextEditingController();
  final designationController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final addressController = TextEditingController();

  String name = '';
  String? designation = '';
  String? phone = '';
  String? email = '';
  String? website = '';
  String? address = '';

  String? selectedType;
  String? selectedFont;

  Color color = Colors.red;

  String? fontRoboto = 'Roboto';
  String? fontPoppins = 'Poppins';
  String? fontosWald = 'Oswald';
  String? fontPlayFair = 'PlayfairDisplay';

  @override
  Widget build(BuildContext context) {
    Widget buildColorPicker() => ColorPicker(
          pickerAreaHeightPercent: 0.8,
          pickerColor: color,
          onColorChanged: (color) => setState(() => this.color = color),
        );

    void pickColor(BuildContext context) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Pick Your Color"),
            content: SizedBox(
              height: 500,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildColorPicker(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Select",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: const Color(0xffe9fef8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              hight80,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: btColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // const SizedBox(),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: const TextStyle(
                              color: btColor,
                            ),
                            hint: const Text(
                              "Font",
                              style: TextStyle(color: btColor),
                            ),
                            items: fontStyles
                                .map(
                                  (font) => DropdownMenuItem(
                                    value: font,
                                    child: Text(font),
                                  ),
                                )
                                .toList(),
                            value: selectedFont,
                            onChanged: (value) {
                              setState(() {
                                selectedFont = value;
                                debugPrint(selectedFont);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: btColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: color),
                        ),
                        InkWell(
                          onTap: () {
                            pickColor(context);
                          },
                          child: const Text(
                            "Color",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: btColor,
                            ),
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                  )
                ],
              ),
              hight46,
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: btColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: btColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconEnabledColor: kwhite,
                            // style: const TextStyle(color: kwhite),
                            hint: const Text(
                              "Type",
                              style: TextStyle(
                                color: kwhite,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            items: types
                                .map(
                                  (type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ),
                                )
                                .toList(),
                            value: selectedType,
                            onChanged: (value) {
                              setState(() {
                                selectedType = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  width50
                ],
              ),
              hight20,
              selectedType == "Type 1"
                  ? typeOne(context)
                  : selectedType == "Type 2"
                      ? typeTwo(context)
                      : selectedType == "Type 3"
                          ? typeThree(context)
                          : typeOne(context)
            ],
          ),
        ),
      ),
    );
  }

  ///______________TYPEONE________________

  Column typeOne(BuildContext context) {
    return Column(
      children: [

        Container(
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1674168439528-7a1810e73a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: color,
                        fontSize: 15,
                        fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                                ? fontPoppins
                                : selectedFont == 'Oswald'
                                    ? fontosWald
                                    : selectedFont == 'PlayfairDisplay'
                                        ? fontPlayFair
                                        : fontRoboto,
                      ),
                    ),
                    Text(
                      designation!,
                      style: TextStyle(
                        fontSize: 15,
                        color: color,
                        fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                                ? fontPoppins
                                : selectedFont == 'Oswald'
                                    ? fontosWald
                                    : selectedFont == 'PlayfairDisplay'
                                        ? fontPlayFair
                                        : fontRoboto,
                      ),
                    ),
                    Text(
                      phone!,
                      style: TextStyle(
                        fontSize: 15,
                        color: color,
                        fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                                ? fontPoppins
                                : selectedFont == 'Oswald'
                                    ? fontosWald
                                    : selectedFont == 'PlayfairDisplay'
                                        ? fontPlayFair
                                        : fontRoboto,
                      ),
                    ),
                    Text(
                      email!,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                                ? fontPoppins
                                : selectedFont == 'Oswald'
                                    ? fontosWald
                                    : selectedFont == 'PlayfairDisplay'
                                        ? fontPlayFair
                                        : fontRoboto,
                        color: color,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        hight20,
        Padding(
          padding: const EdgeInsets.only(top: 36, left: 30, right: 30),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  name = nameController.text;
                },
                keyboardType: TextInputType.name,
                controller: nameController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  designation = designationController.text;
                },
                controller: designationController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Designation",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  phone = phoneController.text;
                },
                keyboardType: TextInputType.phone,
                controller: phoneController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Phone",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  email = emailController.text;
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight46,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: btColor),
                        minimumSize: const Size(120, 40),
                        shape: const StadiumBorder(
                            side: BorderSide(color: btColor))),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: btColor),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      debugPrint(name);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: btColor),
                        minimumSize: const Size(120, 40),
                        shape: const StadiumBorder(
                            side: BorderSide(color: btColor))),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: btColor),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  ///______________TYPETWO_____________

  Column typeTwo(BuildContext context) {
    return Column(
      children: [
        FlipCard(
  fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
  direction: FlipDirection.HORIZONTAL, // default
  side: CardSide.FRONT, // The side to initially display.
  front:  Container(
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1674168439528-7a1810e73a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 20,),
                  Obx(
                    () => Row(
                      children: [
                        SizedBox(width:20 ,),
                        controller.type2profileImgPath.isNotEmpty?
                        CircleAvatar(radius: 25,
                         backgroundImage:FileImage(File(controller.type2profileImgPath.value)),
                       // backgroundImage: NetworkImage('https://images.pexels.com/photos/3586091/pexels-photo-3586091.jpeg?cs=srgb&dl=pexels-tain%C3%A1-bernard-3586091.jpg&fm=jpg'),
                        )
                        :SizedBox(width: 20,),
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Text(name,
                           style: TextStyle(
                            color: color,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                            ),
                         )
                      ],
                    ),
                  ),

                  Row(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 80,),
                      Icon(Icons.email,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(email!,
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 80,),
                      Icon(Icons.phone,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('+91 $phone',
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 10,top: 20),
                        child: Text(designation!,
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20,bottom: 10,top: 20),
                        child: Text('RCT3544202319',style: TextStyle(color: Color.fromARGB(255, 212, 211, 211),fontSize: 10),),
                      )
                    ],
                  )
                   
                ]
                ),
            ),
  back: Container(
    padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1674168439528-7a1810e73a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('asset/icon/carbon_location-company.png'),color: Colors.white,),
                      ),
                      Expanded(
                        child: Text(address! ,
                        style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                          softWrap: false,
                          maxLines: 2,
                          overflow:TextOverflow.ellipsis
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('asset/icon/icons8-website-30.png'),color: Colors.white,),
                      ),
                      Expanded(
                        child: Text( website!,
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                          softWrap: false,
                          maxLines: 2,
                          overflow:TextOverflow.ellipsis
                          ),
                      )
                    ],
                  )
                ],
              ),
              ),
),
       
        hight20,
        Padding(
          padding: const EdgeInsets.only(top: 36, left: 30, right: 30),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  name = nameController.text;
                },
                keyboardType: TextInputType.name,
                controller: nameController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  designation = designationController.text;
                },
                controller: designationController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Designation",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  phone = phoneController.text;
                },
                keyboardType: TextInputType.phone,
                controller: phoneController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Phone",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  email = emailController.text;
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  website = websiteController.text;
                },
                controller: websiteController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Website",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  address = addressController.text;
                },
                controller: addressController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Address",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              Obx(() => 
                 Column(
                  children: [
                    controller.type2profileImgPath.isEmpty?
                 CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                      child: IconButton(onPressed: (){controller.type2changeImage(context);}, icon: Icon(Icons.photo_camera_back,color:Colors.white,size: 30,)),                  
                    ):
                 InkWell(
                  onTap: () =>controller.type2changeImage(context) ,
                   child: CircleAvatar(
                        radius: 40,
                        backgroundImage:FileImage(File(controller.type2profileImgPath.value)),                    ),
                 ),
                  ],
                ),
              ),
              hight8,
              const Text(
                "Upload Your Logo",
                style: TextStyle(color: btColor, fontSize: 13),
              ),
              hight46,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: btColor),
                      minimumSize: const Size(120, 40),
                      shape: const StadiumBorder(
                        side: BorderSide(color: btColor),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: btColor),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: btColor),
                        minimumSize: const Size(120, 40),
                        shape: const StadiumBorder(
                            side: BorderSide(color: btColor))),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: btColor),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  //__________________TYPETHREE____________
  Column typeThree(BuildContext context) {
    return Column(
      children: [
             FlipCard(
  fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
  direction: FlipDirection.HORIZONTAL, // default
  side: CardSide.FRONT, // The side to initially display.
  front:  Container(
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1674168439528-7a1810e73a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 20,),
                  Obx(
                    () => Row(
                      children: [
                        SizedBox(width: 20,),
                        controller.type3profileImgPath.isNotEmpty?
                        CircleAvatar(radius: 25,
                         backgroundImage:FileImage(File(controller.type3profileImgPath.value)),
                       // backgroundImage: NetworkImage('https://images.pexels.com/photos/3586091/pexels-photo-3586091.jpeg?cs=srgb&dl=pexels-tain%C3%A1-bernard-3586091.jpg&fm=jpg'),
                        )
                        :SizedBox(width: 20,),
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Text(name,
                           style: TextStyle(
                            color: color,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                            ),
                         )
                      ],
                    ),
                  ),

                  Row(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 80,),
                      Icon(Icons.email,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(email!,
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 80,),
                      Icon(Icons.phone,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('+91 $phone',
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 10,top: 20),
                        child: Text(designation!,
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20,bottom: 10,top: 20),
                        child: Text('RCT3544202319',style: TextStyle(color: Color.fromARGB(255, 212, 211, 211),fontSize: 10),),
                      )
                    ],
                  )
                   
                ]
                ),
            ),
  back: Container(
    padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.83,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1674168439528-7a1810e73a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('asset/icon/carbon_location-company.png'),color: Colors.white,),
                      ),
                      Expanded(
                        child: Text(address! ,
                        style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                          softWrap: false,
                          maxLines: 3,
                          overflow:TextOverflow.ellipsis
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage('asset/icon/icons8-website-30.png'),color: Colors.white,),
                      ),
                      Expanded(
                        child: Text( website!,
                         style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                               fontFamily: selectedFont == 'Roboto'
                            ? fontRoboto
                            : selectedFont == 'Poppins'
                            ? fontPoppins
                            : selectedFont == 'Oswald'
                            ? fontosWald
                            : selectedFont == 'PlayfairDisplay'
                            ? fontPlayFair
                            : fontRoboto,
                            ),
                          softWrap: false,
                          maxLines: 2,
                          overflow:TextOverflow.ellipsis
                          ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       insta==true? ImageIcon(AssetImage('asset/icon/Vector.png'),color: Colors.white,):Text(''),
                       whats ==true? ImageIcon(AssetImage('asset/icon/icons8-whatsapp-30.png'),color: Colors.white,):Text(''),
                       face ==true? ImageIcon(AssetImage('asset/icon/Vectorfacebook.png'),color: Colors.white,):Text(''),
                       twitter ==true? ImageIcon(AssetImage('asset/icon/Vectortwitt.png'),color: Colors.white,):Text(''),
                    ],
                  )
                ],
              ),
              ),
   ), 
        hight20,
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  name = nameController.text;
                },
                keyboardType: TextInputType.name,
                controller: nameController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  designation = designationController.text;
                },
                controller: designationController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Designation",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  phone = phoneController.text;
                },
                keyboardType: TextInputType.phone,
                controller: phoneController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Phone",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  email = emailController.text;
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  website = websiteController.text;
                },
                controller: websiteController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Website",
                  hintStyle: TextStyle(color: btColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
              TextFormField(
                onChanged: (value) {
                  address = addressController.text;
                },
                controller: addressController,
                cursorColor: btColor,
                decoration: const InputDecoration(
                  hintText: "Address",
                  hintStyle: TextStyle(
                    color: btColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: btColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: btColor),
                  ),
                ),
              ),
              hight20,
             
            
              DropDownMultiSelect(
                options: controller.socialmedia,
                whenEmpty: "Socialmedia",
                onChanged: (value) { 
                
                   setState(() {
                     temblist = value;
                   });

                if(listlength <=value.length){
                  print('true');
                  if(value.last == 'Instagram'){
                      listlength=value.length;
                      setState(() {
                        insta =true;
                      });
                    }else if(value.last == 'Facebook'){
                       listlength=value.length;
                       setState(() {
                         face = true;
                       });
                    }else if(value.last == 'Whatsapp'){
                       listlength=value.length;
                       setState(() {
                         whats =true;
                       });
                    }else if(value.last == 'Twitter'){
                       listlength=value.length;
                       setState(() {
                         twitter= true;
                       });
                    }
                }else{
                  print('false');
                 
                 print(temblist);
                 print(controller.socialmedia);
                  dammy.clear();
                 for(int a =0;a<controller.socialmedia.length;a++){
                     dammy.add(controller.socialmedia[a]);
                 }
                  
                  for(int i=0;i<controller.socialmedia.length;i++){
                    for(int j = 0;j<temblist.length;j++){
                      if(controller.socialmedia[i]==temblist[j]){
                        dammy.remove(temblist[j]);
                        break;
                      }
                    }  
                  }
                  print(dammy);
                  for(int b =0;b<dammy.length;b++){
                    if(dammy[b]=='Instagram'){
                      listlength=value.length;
                        setState(() {
                        insta =false;
                      });
                    }else if(dammy[b]=="Facebook"){
                      listlength=value.length;
                         setState(() {
                         face = false;
                       });
                    }else if(dammy[b]=="Whatsapp"){
                      listlength=value.length;
                         setState(() {
                         whats =false;
                       });
                    }else if(dammy[b]=="Twitter"){
                      listlength=value.length;
                        setState(() {
                         twitter= false;
                       });
                    }
                  }
                }
                  
                      
                  controller.selectedoptionlist.value = value;
                  //controller.selectedOption.value;
                  controller.selectedoptionlist.value.forEach((element) {    
                    controller.selectedOption.value + " " + element;
                     
                  });
                },
                selectedValues: controller.selectedoptionlist.value,
                
              ),

              hight20,
              
              Obx(() => 
                 Column(
                  children: [
                    controller.type3profileImgPath.isEmpty?
                 CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                      child: IconButton(onPressed: (){controller.type3changeImage(context);}, icon: Icon(Icons.photo_camera_back,color:Colors.white,size: 30,)),                  
                    ):
                 InkWell(
                  onTap: () =>controller.type3changeImage(context) ,
                   child: CircleAvatar(
                        radius: 40,
                        backgroundImage:FileImage(File(controller.type3profileImgPath.value)),                    ),
                 ),
                  ],
                ),
              ),
                 
              
              hight8,
              const Text(
                "Upload Your Logo",
                style: TextStyle(color: btColor, fontSize: 13),
              ),
              hight46,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: btColor),
                      minimumSize: const Size(120, 40),
                      shape: const StadiumBorder(
                        side: BorderSide(color: btColor),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: btColor),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      debugPrint(controller.selectedoptionlist as String);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: btColor),
                        minimumSize: const Size(120, 40),
                        shape: const StadiumBorder(
                            side: BorderSide(color: btColor))),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: btColor),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
