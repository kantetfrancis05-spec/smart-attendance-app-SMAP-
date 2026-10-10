
import 'package:flutter/material.dart';
import 'student_attendance.dart';
class StudentAttendance extends StatelessWidget {
  const StudentAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Attendance'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.school_rounded,
            size: 75,
            color: Colors.indigo,
          ),
          const SizedBox(height: 12),
          const Text(
            'Welcome, Student!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Check your lecture attendance status below.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.nfc,
                color: Colors.indigo,
                size: 35,
              ),
              title: const Text('NFC Check-in'),
              subtitle: const Text(
                'NFC verification is not connected yet.',
              ),
              trailing: const Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.bluetooth,
                color: Colors.indigo,
                size: 35,
              ),
              title: const Text('Bluetooth Presence'),
              subtitle: const Text(
                'Classroom presence verification is not connected yet.',
              ),
              trailing: const Icon(Icons.bluetooth_disabled),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.face,
                color: Colors.indigo,
                size: 35,
              ),
              title: const Text('Facial Verification'),
              subtitle: const Text(
                'Identity verification is not connected yet.',
              ),
              trailing: const Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 24),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attendance Status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'No attendance session recorded yet.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
