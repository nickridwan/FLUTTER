import 'package:flutter/material.dart';
import 'package:untitled/Page/home_page.dart';

<<<<<<< HEAD
void main() => {runApp(const MyApp())};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
=======
void main() => {
  runApp(const MyApp())
};

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key : key);
>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: const HomePage(),
    );
  }
}
=======
      home: HomePage(),
    );
  }
}






>>>>>>> 32ee78af82b7670d5d2a7475f6319dafc9b8f3c0
