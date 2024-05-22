import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  // we will create a variable

  int a = 1;

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
            Image.asset('assets/images/salad2.png',width: width,height: height/2.5,fit: BoxFit.fill,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mediterranean',
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
        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
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
                      Text('\$28',style: AppWidgets.headlineTextStyle(),),
                    ],
                  ),
                  Container(
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
                ],
              ),
            ),



          ],
        ),
      ),

    );
  }
}
