import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ani(),));
}

class ani extends StatefulWidget {
  const ani({Key? key}) : super(key: key);

  @override
  State<ani> createState() => _aniState();
}

class _aniState extends State<ani> {
  bool change = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) => (value) {
      setState(() {
        change=!change;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("")),
      body:Center(child:  Column(children: [
        AnimatedContainer(
          curve: Curves.slowMiddle,
          onEnd: () {
            setState(() {
              change = !change;
            });
          },
          duration: Duration(seconds: 5),
          height: change ? 100 : 200,
          width: change ? 100 : 200,
          child: Text("Hello"),
          alignment: change ? Alignment.topLeft : Alignment.bottomRight,
          color: change ? Colors.yellow : Colors.blue,
        ),
        ElevatedButton(onPressed: () {
          change=!change;
        }, child: Text("change"))
      ]
      ),)
    );
  }
}
