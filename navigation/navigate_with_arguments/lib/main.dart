import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation with Arguments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments arguments = settings.arguments;

          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
              title: arguments.title,
              message: arguments.message,
            );
          });
        }
      },
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExtractArgumentsScreen(),
                        settings: RouteSettings(
                            arguments: ScreenArguments(
                          'Extract Arguments Screen',
                          'This message is extracted in the build method.',
                        ))));
              },
            ),
            RaisedButton(
              child: Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                Navigator.pushNamed(context, PassArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'Accept Arguments Screen',
                      'This message is extracted in the onGenerateRoute function.',
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key key}) : super(key: key);
  static const routeName = "/extractArguments";

  @override
  Widget build(BuildContext context) {
    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Center(
        child: Text(arguments.message),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen(
      {Key key, @required this.title, @required this.message})
      : super(key: key);
  static const routeName = "/passArguments";
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text(this.message),
      ),
    );
  }
}
