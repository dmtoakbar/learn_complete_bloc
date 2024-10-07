import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/common/route/pages.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget  build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: MaterialApp(
          title: "Learn Complete Bloc",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ));
  }
}