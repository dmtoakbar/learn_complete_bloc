import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/common/route/names.dart';
import 'package:study_bloc_complete/counter/bloc/counter_bloc.dart';
import 'package:study_bloc_complete/counter/counter_page.dart';
import 'package:study_bloc_complete/login/bloc/login_bloc.dart';
import 'package:study_bloc_complete/login/login.dart';
import 'package:study_bloc_complete/login_check/bloc/login_check_bloc.dart';
import 'package:study_bloc_complete/login_check/login_page.dart';

class AppPages {
static List<PageEntity> routes() {
  return [
    PageEntity(
        route: RouteName.initial,
        page: const LoginScreen(),
        bloc: BlocProvider(
          create: (_)=>LoginBloc(),
        )
    ),
    PageEntity(
        route: RouteName.loginCheck,
        page: const LoginPage(),
        bloc: BlocProvider(
          create: (_)=>LoginCheckBloc(),
        )
    ),
    PageEntity(
        route: RouteName.counter,
        page: const CounterPage(),
        bloc: BlocProvider(
          create: (_)=>CounterBloc(),
        )
    ),
  ];

}


// all bloc providers
static List<dynamic> allBlocProviders(BuildContext context) {
  List<dynamic> blocProvider = <dynamic>[];
  for (var bloc in routes()) {
    blocProvider.add(bloc.bloc);
  }
  return blocProvider;
}

// routes setting

static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
  if(settings.name !=null) {
    var result = routes().where((element) => element.route==settings.name);
    return MaterialPageRoute(builder: (_)=> result.first.page, settings: settings);
  }
  return MaterialPageRoute(builder: (_)=> const Text("Not found"), settings: settings);
}
}

class PageEntity {
  String route;
 Widget page;
 dynamic bloc;
 PageEntity({required this.route, required this.page, required this.bloc});
}