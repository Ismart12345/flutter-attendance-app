import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/profile_picture.jpg'), // Replace with your image asset
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'John Doe',
                  // style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Class 10A',
                  // style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Attendance Progress',
                // style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              _buildAnimatedAttendanceGraph(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedAttendanceGraph() {
    // Sample data for subject-wise attendance progress
    final subjects = [
      'Artificial Intelligence',
      'Matrix Algebra',
      'Crypto Network Security',
      'Software Testing',
      'Digital Image Processing',
    ];

    final subjectAttendanceData = {
      'Artificial Intelligence': 80,
      'Matrix Algebra': 90,
      'Crypto Network Security': 85,
      'Software Testing': 95,
      'Digital Image Processing': 70,
    };

    return Column(
      children: subjects.map((subject) {
        final value = subjectAttendanceData[subject] ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(subject),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 20,
                  width: 200 * (value / 100),
                  decoration: BoxDecoration(
                    color: value >= 75 ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text('$value%'),
            ],
          ),
        );
      }).toList(),
    );
  }
}
