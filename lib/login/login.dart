import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Center(
                child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/loginCheck");
                }, child: const Text("Go to Login check"),
                )
            ),
            Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed("/counter");
                  }, child: const Text("Go to counter page"),
                )
            ),
          ],
        ),
      ),
    );
  }
}