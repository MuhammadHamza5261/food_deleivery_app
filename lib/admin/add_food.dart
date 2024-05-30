import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';



class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {

   final List<String> items = [
     'Ice-cream',
     'Burger',
     'Salad',
     'Pizza',
   ];

   String? value;

  final _itemName = TextEditingController();
  final _itemPrice = TextEditingController();
  final _itemDetail = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  //  Get Image method
  Future getImage() async{

    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      selectedImage = File(image!.path);
    }
    setState(() {

    });

   }

   // upload item method

   uploadItem(){

    if(selectedImage!= null && _itemName.text!= "" && _itemPrice.text!="" && _itemDetail.text!= ""){
      String addId  = randomAlphaNumeric(10);

      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addId);

    }
   }













  @override
  Widget build(BuildContext context) {

    // add media query

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0XFF373866),
            ),
        ),
        title: Text("Add Item",
          style: AppWidgets.headlineTextStyle(),
        ),
      ),
       body: SingleChildScrollView(
         child: Container(
           margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "Upload the Item Picture",
                 style: AppWidgets.semiBoldTextStyle(),
               ),
              const SizedBox(
                 height: 20.0,
               ),
              selectedImage == null ? GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Center(
                   child: Material(
                     elevation: 4.0,
                     borderRadius: BorderRadius.circular(20.0),
                     child: Container(
                       width: 150,
                       height: 150,
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.black,width: 1.5),
                         borderRadius: BorderRadius.circular(20),
                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                         child: Image.file(
                           selectedImage!,
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),

                   ),
                 ),
              ):
              const SizedBox(
                 height: 30.0,
               ),
               Text(
                 'Item Name',
                 style: AppWidgets.semiBoldTextStyle(),
               ),
              const SizedBox(
                 height: 10,
               ),
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: const Color(0xFFececf8),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: TextFormField(
                   controller: _itemName,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Enter a item name',
                     hintStyle: AppWidgets.lightTextStyle(),
                   ),
                 ),
               ),
               const SizedBox(
                 height: 30.0,
               ),
               Text(
                 'Item Price',
                 style: AppWidgets.semiBoldTextStyle(),
               ),
               const SizedBox(
                 height: 10,
               ),
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: const Color(0xFFececf8),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: TextFormField(
                   controller: _itemPrice,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Enter a item Price',
                     hintStyle: AppWidgets.lightTextStyle(),
                   ),
                 ),
               ),
               const SizedBox(
                 height: 30.0,
               ),
               Text(
                 'Item Detail',
                 style: AppWidgets.semiBoldTextStyle(),
               ),
               const SizedBox(
                 height: 10,
               ),
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   color: const Color(0xFFececf8),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: TextFormField(
                   maxLines: 5,
                   controller: _itemDetail,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Enter a item Detail',
                     hintStyle: AppWidgets.lightTextStyle(),
                   ),
                 ),
               ),
           Text("Select Category",
               style: AppWidgets.semiBoldTextStyle(),
           ),
          const SizedBox(
             height: 20.0,
           ),
           Container(
             width: MediaQuery.of(context).size.width,
             decoration: const BoxDecoration(color: Color(0xFFececf8),),
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: DropdownButtonHideUnderline(
               child: DropdownButton<String>(
                 items: items.map((item) {
                   return DropdownMenuItem<String>(
                     value: item,
                     child: Text(
                       item,
                       style: const TextStyle(
                         fontSize: 18.0,
                         color: Colors.black,
                       ),
                     ),
                   );
                 }).toList(),
                 onChanged: (value) {
                   setState(() {
                     this.value = value;
                   });
                 },
                 dropdownColor: Colors.white,
                 hint: const Text("Select Category"),
                 iconSize: 36,
                 icon: const Icon(
                   Icons.arrow_drop_down,
                   color: Colors.black,
                 ),
                 value: value,
               ),
             ),
           ),
               SizedBox(
                 height: 30.0,
               ),
               Center(
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 5,),
                   decoration: BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: const Center(
                     child: Text("Add",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),




           ],
           ),
         ),
       ),
    );
  }
}
