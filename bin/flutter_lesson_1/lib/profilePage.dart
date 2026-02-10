import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String name = ('Tom Hardy');
  String bio = ('actor');
  final int age = 47;
  final String city = 'London, UK';
  final String interests =
      'Cinema\n'
      'Fitness\n'
      'Motorcycles\n'
      'Traveling';

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 113, 171),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 160, 219),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/Tom.jpg'),
            ),
            SizedBox(height: 16),

            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                bio,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 6),

            Text(
              '$age years old',
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 172, 20, 169),
              ),
            ),

            SizedBox(height: 4),

            Text(
              city,
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 91, 4, 4),
              ),
            ),
            SizedBox(height: 20),

            Text(
              interests,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 169, 207, 146),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
