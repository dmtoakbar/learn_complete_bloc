import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/login_check/bloc/login_check_events.dart';
import 'package:study_bloc_complete/login_check/bloc/login_check_states.dart';
import 'package:study_bloc_complete/login_check/model/login_response_model.dart';
import 'package:study_bloc_complete/login_check/repo/login_repo.dart';

class LoginCheckBloc extends Bloc<LoginCheckEvent, LoginCheckState>{
  LoginCheckBloc() : super(LoginInitialState()) {
   on<LoginReqEvent>((event, emit) async {
     emit(LoginLoadingState());

     try {
       LoginRespModel loginRespModel = await LoginRepo().login(
           event.loginReqModel?.username ?? "",
           event.loginReqModel?.password ?? "");

       emit(LoginLoadedState(loginRespModel: loginRespModel));
     } catch (e) {
       emit(LoginErrorState(errorMSG: e.toString()));
     }
   });
  }
}