// ############################3 bloc consumer ##########################3


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_bloc_complete/counter/bloc/counter_bloc.dart';
import 'package:study_bloc_complete/counter/bloc/counter_events.dart';
import 'package:study_bloc_complete/counter/bloc/counter_states.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                if(state is CounterInitialState) {
                  return  Text(state.count.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
                } else if(state is CounterIncrementState) {
                  return  Text(state.incCount.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
                } else if(state is CounterDecrementState) {
                  return  Text(state.deCount.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
                } else {
                  return  Container();
                }
              },
              listener: (context, state) {
                if(state is CounterIncrementState) {
                  int t;
                  if(state.incCount==5) {
                    t=5;
                    var snack = const SnackBar(content: Text("Increment button topped"));
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  }
                  var snack = const SnackBar(content: Text("Increment button topped"));
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
                if(state is CounterDecrementState) {
                  var snack = const SnackBar(content: Text("Decrement button topped"));
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              }
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent(inCount: counter++));
              }, child: const Icon(Icons.add)),
              ElevatedButton(onPressed: (){
                BlocProvider.of<CounterBloc>(context).add(CounterDecrementEvent(deCount: counter--));
              }, child: const Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}







// ############################ bloc listioner  ###########################

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:study_bloc_complete/counter/bloc/counter_bloc.dart';
// import 'package:study_bloc_complete/counter/bloc/counter_events.dart';
// import 'package:study_bloc_complete/counter/bloc/counter_states.dart';
//
// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});
//
//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }
//
// class _CounterPageState extends State<CounterPage> {
//   int counter=0;
//   @override
//   Widget build(BuildContext context) {
//     return   BlocListener<CounterBloc, CounterState>(
//       listener: (context, state) {
//         if(state is CounterIncrementState) {
//           int t;
//           if(state.incCount==5) {
//             t=5;
//             var snack = const SnackBar(content: Text("Increment button topped"));
//             ScaffoldMessenger.of(context).showSnackBar(snack);
//           }
//           var snack = const SnackBar(content: Text("Increment button topped"));
//           ScaffoldMessenger.of(context).showSnackBar(snack);
//         }
//         if(state is CounterDecrementState) {
//           var snack = const SnackBar(content: Text("Decrement button topped"));
//           ScaffoldMessenger.of(context).showSnackBar(snack);
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Counter App"),
//           centerTitle: true,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
//               if(state is CounterInitialState) {
//                 return  Text(state.count.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
//               } else if(state is CounterIncrementState) {
//                 return  Text(state.incCount.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
//               } else if(state is CounterDecrementState) {
//                 return  Text(state.deCount.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
//               } else {
//                 return  Container();
//               }
//             } ),
//             const SizedBox(height: 40,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(onPressed: (){
//                   BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent(inCount: counter++));
//                 }, child: const Icon(Icons.add)),
//                 ElevatedButton(onPressed: (){
//                   BlocProvider.of<CounterBloc>(context).add(CounterDecrementEvent(deCount: counter--));
//                 }, child: const Icon(Icons.remove))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
