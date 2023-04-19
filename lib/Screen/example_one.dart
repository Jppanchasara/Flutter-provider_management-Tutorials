import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/Provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  
  @override
  Widget build(BuildContext context) {
    //final provider =Provider.of<ExampleOneProvider>(context,listen: true);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example one"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Slider(
            min: 0,
            max: 1,
            value: value.value, 
            onChanged: (val){

              value.setValue(val);
              
            }
          );
          }),
          
          const SizedBox(
            height: 20,
          ),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)
                    ),
                    child: const Center(child: Text("Container 1",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
                 Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value)
                    ),
                    child: const Center(child: Text("Container 2",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                )
              ],
            ),
          );
          
          }),
          const SizedBox(height: 65,),
          const Text('Using Multiple Provider',style: TextStyle(fontSize: 15),)
          
        ],
      ),
    );
  }
}