import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:study_bloc_complete/login_check/model/login_req_model.dart';
import 'package:study_bloc_complete/login_check/model/login_response_model.dart';
class LoginRepo {
Future<LoginRespModel>  login(String username, String password) async {
   var url = "https://dummyjson.com/auth/login";
   LoginReqModel loginReqModel = LoginReqModel(username: username, password: password);
    http.Response response = await http.post(
     Uri.parse(url),
     headers: { 'Content-Type': 'application/json' },
     body: jsonEncode(loginReqModel.toJson()),
   );

    try{
      if(response.statusCode==200) {
        var resp = response.body;
        var respBody = jsonDecode(resp);
        return LoginRespModel.fromJson(respBody);
      } else {
        return LoginRespModel();
      }
    } catch(e) {
      throw Exception(e);
    }
  }
}