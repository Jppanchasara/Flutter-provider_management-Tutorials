import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/Provider/favourite_provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
   Widget build(BuildContext context) {
    final favouriteProvider =Provider.of<FavouriteProvider>(context);
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
              itemCount:favouriteProvider.selectedItem.length ,
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
                  trailing: Icon(value.selectedItem.contains(index) ?   Icons.favorite : Icons.favorite_border_outlined),
          
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