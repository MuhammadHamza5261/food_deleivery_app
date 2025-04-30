import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_deleviery_app/auth/forgot_password.dart';
import 'package:food_deleviery_app/auth/sign_up_screen.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_event.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_state.dart';
import 'package:food_deleviery_app/custom_widgets/bottom_nav_bar.dart';
import 'package:food_deleviery_app/database/database_method.dart';
import 'package:food_deleviery_app/shared_preferences/shared_pref.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// class _LoginScreenState extends State<LoginScreen> {
//
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   final _formkey =  GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     emailController.clear();
//     passwordController.clear();
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: BlocConsumer<AuthBloc,AuthState>(
//         builder: (context,state){
//           return Stack(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height/2,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xFFff5c30),
//                       Color(0xFFe74b1a),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: MediaQuery.of(context).size.height /2.5),
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: const Text(""),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 65),
//                 child: Form(
//                   key: _formkey,
//                   child: Column(
//                     children: [
//                       Center(child: Image.asset('assets/images/logo (1).png',width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
//                       const SizedBox(
//                         height: 60,
//                       ),
//
//                       Material(
//                         elevation: 8.0,
//                         borderRadius: BorderRadius.circular(20),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height/2,
//                           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 30.0,
//                               ),
//                               Text('Login',style: AppWidgets.headlineTextStyle(),),
//                               const SizedBox(
//                                 height: 10.0,
//                               ),
//                               TextFormField(
//                                 controller: emailController,
//                                 decoration: InputDecoration(
//                                   hintText: 'Email',
//                                   hintStyle: AppWidgets.semiBoldTextStyle(),
//                                   prefixIcon: const Icon(Icons.email_outlined),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 30.0,
//                               ),
//                               TextFormField(
//                                 controller: passwordController,
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                   hintText: 'Password',
//                                   hintStyle: AppWidgets.semiBoldTextStyle(),
//                                   prefixIcon: const Icon(Icons.password_outlined),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               GestureDetector(
//                                 onTap: (){
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
//                                 },
//                                 child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Text('Forgot Password?',style: AppWidgets.semiBoldTextStyle(),)),
//                               ),
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               GestureDetector(
//                                 onTap: (){
//                                   BlocProvider.of<AuthBloc>(context).add(
//                                     SignInDataEvent(
//                                       email: emailController.text,
//                                       password: passwordController.text,
//                                     ),
//                                   );
//                                   if(_formkey.currentState!.validate()){
//                                     setState(() {
//                                       emailController.clear();
//                                       passwordController.clear();
//                                     });
//                                   }
//
//                                 },
//                                 child: Material(
//                                   elevation: 5.0,
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                                     width: width*0.5,
//                                     decoration: BoxDecoration(
//                                         color: const Color(0Xffff5722),
//                                         borderRadius: BorderRadius.circular(20)
//                                     ),
//                                     child: Center(
//                                       child:
//                                           state is SignInProgressState ?
//                                           const Center(
//                                             child: SpinKitFadingCircle(
//                                               color: Colors.white,
//                                             ),
//                                           ):
//
//                                       const Text('LOGIN',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontFamily: 'Poppins',
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 60,
//                       ),
//                       GestureDetector(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
//                         },
//                         child: Text("Don't have an account? Sign up",
//                           style: AppWidgets.semiBoldTextStyle(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           );
//         },
//         listener: (context,state) async{
//
//           if(state is SignInDataIsLoadedState){
//             // await SharedPreferenceHelper().saveUserName(emailController.text);
//
//
//             await SharedPreferenceHelper().saveUserEmail(emailController.text);
//
//             await SharedPreferenceHelper.setLoginStatus(true);
//
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar()));
//           }
//
//           else if (state is SignInErrorState){
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: Colors.red,
//                   content: Text(state.errorMessage),
//               ),
//
//             );
//           }
//
//         }
//
//       ),
//
//     );
//   }
// }
class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is SignInDataIsLoadedState) {
              final userData = await DataBaseMethods().getUserByEmail(emailController.text);

              if (userData != null) {
                final String name = userData['Name'] ?? '';

                await SharedPreferenceHelper.saveUser(
                  name: name,
                  email: emailController.text,
                );

                await SharedPreferenceHelper.setLoginStatus(true);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavBar()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('User data not found'),
                  ),
                );
              }
            }
          },
        builder: (context, state) {
          return Stack(
            children: [
              // Background Gradient
              Container(
                width: width,
                height: height / 2,
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

              // White bottom container
              Container(
                margin: EdgeInsets.only(top: height / 2.5),
                height: height / 2,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),

              // Form content
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 65),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      // Logo
                      Center(
                        child: Image.asset(
                          'assets/images/logo (1).png',
                          width: width / 1.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 60),

                      // Form Card
                      Material(
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          width: width,
                          height: height / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 30.0),
                              Text('Login', style: AppWidgets.headlineTextStyle()),
                              const SizedBox(height: 10.0),

                              // Email input
                              TextFormField(
                                controller: emailController,
                                validator: (val) =>
                                val!.isEmpty || !val.contains('@') ? "Enter a valid email" : null,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidgets.semiBoldTextStyle(),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                ),
                              ),
                              const SizedBox(height: 30.0),

                              // Password input
                              TextFormField(
                                obscureText: _obscureText,
                                controller: passwordController,

                                validator: (val) =>
                                val!.length < 6 ? "Password must be 6+ characters" : null,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: AppWidgets.semiBoldTextStyle(),
                                  prefixIcon: const Icon(Icons.password_outlined),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Forgot Password link
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text('Forgot Password?', style: AppWidgets.semiBoldTextStyle()),
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Login Button
                              GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      SignInDataEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  }
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    width: width * 0.5,
                                    decoration: BoxDecoration(
                                      color: const Color(0Xffff5722),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: state is SignInProgressState
                                          ? const Center(
                                        child: SpinKitFadingCircle(
                                          color: Colors.white,
                                        ),
                                      )
                                          : const Text(
                                        'LOGIN',
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

                      // Sign up redirect
                      const SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                        },
                        child: Text(
                          "Don't have an account? Sign up",
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
        // listener: (context, state) async {
        //   if (state is SignInDataIsLoadedState) {
        //     // Save user data in SharedPreferences
        //     await SharedPreferenceHelper().saveUserEmail(emailController.text);
        //     // await SharedPreferenceHelper().saveUserName(nam.text);
        //     await SharedPreferenceHelper.setLoginStatus(true);
        //
        //     // Navigate to the main screen (BottomNavBar)
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(builder: (context) => const BottomNavBar()),
        //     );
        //   } else if (state is SignInErrorState) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         backgroundColor: Colors.red,
        //         content: Text(state.errorMessage),
        //       ),
        //     );
        //   }
        // },



      ),
    );
  }
}

