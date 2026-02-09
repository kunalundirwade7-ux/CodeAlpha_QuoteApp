import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quotes',
      home: QuoteHome(),
    );
  }
}

class QuoteHome extends StatefulWidget {
  @override
  _QuoteHomeState createState() => _QuoteHomeState();
}

class _QuoteHomeState extends State<QuoteHome> {
  final List<Map<String, String>> quotes = [
    {
      "quote": "Believe in yourself.",
      "author": "Unknown"
    },
    {
      "quote": "Success is not final, failure is not fatal.",
      "author": "Winston Churchill"
    },
    {
      "quote": "Dream big and dare to fail.",
      "author": "Norman Vaughan"
    },
    {
      "quote": "Do something today that your future self will thank you for.",
      "author": "Sean Patrick Flanery"
    },
    {
      "quote": "Push yourself, because no one else will.",
      "author": "Unknown"
    },
  ];

  int index = 0;
  final Random random = Random();

  void newQuote() {
    setState(() {
      index = random.nextInt(quotes.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Random Quote Generator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                Icons.format_quote,
                size: 60,
                color: Colors.blueGrey,
              ),

              SizedBox(height: 20),

              Text(
                '"${quotes[index]["quote"]}"',
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15),

              Text(
                "- ${quotes[index]["author"]}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: newQuote,
                child: Text("New Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
