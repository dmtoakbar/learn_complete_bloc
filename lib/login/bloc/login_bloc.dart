import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/login/bloc/login-events.dart';
import 'package:study_bloc_complete/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
   LoginBloc():super(LoginState()) {

  }
}