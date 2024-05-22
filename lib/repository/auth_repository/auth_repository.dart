import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_deleviery_app/service/auth_service/auth_service.dart';

class AuthRepository{

  // use the service
  AuthService authService = AuthService();

  // create a method
  Future<User?> authRepository({required String email, required String password}) async{

    User? user = await authService.authMethod(email, password);
     return user;

}

}