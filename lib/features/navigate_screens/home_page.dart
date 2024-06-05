// import 'package:flutter/material.dart';
// import 'package:student/utils/constants/image_strings.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart'; // Add this import for date formatting

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final today = DateTime.now();
//     final formattedDate =
//         DateFormat('MMMM d, yyyy').format(today); // Format the date

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Card(
//                 elevation: 4.0, // Adds shadow for better UI
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: width * 0.4,
//                         height: height * 0.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: DecorationImage(
//                             image: AssetImage(TImages
//                                 .onBoardingImage6), // Replace with your image URL
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: width * 0.1),
//                       Text(
//                         'Hi user',
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                   height: height *
//                       0.05), // Add some space between the card and the calendar
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Today\'s Date: $formattedDate',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                   height: height *
//                       0.02), // Add some space between the heading and the calendar
//               Container(
//                 height:
//                     height * 0.5, // Adjust the height of the calendar as needed
//                 child: TableCalendar(
//                   firstDay: DateTime.utc(2020, 1, 1),
//                   lastDay: DateTime.utc(2030, 12, 31),
//                   focusedDay: today,
//                   calendarStyle: CalendarStyle(
//                       // Customize your calendar style here
//                       ),
//                   headerStyle: HeaderStyle(
//                       // Customize your header style here
//                       ),
//                   // Add other properties as needed
//                 ),
//               ),
//               Card(
//                 elevation: 4.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Your Performance',
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Your Percentage',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 16.0),
//                             decoration: BoxDecoration(
//                               color: Colors.green.shade100,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: Text(
//                               '85%', // Replace with your dynamic percentage value
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors
//                                     .green, // Use color to highlight the percentage
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:student/utils/constants/image_strings.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final today = DateTime.now();
//     final formattedDate = DateFormat('MMMM d, yyyy').format(today);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 elevation: 4.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: width * 0.2,
//                         height: width * 0.2,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: DecorationImage(
//                             image: AssetImage(TImages.onBoardingImage6),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: width * 0.04),
//                       Text(
//                         'Hi user',
//                         style: TextStyle(
//                           fontSize: width * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
//               Text(
//                 'Classes',
//                 style: TextStyle(
//                   fontSize: width * 0.05,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: height * 0.01),
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: height * 0.1,
//                   viewportFraction: 1,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                 ),
//                 items: [
//                   AssetImage(TImages.onBoardingImage1),
//                   AssetImage(TImages.onBoardingImage2),
//                   AssetImage(TImages.onBoardingImage3),
//                   AssetImage(TImages.onBoardingImage4),
//                   AssetImage(TImages.onBoardingImage5),
//                 ].map((image) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: height * 0.05),
//               Text(
//                 'Today\'s Date: $formattedDate',
//                 style: TextStyle(
//                   fontSize: width * 0.045,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
//               Container(
//                 height: height * 0.33, // Reduced the height of the calendar
//                 child: TableCalendar(
//                   rowHeight: 27,
//                   firstDay: DateTime.utc(2020, 1, 1),
//                   lastDay: DateTime.utc(2030, 12, 31),
//                   focusedDay: today,
//                   calendarStyle: CalendarStyle(
//                       // Customize your calendar style here
//                       ),
//                   headerStyle: HeaderStyle(
//                       // Customize your header style here
//                       ),
//                   // Add other properties as needed
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
//               Card(
//                 elevation: 4.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Your Performance',
//                         style: TextStyle(
//                           fontSize: width * 0.045,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: height * 0.01),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Your Attendance Percentage',
//                             style: TextStyle(
//                               fontSize: width * 0.04,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: width * 0.04,
//                                 vertical: height * 0.01),
//                             decoration: BoxDecoration(
//                               color: Colors.green.shade100,
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: Text(
//                               '85%', // Replace with your dynamic percentage value
//                               style: TextStyle(
//                                 fontSize: width * 0.04,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    final formattedDate = DateFormat('MMMM d, yyyy').format(today);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.2,
                        height: width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(TImages.onBoardingImage6),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Text(
                        'Hi user',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Classes',
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),
              CarouselSlider(
                options: CarouselOptions(
                  height: height * 0.18,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: [
                  AssetImage(TImages.onBoardingImage1),
                  AssetImage(TImages.onBoardingImage2),
                  AssetImage(TImages.onBoardingImage3),
                  AssetImage(TImages.onBoardingImage4),
                  AssetImage(TImages.onBoardingImage5),
                ].map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Today\'s Date: $formattedDate',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.35,
                child: TableCalendar(
                  rowHeight: 35,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: today,
                  calendarStyle: CalendarStyle(
                      // Customize your calendar style here
                      ),
                  headerStyle: HeaderStyle(
                      // Customize your header style here
                      ),
                  // Add other properties as needed
                ),
              ),
              SizedBox(height: height * 0.02),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Performance',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Attendance Percentage',
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              '85%', // Replace with your dynamic percentage value
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
