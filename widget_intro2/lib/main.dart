import 'package:flutter/material.dart';
import 'package:widget_intro2/screen_one.dart';
import 'package:widget_intro2/screen_two.dart';

import 'login_success.dart';

void main() {
  runApp(const MyApp());
}

final _textTheme = TextTheme(
  headlineLarge: TextStyle(fontSize: 32),
  headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
);
final _lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  textTheme: _textTheme,
);
final _darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: .fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
  textTheme: _textTheme,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      initialRoute: '/',
      routes: {
        '/login_success': (context) => LoginSuccess(),
        // '/products_list': (context) => ProductList()
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page HW'),
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
  int _counter = 0;
  int _navBarIndex = 0;
  final List<Widget> screens = <Widget>[];

  @override
  void initState() {
    super.initState();
    screens.add(ScreenOne());
    screens.add(ScreenTwo());
    screens.add(ScreenOne());
    screens.add(ScreenOne());
  }

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: screens[_navBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          //routes
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Widgets'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Setting'),
        ],
        onTap: (index) => {
          // print(i),
          // _navBarIndex = i,
          setState(() {
            // setState --> re-render UI
            _navBarIndex = index;
          }),
        },
        currentIndex: _navBarIndex,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
