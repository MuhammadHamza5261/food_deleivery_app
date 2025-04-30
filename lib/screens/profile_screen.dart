import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_deleviery_app/auth/login_screen.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import '../auth_screen/auth.dart';
import '../shared_preferences/shared_pref.dart';


// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//
//   SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
//
//   String? profile, name, email;
//   final ImagePicker _picker = ImagePicker();
//   File? selectedImage;
//
//   Future getImage() async {
//     var image = await _picker.pickImage(source: ImageSource.gallery);
//
//     selectedImage = File(image!.path);
//     setState(() {
//       uploadItem();
//     });
//   }
//
//   uploadItem() async {
//     if (selectedImage != null) {
//
//       String addId = randomAlphaNumeric(10);
//
//       Reference firebaseStorageRef =
//       FirebaseStorage.instance.ref().child("blogImages").child(addId);
//       final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
//
//       var downloadUrl = await (await task).ref.getDownloadURL();
//       await SharedPreferenceHelper().saveUserProfile(downloadUrl);
//       setState(() {
//
//       });
//     }
//   }
//
//   getTheSharedPref() async {
//
//     profile = await SharedPreferenceHelper().getUserProfile();
//     name = await SharedPreferenceHelper().getUserName();
//     email = await SharedPreferenceHelper().getUserEmail();
//     setState(() {});
//
//   }
//
//   onThisLoad() async {
//     await getTheSharedPref();
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     onThisLoad();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: name ==null ?
//       const Center(
//           child: SpinKitFadingCircle(
//             color: Colors.red,
//           )
//       ): Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
//                 height: MediaQuery.of(context).size.height / 4.3,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.vertical(
//                         bottom: Radius.elliptical(
//                             MediaQuery.of(context).size.width, 105.0,
//                         ),
//                     ),
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height / 6.5),
//                   child: Material(
//                     elevation: 10.0,
//                     borderRadius: BorderRadius.circular(60),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(60),
//                       child: selectedImage==null?  GestureDetector(
//                         onTap: (){
//                           getImage();
//                         },
//                         child: profile==null? Image.asset(
//                           "assets/images/boy.jpg",
//                           height: 120,
//                           width: 120,
//                           fit: BoxFit.cover,
//                         ) :Image.network(
//                           profile!,
//                           height: 120,
//                           width: 120,
//                           fit: BoxFit.cover,
//                         ),
//                       ): Image.file(selectedImage!,  height: 120,
//                         width: 120,
//                         fit: BoxFit.cover,),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 70.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       name!,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 23.0,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Material(
//               borderRadius: BorderRadius.circular(10),
//               elevation: 2.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15.0,
//                   horizontal: 10.0,
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.person,
//                       color: Colors.black,
//                     ),
//                     const SizedBox(
//                       width: 20.0,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Name",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           SharedPreferenceHelper().getUserName().toString(),
//
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30.0,
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Material(
//               borderRadius: BorderRadius.circular(10),
//               elevation: 2.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15.0,
//                   horizontal: 10.0,
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.email,
//                       color: Colors.black,
//                     ),
//                     const SizedBox(
//                       width: 20.0,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Email",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           SharedPreferenceHelper().getUserEmail().toString(),
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w600),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30.0,
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Material(
//               borderRadius: BorderRadius.circular(10),
//               elevation: 2.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15.0,
//                   horizontal: 10.0,
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Row(
//                   children: [
//                     Icon(
//                       Icons.description,
//                       color: Colors.black,
//                     ),
//                     SizedBox(
//                       width: 20.0,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Terms and Condition",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.w600),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30.0,
//           ),
//           GestureDetector(
//             onTap: (){
//               AuthMethods().deleteUser();
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Material(
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 2.0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 15.0,
//                     horizontal: 10.0,
//                   ),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Row(
//                     children: [
//                       Icon(
//                         Icons.delete,
//                         color: Colors.black,
//                       ),
//                       SizedBox(
//                         width: 20.0,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Delete Account",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30.0,
//           ),
//           GestureDetector(
//             onTap: (){
//               AuthMethods().signOut();
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Material(
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 2.0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 15.0,
//                     horizontal: 10.0,
//                   ),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Row(
//                     children: [
//                       Icon(
//                         Icons.logout,
//                         color: Colors.black,
//                       ),
//                       SizedBox(
//                         width: 20.0,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "LogOut",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? profile, name, email;
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    profile = await SharedPreferenceHelper().getUserProfile();
    setState(() {});
  }

  Future<void> _getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    selectedImage = File(image.path);
    setState(() {});
    await _uploadImage();
  }

  Future<void> _uploadImage() async {
    if (selectedImage == null) return;

    final addId = randomAlphaNumeric(10);
    final ref = FirebaseStorage.instance.ref().child("profileImages").child(addId);
    final task = ref.putFile(selectedImage!);
    final downloadUrl = await (await task).ref.getDownloadURL();

    await SharedPreferenceHelper().saveUserProfile(downloadUrl);
    profile = downloadUrl;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (name == null || email == null) {
      return const Scaffold(
        body: Center(
          child: SpinKitFadingCircle(color: Colors.red),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // Top Profile Banner with Image
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 45.0),
                height: screenHeight / 4.3,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(screenWidth, 105.0),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight / 6.5),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(60),
                    child: GestureDetector(
                      onTap: _getImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: selectedImage != null
                            ? Image.file(selectedImage!,
                            height: 120, width: 120, fit: BoxFit.cover)
                            : profile != null
                            ? Image.network(profile!,
                            height: 120, width: 120, fit: BoxFit.cover)
                            : Image.asset("assets/images/boy.jpg",
                            height: 120, width: 120, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Center(
                  child: Text(
                    name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30.0),
          _infoTile(icon: Icons.person, label: "Name", value: name ?? ""),
          const SizedBox(height: 20.0),
          _infoTile(icon: Icons.email, label: "Email", value: email ?? ""),
          const SizedBox(height: 20.0),
          _infoTile(
              icon: Icons.description,
              label: "Terms and Conditions",
              value: ""),
          const SizedBox(height: 20.0),

          // Delete Account
          GestureDetector(
            onTap: () {
              AuthMethods().deleteUser();
            },
            child: _infoTile(
                icon: Icons.delete, label: "Delete Account", value: ""),
          ),
          const SizedBox(height: 20.0),

          // Logout
          GestureDetector(
            onTap: () {
              _showLogoutDialog();
              // AuthMethods().signOut();
            },
            child: _infoTile(icon: Icons.logout, label: "Logout", value: ""),
          ),
        ],
      ),
    );
  }

  Widget _infoTile({required IconData icon, required String label, required String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  if (value.isNotEmpty)
                    Text(
                      value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _showLogoutDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(

            title:  Center(child: Text("Logout",style: AppWidgets.headlineTextStyle(),)),
            content:  Text("Are you sure you want to logout?",style: AppWidgets.lightTextStyle().copyWith(
                fontSize: 16
            ),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("No",style: AppWidgets.semiBoldTextStyle(
                    ).copyWith(fontSize: 14,
                        color: Colors.red)),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  const Color(0Xffff5722),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      onPressed: (){
                        SharedPreferenceHelper.clearLoginStatus();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                      child: Text("Yes",style: AppWidgets.semiBoldTextStyle().copyWith(
                          color: Colors.white,
                          fontSize: 14
                      ),)
                  ),
                ],
              ),

            ],

          );
        }
    );

  }
}
