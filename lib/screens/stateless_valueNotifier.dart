import 'package:flutter/material.dart';
class ValueNotifierWidget extends StatelessWidget {
   ValueNotifierWidget({Key? key}) : super(key: key);

   ValueNotifier<int> _counter = ValueNotifier<int>(0);
   ValueNotifier<bool> passwordToggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: passwordToggle,
            builder: (context, snapshot, child) {
              print('snapshot Value: $snapshot');
              return TextFormField(
                // enabled: passwordToggle.value,
                obscureText: snapshot,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: InkWell(
                    onTap: (){
                      /// toggle the value
                      passwordToggle.value = !passwordToggle.value;
                      // snapshot = !snapshot;

                    },
                      child: Icon( snapshot ?  Icons.visibility_off :
                          Icons.visibility),
                  ),
                ),
              );
            }
          ),

           SizedBox(height: 50,),
           ValueListenableBuilder(
             valueListenable: _counter,
             builder: (BuildContext context, value, Widget? child) {
               return Text('counter: ${value}',
                 style:  TextStyle(fontSize: 25),);
             }
           ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          // print( 'value :  ${_counter.value++}');
        },
        child: Icon(Icons.add),
      ),
    );

  }
}