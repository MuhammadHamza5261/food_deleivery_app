import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods{


  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    QuerySnapshot snapshot =
    await usersCollection.where("Email", isEqualTo: email).get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }









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