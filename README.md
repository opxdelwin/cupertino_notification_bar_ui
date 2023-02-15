# cupertino_notification_bar_ui

**Hi, welcome here!**

Myself ***Delwin***, a passionate `FlutterFire` Developer.

## Introduction

This is a package made for Flutter on Android, iOS, Windows and Linux.   
UI design for dismissible  `Containers` similar to that of iOS Notification Center. Inspired by a question on StackOverflow. 

## Features
You can organize UI components in a stacked manner. These are only dismissible and can trigger a `Function` on clicked. 

`StackedListItem` is a built in `StatelessWidget` which can be coupled with `StackedList` to show components. Alternatively you can use `Containers` for the same.

https://user-images.githubusercontent.com/84124091/219039940-beb32e6c-a7e3-4e9b-8f9a-4a6060b4d3ed.mp4

## Getting started
### Depend on it
Add package to `pubspec.yaml` file
```yaml
dependencies:
  cupertino_notification_bar_ui: <latest>
```
Alternatively, your editor might support  `flutter pub get`. Check the docs for your editor to learn more.

##### Or alternatively run 
```
flutter pub add cupertino_notification_bar_ui
```

### Import it
Now in your Dart code, you can use:   
```dart
import 'package:cupertino_notification_bar_ui/cupertino_notification_bar_ui.dart';
```

## Usage

  The package takes in a list of children, either of `StackedListItem` or `Container` as its parameter. 
Use the below given example to set up

```dart
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

```


## Additional information
Check => [official GitHub repo](https://github.com/opxdelwin/cupertino_notification_bar_ui).

This package was made just with the intention of providing a structured solution. I do not practice open source regularly, hence I will not be managing this package actively. 

Feel free to raise a issue in repository for this package on GitHub, I'd love to tailor this package as per my availability, or we could work together on this.

If you really liked this package, even though I do not actively want to be sponsored, you can donate here.    
<img src="https://user-images.githubusercontent.com/84124091/219038251-9749d34f-8f8e-4be4-af44-7868dd7e6aca.png" height=240 width=240>
