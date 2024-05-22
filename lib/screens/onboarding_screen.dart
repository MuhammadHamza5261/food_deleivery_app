// import 'package:flutter/material.dart';
// import 'package:food_deleviery_app/widgets/content_model.dart';
// import 'package:food_deleviery_app/widgets/widgtes_support.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//
//   const OnBoardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//
//   int currentIndex = 0;
//   late PageController _controller;
//
//   @override
//   void initState() {
//     _controller = PageController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       children: [
//         PageView.builder(
//           itemCount: contents.length,
//           controller: _controller,
//             onPageChanged: (int index){
//                setState(() {
//                  currentIndex = index;
//                });
//             },
//             itemBuilder: (_, i){
//               return Padding(
//                   padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     Image.asset(contents[i].image, height: 450, width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.fill,),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Text(contents[i].title,style: AppWidgets.semiBoldTextStyle(),),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(contents[i].description,style: AppWidgets.lightTextStyle(),),
//                   ],
//                 ),
//               );
//           }
//          ),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//             ],
//           ),
//
//
//
//         ),
//
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';

import '../auth/sign_up_screen.dart';
import '../widgets/content_model.dart';


class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 420,
                          width: MediaQuery.of(context).size.width ,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          contents[i].title,
                          style: AppWidgets.headlineTextStyle(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          contents[i].description,
                          style: AppWidgets.lightTextStyle(),
                        )
                      ],
                    ),
                  );
                }),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              }
              _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contents.length - 1?"Start": "Next",
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }
}
