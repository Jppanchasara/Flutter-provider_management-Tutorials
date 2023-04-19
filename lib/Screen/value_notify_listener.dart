import 'package:flutter/material.dart';


class NotifyListenerScreen extends StatelessWidget {
   NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify Listener Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: toggle, 
              builder: (context,value,child){
                return TextField(
                  obscureText: toggle.value,
                  decoration:  InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: (){
                        toggle.value= !toggle.value;
                      },
                      child: Icon(toggle.value ?  Icons.visibility_off_outlined:Icons.visibility ))
                  ),
      
                );
      
              }
            ),
            Center(
            child: ValueListenableBuilder(
              valueListenable: _counter, 
              builder: (context,value,child){
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);
              })
            ),
        
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
        ),
    );
  }
}
