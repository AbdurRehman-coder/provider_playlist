import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/example_one_provider.dart';
class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
   // double sliderValue = 1;
  @override
  Widget build(BuildContext context) {
    print('build called');
    // final sliderProvider = Provider.of<ExampleOneProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text('Profile'),
        ),
        centerTitle: true,
        titleSpacing: 0,
        // leadingWidth: 100.w,
        leading: Padding(
          padding: EdgeInsets.only(top: 18),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
              size: 16,),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, snapshot, child) {
              return Slider(
                min: 0,
                  max: 1,
                  value: snapshot.sliderValue,
                  onChanged: (value){
                  print('value: $value');
                  // setState((){});
                    snapshot.setSliderValue(value);
                  });
            }
          ),
          Row(
            children: [
              Expanded(
                child: Consumer<ExampleOneProvider>(
                  builder: (context, snapshot, child) {
                    return Container(
                      color: Colors.green.withOpacity(snapshot.sliderValue),
                      height: 150,
                      child: Text('Yasir'),
                    );
                  }
                ),
              ),
              Expanded(
                child: Consumer<ExampleOneProvider>(
                  builder: (context, snapshot, child) {

                    return Container(
                      color: Colors.red.withOpacity(snapshot.sliderValue),
                      height: 150,
                      child: Text('Abid Comrade'),
                    );
                  },
                ),
              ),

            ],
          ),
        ],
      ),

    );
  }
}