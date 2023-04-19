import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider_management/Screen/LikeApp/favourite_screen.dart';
import 'package:provider_management/Screen/count_Example.dart';
import 'package:provider_management/Screen/dark_theme.dart';
import 'package:provider_management/Screen/example_one.dart';
import 'package:provider_management/Screen/login.dart';
import 'package:provider_management/Screen/value_notify_listener.dart';
import 'package:provider_management/whyProvider.dart';

import 'homeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          
        ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Managrmrnt'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ReusableWidget(title: 'Date Example', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              },),
            ReusableWidget(title: 'Why Provider', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WhyProvider()));
              },),
            ReusableWidget(title: 'Count Example', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CountExample()));
              },),
            ReusableWidget(title: 'Multiple Provider', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExampleOneScreen()));
              },),
            ReusableWidget(title: 'Value NotifyListener', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotifyListenerScreen()));
              },),
            ReusableWidget(title: 'Theme changer', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DarkThemeChanger()));
              },),
            ReusableWidget(title: 'favourite App Examplr', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteAppScreen()));
              },),
            ReusableWidget(title: 'Login using API', subTitle: '',onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },),
            
          ],
        ),
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {

   late String title, subTitle ;
  final VoidCallback onPress ;

  ReusableWidget({Key? key, required this.title , required this.subTitle,required this.onPress}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child:  ListTile(
        leading: const CircleAvatar(
          radius: 25,
          child: Text('P',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        title:  Text(title),
        subtitle:  Text(subTitle),
        trailing: const Icon(Icons.arrow_forward,size: 25,),
      ),
    );
  }
}

