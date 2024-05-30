import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deleviery_app/admin/add_food.dart';
import 'package:food_deleviery_app/widgets/widgtes_support.dart';


class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 65),
        child: Column(
          children: [
            Center(
              child: Text('Home Admin',
                style: AppWidgets.headlineTextStyle(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFoodScreen()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            "assets/images/wallet.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        const Text(
                          "Add Food Items",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
