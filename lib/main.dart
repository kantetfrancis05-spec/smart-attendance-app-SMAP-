import 'package:flutter/material.dart';

void main() {
runApp(const SMAPApp());
}

class SMAPApp extends StatelessWidget {
const SMAPApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'SMAP - Smart Attendance App',
debugShowCheckedModeBanner: false,
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: Colors.indigo,
),
useMaterial3: true,
),
home: const WelcomeScreen(),
);
}
}

class WelcomeScreen extends StatelessWidget {
const WelcomeScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Center(
child: Padding(
padding: const EdgeInsets.all(24.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(
Icons.verified_user,
size: 90,
color: Colors.indigo,
),
const SizedBox(height: 24),
const Text(
'SMAP',
style: TextStyle(
fontSize: 36,
fontWeight: FontWeight.bold,
color: Colors.indigo,
),
),
const SizedBox(height: 12),
const Text(
'Smart Attendance App',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.w600,
),
),
const SizedBox(height: 12),
const Text(
'Verify. Attend. Stay Present.',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 16,
color: Colors.black54,
),
),
const SizedBox(height: 36),
const Text(
'A smarter way to verify classroom attendance.',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 15),
),
],
),
),
),
),
);
}
}