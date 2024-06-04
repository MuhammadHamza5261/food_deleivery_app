import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_deleviery_app/database/database_method.dart';
import 'package:food_deleviery_app/shared_preferences/shared_pref.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';
class DetailScreen extends StatefulWidget {

  String image, name , detail, price;
  DetailScreen({Key? key,
    required this.detail,
    required this.image,
    required this.name,
    required this.price}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  // we will create a variable

  int a = 1;
  int totalPrice = 0;
  String?  id;


  getTheSharedPreference() async{
    id = await SharedPreferenceHelper().getUserId();
    setState(() {

    });
  }

  onTheLoad() async{
    await getTheSharedPreference();
    setState(() {

    });

  }

  @override
  void initState() {
    onTheLoad();
    totalPrice = int.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.image,
              width: width,
              height: height/2.5,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                      style: AppWidgets.semiBoldTextStyle(),
                    ),
                    Text('Chickpea Salad',
                      style: AppWidgets.headlineTextStyle(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    if(a>1){
                      --a;
                      totalPrice = totalPrice-int.parse(widget.price);
                    }

                    setState(() {

                    });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.remove,color: Colors.white,),
                  ),
                ),
                Text(a.toString(),style: AppWidgets.semiBoldTextStyle(),),
                GestureDetector(
                  onTap: (){
                    ++a;
                    totalPrice = totalPrice+int.parse(widget.price);
                    setState(() {

                    });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                ),

              ],
            ),
        SizedBox(
          height: 20.0,
        ),
        Text(widget.detail,
          style: AppWidgets.lightTextStyle(),
        ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text('Deleviery Time',style: AppWidgets.semiBoldTextStyle(),),
                SizedBox(
                  width: 30.0,
                ),
                Icon(Icons.alarm,color: Colors.black54,),
                SizedBox(width: 5,),
                Text('30 min',style: AppWidgets.semiBoldTextStyle(),)
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price',style: AppWidgets.semiBoldTextStyle(),),
                      Text('\$'+totalPrice.toString(),
                        style: AppWidgets.headlineTextStyle(),),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async{

                      Map<String, dynamic> addFoodToCart = {
                        "Name": widget.name,
                        "Quantity": a.toString(),
                        "Total": totalPrice.toString(),
                        "Image": widget.image,
                      };

                      await DataBaseMethods().addFoodToCart(addFoodToCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                              content: Center(child: Text('Food added to cart')),
                          )
                      );




                    },
                    child: Container(
                      width: width/2,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: 16.0,fontFamily: 'Poppins')),
                          SizedBox(
                            width: 30.0,
                          ),
                          Container(

                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),

                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),
      ),

    );
  }
}
