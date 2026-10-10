import 'package:flutter/material.dart';

void main() {
runApp(const SMAPApp());
}

class SMAPApp extends StatelessWidget {
const SMAPApp({super.key});

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
home: Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
child: Center(
child: Padding(
padding: const EdgeInsets.all(24),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(
Icons.verified_user,
size: 90,
color: Colors.indigo,
),
const SizedBox(height: 20),
const Text(
'SMAP',
style: TextStyle(
fontSize: 38,
fontWeight: FontWeight.bold,
color: Colors.indigo,
),
),
const SizedBox(height: 10),
const Text(
'Smart Attendance App',
style: TextStyle(fontSize: 21),
textAlign: TextAlign.center,
),
const SizedBox(height: 16),
const Text(
'Verify. Attend. Stay Present.',
style: TextStyle(fontSize: 16),
textAlign: TextAlign.center,
),
const SizedBox(height: 30),
const Text(
'A smarter way to verify classroom attendance.',
textAlign: TextAlign.center,
),
],
),
),
),
),
),
);
}
}