import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_deleviery_app/auth/login_screen.dart';
import 'package:food_deleviery_app/auth/sign_up_screen.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_event.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_state.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  final forgotPassword = TextEditingController();



  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<AuthBloc,AuthState>(
        builder: (context,state){
          return Column(
            children: [
              SizedBox(
                height: 70.0,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Password Recovery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Enter your mail",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: ListView(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white70, width: 2.0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                controller: forgotPassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle:
                                    TextStyle(fontSize: 18.0, color: Colors.white),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.white70,
                                      size: 30.0,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            GestureDetector(
                              onTap: (){
                                BlocProvider.of<AuthBloc>(context).add(ForgotDataEvent(
                                    forgotPassword: forgotPassword.text,
                                ),
                                );

                              },
                              child: Container(
                                width: 140,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  Center(
                                  child:
                                      state is ForgotPasswordProgressState ?
                                  Center(
                                    child: CircularProgressIndicator(color: Colors.blue,),
                                  ):

                                  Text(
                                    "Send Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    "Create",
                                    style: TextStyle(
                                        color: Color.fromARGB(225, 184, 166, 6),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ))),
            ],
          );
        },
        listener: (context,state){
          if(state is ForgotDataIsLoadedState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
          }

          else if(state is ForgotErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,

              )
            );
          }


        }
      ),
    );
  }
}