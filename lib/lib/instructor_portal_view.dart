import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AttendanceController>(
      create: (context) => AttendanceController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InstructorPortalView(),
      ),
    ),
  );
}

class StudentAttendance {
  final String studentId;
  final String fullName;
  final double score;

  StudentAttendance(this.studentId, this.fullName, this.score);
}

class AttendanceController extends ChangeNotifier {
  bool _isLive = false;
  final List<StudentAttendance> _attendanceData = [
    StudentAttendance('ID-001', 'Alexander Graham', 92.0),
    StudentAttendance('ID-002', 'Beatrix Kiddo', 68.5),
    StudentAttendance('ID-003', 'Cyrus Vance', 41.2),
    StudentAttendance('ID-004', 'Dahlia Rivers', 89.9),
  ];

  bool get isLive => _isLive;
  List<StudentAttendance> get attendanceData => _attendanceData;

  void switchSessionStatus() {
    _isLive = !_isLive;
    notifyListeners();
  }
}

class InstructorPortalView extends StatelessWidget {
  const InstructorPortalView({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: const Text('Academic Attendance Hub'),
        backgroundColor: Colors.indigo.shade900,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<AttendanceController>(
        builder: (context, controller, child) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SessionControlPanel(
                      isLive: controller.isLive,
                      onToggle: controller.switchSessionStatus,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
                      child: Text(
                        'Live Student Engagement Metrics',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Students: ${controller.attendanceData.length} | '
                          'Meeting 75%: '
                          '${controller.attendanceData.where((s) => s.score >= 75).length}',
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = controller.attendanceData[index];
                      return StudentRowItem(student: item);
                    },
                    childCount: controller.attendanceData.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SessionControlPanel extends StatelessWidget {
  final bool isLive;
  final VoidCallback onToggle;

  const SessionControlPanel({
    super.key,
    required this.isLive,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Icon(
            isLive ? Icons.wifi_protected_setup : Icons.power_settings_new,
            size: 64,
            color: isLive ? Colors.green.shade600 : Colors.indigo.shade200,
          ),
          const SizedBox(height: 16),
          Text(
            isLive ? 'Lecture In Progress' : 'Ready to Start Lecture',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: onToggle,
            style: FilledButton.styleFrom(
              backgroundColor: isLive ? Colors.amber.shade800 : Colors.indigo.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
            icon: Icon(isLive ? Icons.pause_circle_filled : Icons.play_arrow),
            label: Text(isLive ? 'END LECTURE' : 'INITIATE TRACKING'),
          ),
        ],
      ),
    );
  }
}

class StudentRowItem extends StatelessWidget {
  final StudentAttendance student;

  const StudentRowItem({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.person, color: Colors.indigo),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.fullName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: student.score / 100,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      student.score >= 75 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '${student.score.round()}% ${student.score >= 75 ? "PASS" : "LOW"}',
            style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.indigo),
          ),
        ],
      ),
    );
  }
}