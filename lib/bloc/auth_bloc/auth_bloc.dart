import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_event.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_state.dart';
import 'package:food_deleviery_app/repository/auth_repository/auth_repository.dart';




class AuthBloc extends Bloc<AuthEvent,AuthState>{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//  use the repository
AuthRepository authRepository = AuthRepository();

// create a constructor
AuthBloc():super(SignUpInitialState())
{

  on<AuthEvent>((event,emit) async{



    //  sign up
    if(event is SignUpDataEvent){
      emit (SignUpProgressState());

      try{
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password
        ).then((value) => {
          if(value.user != null){
              emit(SignUpDataIsLoadedState())
          }
          else{
            emit(SignUpErrorState("Some thing went wrong"))
          }

        });




      }
      catch(e){
        emit(SignUpErrorState(e.toString()));

      }
    }

      // sign in
    if(event is SignInDataEvent){
      emit (SignInProgressState());

      try{
        await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password
        ).then((value) => {
          if(value.user != null){
            emit(SignInDataIsLoadedState())
          }
          else{
            emit(SignInErrorState("Some thing went wrong"))
          }

        });




      }
      catch(e){
        emit(SignInErrorState(e.toString()));

      }
    }

    // forgot password
    if(event is ForgotDataEvent){
      emit(ForgotPasswordProgressState());

      try{

        await _firebaseAuth.sendPasswordResetEmail(
            email: event.forgotPassword
        );

        emit(ForgotDataIsLoadedState());

      }
          catch(e){
             emit(ForgotErrorState(e.toString()));

          }


    }else{
      emit(ForgotErrorState("Some thing went wrong"));
    }





  });


}










}