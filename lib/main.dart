import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _quotes = [
    "“The best way to predict your future is to create it.” — Abraham Lincoln",
    "“I like criticism. It makes you strong.” — LeBron James",
    "“Turn your wounds into wisdom.” — Oprah Winfrey",
    " “The purpose of our lives is to be happy.” — Dalai Lama",
    "“Never let the fear of striking out keep you from playing the game.”– Babe Ruth"
  ];

  int nxtquote = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("Motivation App"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 400,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: Text(
                      _quotes[nxtquote],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.purple,
                    Color.fromARGB(255, 98, 168, 248)
                  ]),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${nxtquote + 1}/${_quotes.length}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          if (nxtquote > 0) nxtquote--;
                        });
                      }),
                      child: Text("Back")),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (nxtquote < _quotes.length - 1)
                          setState(() {
                            nxtquote = nxtquote + 1;
                          });
                      },
                      child: Text('Next')),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      nxtquote = 0;
                    });
                  },
                  color: Colors.purple,
                  icon: Icon(Icons.refresh)),
            ],
          ),
        ));
  }
}
