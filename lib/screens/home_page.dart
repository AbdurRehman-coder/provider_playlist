import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/count_provider.dart';
class HomePageProvider extends StatefulWidget {
  const HomePageProvider({Key? key}) : super(key: key);

  @override
  State<HomePageProvider> createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  int counter = 5;
   // late var providerInstance;
  @override
  void initState(){
    super.initState();
     // providerInstance = Provider.of<CounterProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Consumer<CounterProvider>(
      builder: (context, value, child){
        print('consumer build 1');
        return Scaffold(
          appBar: AppBar(
            title: Text('Enterprenuer ${value.count}'),
          ),
          body: Column(
            children: [

              Center(
                child: Text(value.count.toString()),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              //
              context.read<CounterProvider>().setCount();

            },
          ),
        );
      },

    );
  }

}