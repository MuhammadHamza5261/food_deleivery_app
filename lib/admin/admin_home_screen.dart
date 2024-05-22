import 'package:flutter/material.dart';
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
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            Center(
              child: Text('Home Admin',
                style: AppWidgets.headlineTextStyle(),
              ),
            ),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(4),
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}
