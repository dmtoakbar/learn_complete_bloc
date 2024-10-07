import 'package:equatable/equatable.dart';
import 'package:study_bloc_complete/login_check/model/login_response_model.dart';

abstract class LoginCheckState extends Equatable {

}
class LoginInitialState extends LoginCheckState {
  @override
  List<Object?> get props => [];

}

class LoginLoadingState extends LoginCheckState {
  @override
  List<Object?> get props => [];

}
class LoginLoadedState extends LoginCheckState {
  LoginRespModel? loginRespModel;
  LoginLoadedState({required this.loginRespModel});
  @override
  List<Object?> get props => [loginRespModel];

}

class LoginErrorState extends LoginCheckState {
  String? errorMSG;
  LoginErrorState({ required this.errorMSG});
  @override
  List<Object?> get props => [errorMSG];

}