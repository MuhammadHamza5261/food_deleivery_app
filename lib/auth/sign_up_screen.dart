import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_deleviery_app/auth/login_screen.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_event.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_state.dart';
import 'package:food_deleviery_app/database/database_method.dart';
import 'package:food_deleviery_app/shared_preferences/shared_pref.dart';
import 'package:random_string/random_string.dart';
import '../custom_widgets/bottom_nav_bar.dart';
import '../screens/home_screen.dart';
import '../widgets/widgtes_support.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc,AuthState>(
        builder: (context,state){
          return Form(
            key: _formkey,
            child: Stack(
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
                  child: Column(
                    children: [
                      Center(child: Image.asset('assets/images/logo (1).png',width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
                      const SizedBox(
                        height: 40,
                      ),

                      Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/1.8,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text('Sign up',style: AppWidgets.headlineTextStyle(),),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidgets.semiBoldTextStyle(),
                                  prefixIcon: const Icon(Icons.person_outlined),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
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


                              const SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: (){
                                  BlocProvider.of<AuthBloc>(context).add(
                                    SignUpDataEvent(
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
                                        color:  const Color(0Xffff5722),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                      child: state is SignUpProgressState?
                                          const Center(child: CircularProgressIndicator(),):
                                      const Text('SIGN UP',
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
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));


                        },
                        child: Text("Already have an account? Login",
                          style: AppWidgets.semiBoldTextStyle().copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
        listener: (context,state) async{
          if(state is SignUpDataIsLoadedState){

            String  id = randomAlphaNumeric(10);
            Map<String, dynamic> addUserInfo = {
              "Name": nameController.text,
              "Email": emailController.text,
              "Wallet": id,
            };
            await DataBaseMethods().addUserDetail(addUserInfo, id);

            /// save values in shared preference
            await SharedPreferenceHelper().saveUserName(nameController.text);
            await SharedPreferenceHelper().saveUserEmail(emailController.text);
            await SharedPreferenceHelper().saveUserWallet('0');
            await SharedPreferenceHelper().saveUserId(id);


            Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar()));
            // String  id = randomAlphaNumeric(10);
            // Map<String, dynamic> addUserInfo = {
            //   "Name": nameController.text,
            //   "Email": emailController.text,
            //   "Wallet": id,
            // };
          }

          
          else if(state is SignUpErrorState){
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
