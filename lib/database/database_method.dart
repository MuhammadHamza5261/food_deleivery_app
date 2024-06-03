import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods{

  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async{
    return await  FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);

  }

//   create a update method

  updateUserWallet(String id,String amount) async{
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Wallet":amount});
  }

//   create a image save method in storage firebase
  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async{
    return await  FirebaseFirestore.instance
        .collection(name)
        .add(userInfoMap);

  }


  Future<Stream<QuerySnapshot>> getFoodItem(String name) async{

    return await FirebaseFirestore.instance.collection(name).snapshots();

  }

  /// add food to cart function

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async{
    return await  FirebaseFirestore.instance
        .collection('users')
        .doc(id).collection("Cart")
        .add(userInfoMap);

  }


 Future<Stream<QuerySnapshot>> getFoodCart(String id) async{
    return await FirebaseFirestore.instance.collection("users").doc(id).collection("Cart").snapshots();

  }








}