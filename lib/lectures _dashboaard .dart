
import 'package:flutter/material.dart';

class LecturerDashboard extends StatefulWidget {
  const LecturerDashboard({super.key});

  @override
  State<LecturerDashboard> createState() =>
      _LecturerDashboardState();
}

class _LecturerDashboardState extends State<LecturerDashboard> {

bool isLectureActive = false;
final List<String> checkedInStudents = [];
void startLecture() {
  setState(() {
    isLectureActive = true;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Lecture started successfully!'),
    ),
  );
}

  bool _lectureActive = false;
  bool _broadcasting = false;

  void _startLecture() {
    setState(() {
      _lectureActive = true;
      _broadcasting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Lecture started. BLE broadcasting is not connected yet.',
        ),
      ),
    );
  }

  void _endLecture() {
    setState(() {
      _lectureActive = false;
      _broadcasting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lecture session ended.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMAP Lecturer Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.co_present,
                size: 72,
                color: Colors.indigo,
              ),
              const SizedBox(height: 16),
              const Text(
                'Lecturer Control Panel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              Card(
                child: ListTile(
                  leading: Icon(
                    _broadcasting
                        ? Icons.bluetooth_connected
                        : Icons.bluetooth_disabled,
                    color: _broadcasting
                        ? Colors.green
                        : Colors.grey,
                  ),
                  title: Text(
                    _broadcasting
                        ? 'BLE Broadcasting Active'
                        : 'BLE Not Connected',
                  ),
                  subtitle: Text(
                    _lectureActive
                        ? 'Lecture session is active'
                        : 'No active lecture session',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed:
                      _lectureActive ? null : _startLecture,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('START LECTURE'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed:
                      _lectureActive ? _endLecture : null,
                  icon: const Icon(Icons.stop),
                  label: const Text('END LECTURE'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Bluetooth advertising will be connected '
                'in the next development step.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
