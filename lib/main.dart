import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Real Estate"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Card(
              imageUrl: "https://thumbor.forbes.com/thumbor/fit-in/x/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/download-23.jpg",
              location: "Ankara/Turkey",
              price: 400,
            ),
            Card(
              imageUrl: "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwaG91c2V8ZW58MHx8MHx8&w=1000&q=80",
              location: "mersin/Turkey",
              price: 650,
            ),
            Card(
              imageUrl: "https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwaG91c2V8ZW58MHx8MHx8&w=1000&q=80",
              location: "mersin/Turkey",
              price: 650,
            ),
          ],
        )
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String imageUrl;
  final int price;
  final String location;
  const Card({Key? key, required this.imageUrl, required this.price, required this.location}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),

              ),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill

            )
          ),
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 220),


        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
              ),
          ),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$price\$", style: const TextStyle(color: Colors.white, fontSize: 20)),
              Text(location, style: const TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
