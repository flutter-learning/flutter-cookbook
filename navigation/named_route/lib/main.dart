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
      initialRoute: '/',
      routes: {
        '/1': (context) => FirstPage(),
        '/2': (context) => SecondPage(),
        '/3': (context) => ThirdPage()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Home Page"),
          ),
          RaisedButton(
            child: Text("Page 1"),
            onPressed: () => {Navigator.pushNamed(context, '/1')},
          ),
          RaisedButton(
            child: Text("Page 2"),
            onPressed: () => {Navigator.pushNamed(context, '/2')},
          ),
          RaisedButton(
            child: Text("Page 3"),
            onPressed: () => {Navigator.pushNamed(context, '/3')},
          )
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("First Page"),
          ),
          RaisedButton(
            child: Text("Page 2"),
            onPressed: () => {Navigator.pushNamed(context, "/2")},
          ),
          RaisedButton(
            child: Text("Page 3"),
            onPressed: () => {Navigator.pushNamed(context, "/3")},
          ),
          RaisedButton(
            child: Text("Back Home"),
            onPressed: () => {Navigator.pushNamed(context, "/")},
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Second Page"),
          ),
          RaisedButton(
            child: Text("Page 1"),
            onPressed: () => {Navigator.pushNamed(context, '/1')},
          ),
          RaisedButton(
            child: Text("Về nhà"),
            onPressed: () => {Navigator.pushNamed(context, "/")},
          ),
          RaisedButton(
            child: Text("Page 3"),
            onPressed: () => {Navigator.pushNamed(context, "/3")},
          )
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Third Page"),
          ),
          RaisedButton(
            child: Text("Page 1"),
            onPressed: () => {Navigator.pushNamed(context, '/1')},
          ),
          RaisedButton(
            child: Text("Page 2"),
            onPressed: () => {Navigator.pushNamed(context, "/2")},
          ),
          RaisedButton(
            child: Text("Về nhà "),
            onPressed: () => {Navigator.pushNamed(context, "/")},
          )
        ],
      ),
    );
  }
}
