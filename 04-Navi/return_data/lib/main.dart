import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Return data demo'),
        ),
        body: Center(
          child: SelectionButton(),
        ));
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplayScreen(context);
      },
      child: Text('Pick an option, any option.'),
    );
  }

  _navigateAndDisplayScreen(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectionScreen()));

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pick an option'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, "Yep");
                    },
                    child: Text('Yep!'),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, "Nope");
                    },
                    child: Text('Nope!'),
                  )),
            ],
          ),
        ));
  }
}
