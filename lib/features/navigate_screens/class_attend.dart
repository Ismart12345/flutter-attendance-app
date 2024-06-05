// import 'package:flutter/material.dart';
// import "package:live_indicator/live_indicator.dart";

// class ClassAttendScreen extends StatefulWidget {
//   const ClassAttendScreen({super.key});

//   @override
//   State<ClassAttendScreen> createState() => _ClassAttendScreenState();
// }

// class _ClassAttendScreenState extends State<ClassAttendScreen> {
//   bool isRequestPending = false; // Flag to track if a request is pending
//   String subjectName = 'Math'; // Replace with your subject name

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Class Attendance'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           LiveIndicator(
//             color: Colors.red.shade700,
//             radius: 5,
//             spreadRadius: 50,
//             spreadDuration: const Duration(seconds: 1),
//             waitDuration: const Duration(seconds: 1),
//           ),
//           SizedBox(
//             height: screenHeight * 0.5,
//           ),
//           Text(
//             'Subject: $subjectName',
//             style: TextStyle(
//               fontSize: screenWidth * 0.06,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.03),
//           if (isRequestPending)
//             Center(
//               child: Column(
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Attendance request pending...',
//                     style: TextStyle(fontSize: screenWidth * 0.045),
//                   ),
//                 ],
//               ),
//             )
//           else
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: screenWidth * 0.22,
//                   height: screenHeight * 0.068,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isRequestPending =
//                             true; // Set the flag to true to show the loading indicator
//                       });
//                       // Simulate a delay for the request
//                       Future.delayed(Duration(seconds: 3), () {
//                         setState(() {
//                           isRequestPending =
//                               false; // Set the flag to false to hide the loading indicator
//                         });
//                         // Handle attend request
//                         print('Attend button pressed');
//                       });
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Attend',
//                         style: TextStyle(fontSize: screenWidth * 0.045),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 Container(
//                   width: screenWidth * 0.22,
//                   height: screenHeight * 0.068,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isRequestPending =
//                             true; // Set the flag to true to show the loading indicator
//                       });
//                       // Simulate a delay for the request
//                       Future.delayed(Duration(seconds: 3), () {
//                         setState(() {
//                           isRequestPending =
//                               false; // Set the flag to false to hide the loading indicator
//                         });
//                         // Handle cancel request
//                         print('Cancel button pressed');
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Cancel',
//                         style: TextStyle(fontSize: screenWidth * 0.045),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import "package:live_indicator/live_indicator.dart";

class ClassAttendScreen extends StatefulWidget {
  const ClassAttendScreen({super.key});

  @override
  State<ClassAttendScreen> createState() => _ClassAttendScreenState();
}

class _ClassAttendScreenState extends State<ClassAttendScreen> {
  bool isRequestPending = false; // Flag to track if a request is pending
  String subjectName = 'Math'; // Replace with your subject name

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Class Attendance'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LiveIndicator(
            color: Colors.red.shade700,
            radius: 5,
            spreadRadius: 50,
            spreadDuration: const Duration(seconds: 1),
            waitDuration: const Duration(seconds: 1),
          ),
          Text(
            'Subject: $subjectName',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          if (isRequestPending)
            Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Attendance request pending...',
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                ],
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isRequestPending =
                          true; // Set the flag to true to show the loading indicator
                    });
                    // Simulate a delay for the request
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        isRequestPending =
                            false; // Set the flag to false to hide the loading indicator
                      });
                      // Handle attend request
                      print('Attend button pressed');
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Attend',
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isRequestPending =
                          true; // Set the flag to true to show the loading indicator
                    });
                    // Simulate a delay for the request
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        isRequestPending =
                            false; // Set the flag to false to hide the loading indicator
                      });
                      // Handle cancel request
                      print('Cancel button pressed');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: screenWidth * 0.045),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
