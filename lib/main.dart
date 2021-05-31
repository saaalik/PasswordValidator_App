import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PasswordValidator(),
    );
  }
}

class PasswordValidator extends StatefulWidget {
  @override
  _PasswordValidatorState createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  final controller = TextEditingController();
  final validCharacters = RegExp(r'[0-9]');
  Color color1 = Color(0xffff0033);
  Color color2 = Color(0xffff0033);
  Color color3 = Color(0xffff0033);

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void checkValidity(password) {
    setState(() {
      if (password.length >= 8) {
        color1 = Color(0xff008000);
      } else {
        color1 = Color(0xffff0033);
      }
      if (password[0].toUpperCase() == password[0]) {
        color2 = Color(0xff008000);
      } else {
        color2 = Color(0xffff0033);
      }
      //if (password.toUpperCase() == password) {
      //  if (isNumeric(password) == true || password.trim() == "") {
      //    color2 = Color(0xffff0033);
      //  } else {
      //    color2 = Color(0xff008000);
      //  }
      //} else {
      //  color2 = Color(0xffff0033);
      //}
      if (password.contains(validCharacters)) {
        color3 = Color(0xff008000);
      } else {
        color3 = Color(0xffff0033);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Password Validator"))),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Use 8 or more characters",
                  style: TextStyle(
                    color: this.color1,
                  )),
              Text("Password should start with an Uppercase letter",
                  style: TextStyle(
                    color: this.color2,
                  )),
              //Text("Use upper and lower case letters",
              //    style: TextStyle(
              //      color: this.color2,
              //    )),
              //Text("Use a number (e.g. 1234)",
              //    style: TextStyle(
              //      color: this.color3,
              //    )),
              TextField(
                  controller: this.controller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      labelText: "Enter your password"),
                  onChanged: (text) => checkValidity(text))
            ]));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
