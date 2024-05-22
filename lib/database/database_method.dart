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



}