import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/toggle_provider.dart';

class ToggleProviderScreen extends StatelessWidget {
  ToggleProviderScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    print('build called...');

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<ToggleProvider>(
              builder: (context, snapshot, child) {
                return TextFormField(
                  // enabled: passwordToggle.value,
                  obscureText: snapshot.passwordToggle,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: (){
                        /// toggle the value
                        snapshot.setToggleValue();

                      },
                      child: Icon( snapshot.passwordToggle ?  Icons.visibility_off :
                      Icons.visibility),
                    ),
                  ),
                );
              }
            ),
            SizedBox(height: 50,),
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // _counter.value++;
          // print( 'value :  ${_counter.value++}');
        },
        child: Icon(Icons.add),
      ),
    );

  }
}