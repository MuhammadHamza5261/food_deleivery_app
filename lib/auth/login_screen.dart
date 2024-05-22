import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_deleviery_app/auth/forgot_password.dart';
import 'package:food_deleviery_app/auth/sign_up_screen.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_event.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_state.dart';
import 'package:food_deleviery_app/custom_widgets/bottom_nav_bar.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formkey =  GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc,AuthState>(
        builder: (context,state){
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height /2.5),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Text(""),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 65),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Center(child: Image.asset('assets/images/logo (1).png',width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
                      const SizedBox(
                        height: 60,
                      ),

                      Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text('Login',style: AppWidgets.headlineTextStyle(),),
                              const SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidgets.semiBoldTextStyle(),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidgets.semiBoldTextStyle(),
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                                },
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text('Forgot Password?',style: AppWidgets.semiBoldTextStyle(),)),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              GestureDetector(
                                onTap: (){
                                  BlocProvider.of<AuthBloc>(context).add(
                                    SignInDataEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                  if(_formkey.currentState!.validate()){
                                    setState(() {});
                                  }

                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: width*0.5,
                                    decoration: BoxDecoration(
                                        color: Color(0Xffff5722),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                      child:
                                          state is SignInProgressState ? Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ):

                                      Text('LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                        },
                        child: Text("Don't have an account? Sign up",
                          style: AppWidgets.semiBoldTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          );
        },
        listener: (context,state){

          if(state is SignInDataIsLoadedState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar()));
          }

          else if (state is SignInErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                  content: Text(state.errorMessage),
              ),

            );
          }

        }

      ),

    );
  }
}
