import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/Provider/favourite_provider.dart';
import 'package:provider_management/Screen/LikeApp/myfavourite.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  List<int> selectedItem=[];
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions:  [
          
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavourite()));
            },
            child: const Icon(Icons.favorite_border_outlined)),
         const  SizedBox(width: 15,)
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
                return Consumer<FavouriteProvider>(builder: (context ,value,child){
                  return ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeItem(index);

                    }else
                    {
                      value.addItem(index);
                    }
                    
                    
                  },
                  title: Text("Item "+index.toString()),
                  trailing: Icon(value.selectedItem.contains(index) ?   Icons.favorite:Icons.favorite_border_outlined),
          
                );
                });
              }
              
            ),
          )

        ],
      ),
    );
  }
}