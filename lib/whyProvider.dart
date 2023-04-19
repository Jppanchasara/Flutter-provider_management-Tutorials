import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      count++;
      
      setState(() {});
    });
  }

  @override
  int count = 0;
  Widget build(BuildContext context) {
    print('build '+count.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Why Provider Screen State'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            count.toString(),
            style: TextStyle(fontSize: 50),
          )),
          // Center(
          //     child: Text(
          //   DateTime.now().hour.toString() +
          //       ":" +
          //       DateTime.now().minute.toString() +
          //       ":" +
          //       DateTime.now().second.toString(),
          //   style: TextStyle(fontSize: 50),
          // ))
        ],
      ),
    );
  }
}
