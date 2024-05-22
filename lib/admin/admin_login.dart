import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/widgtes_support.dart';
import 'admin_home_screen.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height/2),
              padding:  EdgeInsets.only(top: 45.0,left: 20.0,right: 20.0),
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 53, 51, 51),
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(width, 110.0),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 30.0,right: 30.0,top: 60.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Let's start with\nAdmin!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: height/2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20,top: 5.0,bottom: 5.0),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(255, 160, 160, 147,),
                                  ),
                                  borderRadius:  BorderRadius.circular(10),

                                ),
                              child: Center(
                                child: TextFormField(

                                  cursorColor: Colors.black54,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,

                                    hintText: 'Username',
                                    hintStyle: AppWidgets.semiBoldTextStyle(),
                                    prefixIcon: const Icon(Icons.email_outlined),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20,top: 5.0,bottom: 5.0),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 160, 160, 147,),
                                ),
                                borderRadius:  BorderRadius.circular(10),

                              ),
                              child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.black54,
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: AppWidgets.semiBoldTextStyle(),
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            GestureDetector(
                              onTap: (){
                                loginAdmin();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                margin: EdgeInsets.symmetric(horizontal: 12.0),
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                child: const Center(
                                  child:
                                  Text(
                                    'LogIn',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }

//   create a login Method

loginAdmin(){

    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) => {

      snapshot.docs.forEach((result) {

        if(result.data()['id']!= nameController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               backgroundColor: Colors.orangeAccent,
              content: Center(
                child: Text("Your id is not correct",
                  style: TextStyle(
                    fontSize: 18.0,
                ),),
              )
          ),
          );
        }

       else if(result.data()['password']!= passwordController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Center(
                child: Text("Your password is not correct",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),),
              )
          ),
          );
        }

         else{

           Route route = MaterialPageRoute(builder: (context)=> const AdminHomeScreen());
           Navigator.pushReplacement(context, route);

        }

      }),
    });


}


}
