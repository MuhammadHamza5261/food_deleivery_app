// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:food_deleviery_app/database/database_method.dart';
// import 'package:food_deleviery_app/widgets/widgtes_support.dart';
//
// import 'detail_Screen.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   //  create a bool type variable
//   bool iceCream = false, pizza = false, salad = false, burger = false;
//
//   Stream? foodItemStream;
//
//   onTheLoad() async{
//      foodItemStream = await DataBaseMethods().getFoodItem("Pizza");
//      setState(() {
//
//      });
//   }
//
//
//
//   @override
//   void initState() {
//     // call the method on init State
//     onTheLoad();
//     super.initState();
//   }
//
//   Widget allItems() {
//     return StreamBuilder( stream: foodItemStream, builder: (context, AsyncSnapshot snapshot){
//     return snapshot.hasData? ListView.builder(
//       padding: EdgeInsets.zero,
//         itemCount: snapshot.data.docs.length,
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context,index){
//         DocumentSnapshot ds = snapshot.data.docs[index];
//         return GestureDetector(
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
//           },
//           child: Container(
//             margin: EdgeInsets.all(4),
//             child: Material(
//               elevation: 5.0,
//               borderRadius: BorderRadius.circular(20),
//               child: Container(
//                 padding: EdgeInsets.all(14),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(
//                       ds["Image"],
//                       height: 150,width: 150,),
//                     Text(ds["Name"],
//                       style: AppWidgets.semiBoldTextStyle(),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text('Fresh and Healthy',
//                       style: AppWidgets.lightTextStyle(),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text('\$'+ds["Price"],
//                       style: AppWidgets.boldTextStyle(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//
//     }): CircularProgressIndicator(color: Colors.blue,);
//
//
//     },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 50),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Hello Hamza',
//                     style: AppWidgets.boldTextStyle(),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                     child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
//                   ),
//                 ],
//               ),
//              const SizedBox(
//                 height: 20.0,
//               ),
//               Text('Delicious Food',
//                 style: AppWidgets.headlineTextStyle(),
//               ),
//               Text('Discover and Get Great Food',
//                 style: AppWidgets.lightTextStyle(),
//               ),
//             SizedBox(
//               height: 20,
//             ),
//               showItem(),
//               // add images
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 270,
//                   child: allItems()
//               ),
//               // SingleChildScrollView(
//               //   scrollDirection: Axis.horizontal,
//               //   child: Row(
//               //     children: [
//               //       GestureDetector(
//               //         onTap: (){
//               //           Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
//               //         },
//               //         child: Container(
//               //           margin: EdgeInsets.all(4),
//               //           child: Material(
//               //             elevation: 5.0,
//               //             borderRadius: BorderRadius.circular(20),
//               //             child: Container(
//               //               padding: EdgeInsets.all(14),
//               //               child: Column(
//               //                 crossAxisAlignment: CrossAxisAlignment.start,
//               //                 children: [
//               //                   Image.asset('assets/images/salad2.png',height: 150,width: 150,),
//               //                   Text('Veggie Taco Hash',
//               //                     style: AppWidgets.semiBoldTextStyle(),
//               //                   ),
//               //                   SizedBox(
//               //                     height: 5,
//               //                   ),
//               //                   Text('Fresh and Healthy',
//               //                     style: AppWidgets.lightTextStyle(),
//               //                   ),
//               //                   SizedBox(
//               //                     height: 5,
//               //                   ),
//               //                   Text('\$25',
//               //                     style: AppWidgets.boldTextStyle(),
//               //                   ),
//               //                 ],
//               //               ),
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //       SizedBox(
//               //         width: 15,
//               //       ),
//               //       Container(
//               //         margin: EdgeInsets.all(4),
//               //         child: Material(
//               //           elevation: 5.0,
//               //           borderRadius: BorderRadius.circular(20),
//               //           child: Container(
//               //             padding: EdgeInsets.all(14),
//               //             child: Column(
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 Image.asset('assets/images/salad2.png',height: 150,width: 150,),
//               //                 Text('Mix Veg Salad',
//               //                   style: AppWidgets.semiBoldTextStyle(),
//               //                 ),
//               //                 SizedBox(
//               //                   height: 5,
//               //                 ),
//               //                 Text('Spicy with Onion',
//               //                   style: AppWidgets.lightTextStyle(),
//               //                 ),
//               //                 SizedBox(
//               //                   height: 5,
//               //                 ),
//               //                 Text('\$28',
//               //                   style: AppWidgets.boldTextStyle(),
//               //                 ),
//               //               ],
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               //
//               SizedBox(
//                 height: 30,
//               ),
//               Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   padding: EdgeInsets.all(5),
//                   child: Row(
//                     children: [
//                       Image.asset('assets/images/salad2.png',
//                         height: 120,
//                         width: 120,
//                         fit: BoxFit.cover,
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child:  Text('Mediterranean Chickpea Salad',
//                               style: AppWidgets.boldTextStyle(),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child:  Text('Honey goot Cheese',
//                               style: AppWidgets.lightTextStyle(),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child:  Text('\$28',
//                               style: AppWidgets.boldTextStyle(),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// //   create a separate widget
// Widget showItem(){
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // icecream
//         GestureDetector(
//           onTap: (){
//             iceCream= true;
//             pizza=false;
//             salad=false;
//             burger=false;
//             setState(() {
//
//             });
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//
//             child: Container(
//               decoration: BoxDecoration(
//                   color: iceCream?Colors.black:Colors.white,
//                   borderRadius: BorderRadius.circular(10)
//               ),
//               padding: EdgeInsets.all(10),
//               child: Image.asset(
//                 'assets/images/ice-cream.png',
//                 height: 40,width: 40,
//                 fit: BoxFit.cover,
//                 color: iceCream? Colors.white:Colors.black,
//               ),
//             ),
//           ),
//         ),
//         //pizza
//         GestureDetector(
//           onTap: (){
//             iceCream= false;
//             pizza=true;
//             salad=false;
//             burger=false;
//             setState(() {
//
//             });
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//
//             child: Container(
//               decoration: BoxDecoration(
//                   color: pizza?Colors.black:Colors.white,
//                   borderRadius: BorderRadius.circular(10)
//               ),
//               padding: EdgeInsets.all(10),
//               child: Image.asset(
//                 'assets/images/pizza (1).png',
//                 height: 40,width: 40,
//                 fit: BoxFit.cover,
//                 color: pizza? Colors.white:Colors.black,
//               ),
//             ),
//           ),
//         ),
//         // salad
//         GestureDetector(
//           onTap: (){
//             iceCream= false;
//             pizza = false;
//             salad = true;
//             burger = false;
//             setState(() {
//
//             });
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//
//             child: Container(
//               decoration: BoxDecoration(
//                   color: salad?Colors.black:Colors.white,
//                   borderRadius: BorderRadius.circular(10)
//               ),
//               padding: EdgeInsets.all(10),
//               child: Image.asset(
//                 'assets/images/salad (1).png',
//                 height: 40,width: 40,
//                 fit: BoxFit.cover,
//                 color: salad? Colors.white:Colors.black,
//               ),
//             ),
//           ),
//         ),
//         // burger
//         GestureDetector(
//           onTap: (){
//             iceCream= false;
//             pizza=false;
//             salad=false;
//             burger=true;
//             setState(() {
//
//             });
//           },
//           child: Material(
//             elevation: 5,
//             borderRadius: BorderRadius.circular(10),
//
//             child: Container(
//               decoration: BoxDecoration(
//                   color: burger ?Colors.black:Colors.white,
//                   borderRadius: BorderRadius.circular(10)
//               ),
//               padding: EdgeInsets.all(10),
//               child: Image.asset(
//                 'assets/images/burger.png',
//                 height: 40,width: 40,
//                 fit: BoxFit.cover,
//                 color: burger? Colors.white:Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
// }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_deleviery_app/admin/admin_login.dart';
import 'package:food_deleviery_app/database/database_method.dart';
import 'package:food_deleviery_app/shared_preferences/shared_pref.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';

import 'detail_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String? name;

  getTheSharedPreference() async{
    name = await SharedPreferenceHelper().getUserName();
  }

  getUserName() async{
    await getTheSharedPreference();
    setState(() {

    });
  }




  // create a bool type variable
  bool iceCream = true, pizza = false, salad = false, burger = false;

  Stream? foodItemStream;

  onTheLoad(String category) async {
    foodItemStream = await DataBaseMethods().getFoodItem(category);
    setState(() {});
  }

  @override
  void initState() {
    getUserName();
    // call the method on init State

    onTheLoad("Burger");
    onTheLoad("Salad");
    onTheLoad("Pizza");
    onTheLoad("Ice-cream");

    super.initState();
  }

  // all items horizontally
  Widget allItems() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailScreen(
                      detail: ds["Detail"],
                      name: ds["Name"],
                      image: ds["Image"],
                      price: ds["Price"],
                    ),
                    ),
                );

              },
              child: Container(
                margin: const EdgeInsets.all(4),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            ds["Image"],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          ds["Name"],
                          style: AppWidgets.semiBoldTextStyle(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Fresh and Healthy',
                          style: AppWidgets.lightTextStyle(),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '\$' + ds["Price"],
                          style: AppWidgets.boldTextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // all items vertically
  Widget allItemsVertically() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailScreen(
                    detail: ds["Detail"],
                    name: ds["Name"],
                    image: ds["Image"],
                    price: ds["Price"],
                  ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(4),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Image.network( ds["Image"],
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(ds["Name"],
                                style: AppWidgets.boldTextStyle(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'Honey goot Cheese',
                                style: AppWidgets.lightTextStyle(),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                '\$'+ds["Price"],
                                style: AppWidgets.boldTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hello ',
                          style: AppWidgets.boldTextStyle().copyWith(color: Colors.red),
                        ),
                        TextSpan(
                          text: name,
                          style: AppWidgets.boldTextStyle().copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const AdminLogin()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Delicious Food',
                style: AppWidgets.headlineTextStyle(),
              ),
              Text(
                'Discover and Get Great Food',
                style: AppWidgets.lightTextStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              showItem(),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 270,
                  child: allItems(),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 270,
                  child: allItemsVertically()),
              // Material(
              //   elevation: 5,
              //   borderRadius: BorderRadius.circular(20),
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           'assets/images/salad2.png',
              //           height: 120,
              //           width: 120,
              //           fit: BoxFit.cover,
              //         ),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               width: MediaQuery.of(context).size.width / 2,
              //               child: Text(
              //                 'Mediterranean Chickpea Salad',
              //                 style: AppWidgets.boldTextStyle(),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Container(
              //               width: MediaQuery.of(context).size.width / 2,
              //               child: Text(
              //                 'Honey goot Cheese',
              //                 style: AppWidgets.lightTextStyle(),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Container(
              //               width: MediaQuery.of(context).size.width / 2,
              //               child: Text(
              //                 '\$28',
              //                 style: AppWidgets.boldTextStyle(),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // create a separate widget
  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ice cream
        GestureDetector(
          onTap: () async {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
             foodItemStream = await  DataBaseMethods().getFoodItem("Ice-cream");
             setState(() {

             });

            // onTheLoad("IceCream");
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: iceCream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/ice-cream.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: iceCream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        // pizza
        GestureDetector(
          onTap: () async {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            foodItemStream = await  DataBaseMethods().getFoodItem("Pizza");
            setState(() {

            });
            // onTheLoad("Pizza");
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/pizza (1).png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        // salad
        GestureDetector(
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            foodItemStream = await  DataBaseMethods().getFoodItem("Salad");
            setState(() {

            });
            // onTheLoad("Salad");
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/salad (1).png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        // burger
        GestureDetector(
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            foodItemStream = await  DataBaseMethods().getFoodItem("Burger");
            setState(() {

            });
            // onTheLoad("Burger");
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/burger.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
