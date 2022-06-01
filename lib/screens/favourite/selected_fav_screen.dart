import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
class SelectedFavScreen extends StatelessWidget {
  const SelectedFavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build..');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Favourite'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.favorite,
                color: Colors.indigo,))
        ],
      ),
      body: Column(
        children: [
          Consumer<FavouriteProvider>(
            builder: (context, snapshot, child) {

              return Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                    itemCount: snapshot.selectedItemsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(snapshot.selectedItemsList.contains(snapshot.selectedItemsList[index])) {
                            snapshot.removeItemsFromList(snapshot.selectedItemsList[index]);
                          } else {
                            // snapshot.addItemsToList(snapshot.selectedItemsList[index]);
                          }
                        },
                        child: ListTile(
                          title: Text('Item: ${snapshot.selectedItemsList[index]} '),
                          trailing: const Icon(
                            Icons.favorite
                              // snapshot.selectedItemsList.contains(index)
                              //     ? Icons.favorite
                              //     : Icons.favorite_border_sharp
                           ),
                        ),
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}