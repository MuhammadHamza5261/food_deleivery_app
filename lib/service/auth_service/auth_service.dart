import 'package:firebase_auth/firebase_auth.dart';

class AuthService{


//   now we will create a firebase instance
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//  we will create a method

 Future<User?> authMethod(String email, String password) async{

    try{

      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );

      return userCredential.user;

    }
        catch(e){

        throw Exception('Something went wrong');

        }

 }

}