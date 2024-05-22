import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';

import 'detail_Screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //  create a bool type variable
  bool iceCream = false, pizza = false, salad = false, burger = false;


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello Hamza',
                    style: AppWidgets.boldTextStyle(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  ),
                ],
              ),
             const SizedBox(
                height: 20.0,
              ),
              Text('Delicious Food',
                style: AppWidgets.headlineTextStyle(),
              ),
              Text('Discover and Get Great Food',
                style: AppWidgets.lightTextStyle(),
              ),
            SizedBox(
              height: 20,
            ),
              showItem(),
              // add images
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/salad2.png',height: 150,width: 150,),
                                Text('Veggie Taco Hash',
                                  style: AppWidgets.semiBoldTextStyle(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Fresh and Healthy',
                                  style: AppWidgets.lightTextStyle(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('\$25',
                                  style: AppWidgets.boldTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/salad2.png',height: 150,width: 150,),
                              Text('Mix Veg Salad',
                                style: AppWidgets.semiBoldTextStyle(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Spicy with Onion',
                                style: AppWidgets.lightTextStyle(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('\$28',
                                style: AppWidgets.boldTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Image.asset('assets/images/salad2.png',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child:  Text('Mediterranean Chickpea Salad',
                              style: AppWidgets.boldTextStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child:  Text('Honey goot Cheese',
                              style: AppWidgets.lightTextStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child:  Text('\$28',
                              style: AppWidgets.boldTextStyle(),
                            ),
                          ),
        
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }

//   create a separate widget
Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // icecream
        GestureDetector(
          onTap: (){
            iceCream= true;
            pizza=false;
            salad=false;
            burger=false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: iceCream?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/ice-cream.png',
                height: 40,width: 40,
                fit: BoxFit.cover,
                color: iceCream? Colors.white:Colors.black,
              ),
            ),
          ),
        ),
        //pizza
        GestureDetector(
          onTap: (){
            iceCream= false;
            pizza=true;
            salad=false;
            burger=false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: pizza?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/pizza (1).png',
                height: 40,width: 40,
                fit: BoxFit.cover,
                color: pizza? Colors.white:Colors.black,
              ),
            ),
          ),
        ),
        // salad
        GestureDetector(
          onTap: (){
            iceCream= false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: salad?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/salad (1).png',
                height: 40,width: 40,
                fit: BoxFit.cover,
                color: salad? Colors.white:Colors.black,
              ),
            ),
          ),
        ),
        // burger
        GestureDetector(
          onTap: (){
            iceCream= false;
            pizza=false;
            salad=false;
            burger=true;
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: burger ?Colors.black:Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/burger.png',
                height: 40,width: 40,
                fit: BoxFit.cover,
                color: burger? Colors.white:Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
}
}
