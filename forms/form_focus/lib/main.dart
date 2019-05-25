import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  State<MyCustomForm> createState() {
    // TODO: implement createState
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  FocusNode myFocusNode1;
  FocusNode myFocusNode2;

  @override
  void initState() {
    super.initState();

    myFocusNode1 = FocusNode();
    myFocusNode2 = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode1.dispose();
    myFocusNode2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Focus"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
            ),
            TextField(
              focusNode: myFocusNode1,
            ),
            TextField(
              focusNode: myFocusNode2,
            ),
            IconButton(
              onPressed: () =>
                  FocusScope.of(context).requestFocus(myFocusNode2),
              icon: Icon(Icons.add_a_photo),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => FocusScope.of(context).requestFocus(myFocusNode1),
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
    );
  }
}
