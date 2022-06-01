import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/favourite_provider.dart';
import 'package:provider_playlist/screens/favourite/selected_fav_screen.dart';

class FavouriteItemScreen extends StatefulWidget {
  const FavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    print('build..');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedFavScreen(),),);
              },
              icon: Icon(Icons.favorite,
              color: Colors.red,),),
        ],
      ),
      body: Column(
        children: [
          Consumer<FavouriteProvider>(
            builder: (context, snapshot, child) {
              print('items list: ${snapshot.selectedItemsList.length}');
              return Expanded(
                child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(snapshot.selectedItemsList.contains(index)) {
                            snapshot.removeItemsFromList(index);
                          } else {
                            snapshot.addItemsToList(index);
                          }
                        },
                        child: ListTile(
                          title: Text('Item: ${index} '),
                          trailing: Icon(
                              snapshot.selectedItemsList.contains(index)
                                  ? Icons.favorite
                                  : Icons.favorite_border_sharp),
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