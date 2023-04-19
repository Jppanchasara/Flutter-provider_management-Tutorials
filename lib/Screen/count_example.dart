import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/Provider/count_Provider.dart';


class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider=Provider.of<CountProvider>(context,listen: false);
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      countProvider.setCount();
      
    });
  }
  @override
  Widget build(BuildContext context) {
     final countProvider=Provider.of<CountProvider>(context,listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Example',style: TextStyle(fontSize: 20,color:Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          //print("only text widget rebuilds");
          return Text(value.Count.toString(),style: const TextStyle(fontSize: 50),);
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
          
        },
        child: Icon(Icons.add),
        ),
    );
  }
}