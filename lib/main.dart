import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

main() {
  runApp(const Myhome());
}

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getxcontrol = firstscreencntrler();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Radio<int>(
                    groupValue: getxcontrol.radioGroupvalue.value,
                    onChanged: (value) {
                      getxcontrol.change(value);
                    },
                    value: 0,
                  ),
                  Radio<int>(
                    groupValue: getxcontrol.radioGroupvalue.value,
                    onChanged: (value) {
                      getxcontrol.change(value);
                    },
                    value: 1,
                  ),
                  Radio<int>(
                    groupValue: getxcontrol.radioGroupvalue.value,
                    onChanged: (value) {
                      getxcontrol.change(value);
                    },
                    value: 2,
                  ),
                ],
              );
            }),


            ElevatedButton(onPressed: ()async{
            await  getxcontrol.pickImage();
            }, child: Text("pick Image")),
            SizedBox(height: 10,),
            Obx(()=> 
            Container(height: 300,width: 300,
            child: Image.file(File(getxcontrol.image.value?.path??"")),)
            ),
            Obx(
              ()=> Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,  
                children: [ 
                Checkbox(value: getxcontrol.checkbox1.value, onChanged: (val){
              getxcontrol.check(val);
                }),
                Checkbox(value: getxcontrol.checkbox2.value, onChanged: (val){
              getxcontrol.check2(val);
                }),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

class firstscreencntrler extends GetxController {
  var radioGroupvalue = 0.obs;
  var image = Rx<XFile?>(null);
  var checkbox1= false.obs;
  var checkbox2 = false.obs;

  change(value) {
    radioGroupvalue.value = value;
  }

  check(val){
    checkbox1.value =val;
  }
  check2(val){
    checkbox2.value =val;
  }

    Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image.value = pickedImage;
    }
  }
}
