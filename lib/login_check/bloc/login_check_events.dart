import 'package:equatable/equatable.dart';
import 'package:study_bloc_complete/login_check/model/login_req_model.dart';
abstract class LoginCheckEvent extends Equatable {
}

class LoginReqEvent extends LoginCheckEvent {
  // String? username;
  // String? password;
  // LoginReqEvent({this.username, this.password});
  LoginReqModel? loginReqModel;
  LoginReqEvent({required this.loginReqModel});
  @override
  //List<Object?> get props => [username, password];
  List<Object?> get props => [loginReqModel];
}