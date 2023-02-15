import 'package:flutter/material.dart';
import 'package:cupertino_notification_bar_ui/cupertino_notification_bar_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // define `StackItems` here.
  // afternatively you can use Containers with height to 75px
  final stackItems = [
    StackedListItem(
      leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_960_720.jpg")),
      title: "Hi",
      subtitle: const Text("It's nice to see you here"),
      trailing: const Icon(Icons.link_rounded),
    ),
    StackedListItem(
      leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_960_720.jpg")),
      title: "This happens to be my first open-source",
      subtitle: const Text("We all start somewhere, right?"),
      trailing: const Icon(Icons.link_rounded),
    ),
    StackedListItem(
      leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_960_720.jpg")),
      title: "Thanks for checking this out!",
      subtitle: const Text("Happy coding :)"),
      trailing: const Icon(Icons.link_rounded),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange.shade200,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StackedList(children: stackItems));
  }
}
