import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/login_check/bloc/login_check_bloc.dart';
import 'package:study_bloc_complete/login_check/bloc/login_check_events.dart';
import 'package:study_bloc_complete/login_check/bloc/login_check_states.dart';
import 'package:study_bloc_complete/login_check/model/login_req_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Check'),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginCheckBloc, LoginCheckState>(
        builder: (BuildContext context, state) {
          if(state is LoginInitialState){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: "Enter User Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: (){

                        BlocProvider.of<LoginCheckBloc>(context).add(LoginReqEvent(loginReqModel: LoginReqModel(username: userNameController.text, password: passController.text)));
                      },
                      child: const Text("Login In")
                  )
                ],
              ),
            );
          } else if(state is LoginLoadingState) {
            return Center(
              child: CircularProgressIndicator(

              ),
            );
          } else if(state is LoginLoadedState) {
            return Center(
              child: Text(state.loginRespModel?.email??"no record"),
            );
          } else if(state is LoginErrorState) {
            return Center(child: Text(state.errorMSG.toString()),);
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}