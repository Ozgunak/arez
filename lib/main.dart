import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: const Color.fromARGB(255, 20, 47, 121),
        ),
        useMaterial3: true,
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AREZ'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        actions: const [Text('Report Bug ')],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/arezImage.png',
              width: 150,
            ),
            const Text('Welcome Back!', style: TextStyle(color: Colors.white)),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      label: const Text('Call'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.map),
                      label: const Text('Route'),
                    ),
                  ),
                ],
              ),
            ),
            const Text('Appointments', style: TextStyle(color: Colors.white)),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text('Appointment ${index + 1}'),
                      subtitle: const Text('Date: 12/12/2021'),
                      trailing: const Icon(Icons.more_vert),
                      tileColor: index % 2 == 0
                          ? Colors.deepPurple.shade100
                          : Colors.deepPurple.shade200,
                      shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        0.5,
                      ),
                    ),
                  );
                },
                itemCount: 40,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Photos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
