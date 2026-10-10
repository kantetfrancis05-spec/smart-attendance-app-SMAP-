import 'package:flutter/material.dart';

void main() => runApp(const SMAP());

class SMAP extends StatelessWidget {
  const SMAP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMAP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SMAP')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 70),
            const Text(
              'Smart Attendance App',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StudentLogin(),
                  ),
                );
              },
              child: const Text('Student Login'),
            ),
            ElevatedButton(
              onPressed: () => openPage(context, 'Lecturer Login'),
              child: const Text('Lecturer Login'),
            ),
            ElevatedButton(
              onPressed: () => openPage(
                context, 'Attendance Verification',
              ),
              child: const Text('Attendance Verification'),
            ),
          ],
        ),
      ),
    );
  }
}

void openPage(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => InfoPage(title: title),
    ),
  );
}

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final reg = TextEditingController();
  final pass = TextEditingController();

  @override
  void dispose() {
    reg.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: reg,
              decoration: const InputDecoration(
                labelText: 'Registration Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String message =
                    reg.text.trim().isEmpty || pass.text.isEmpty
                    ? 'Enter both fields.'
                    : 'Demo only: real login is not connected yet.';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  final String title;

  const InfoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('$title page coming soon.'),
      ),
    );
  }
}