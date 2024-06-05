// import 'package:student/features/authentication/screens/navigate_screens/class_attend.dart';
// import 'package:student/features/authentication/screens/navigate_screens/home_page.dart';
// import 'package:student/features/authentication/screens/navigate_screens/profile_page.dart';
// import 'package:student/utils/constants/colors.dart';
// import 'package:student/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final NavigationController controller = Get.put(NavigationController());
//     final darkMode = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 60,
//           selectedIndex: controller.selectedIndex.value,
//           backgroundColor: darkMode ? TColors.black : TColors.white,
//           indicatorColor: darkMode
//               ? TColors.white.withOpacity(0.1)
//               : TColors.black.withOpacity(0.1),
//           onDestinationSelected: (index) =>
//               controller.selectedIndex.value = index,
//           destinations: const [
//             NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//             NavigationDestination(
//                 icon: Icon(Icons.store), label: 'Class Attend'),
//             NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
//           ],
//         ),
//       ),
//       body: Obx(
//         () {
//           final index = controller.selectedIndex.value;
//           return controller
//               .getScreen(index); // Use a function to get the appropriate screen
//         },
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final RxInt selectedIndex = 0.obs;

//   final List<Widget> screens = [HomePage(), ClassAttendScreen(), ProfilePage()];

//   Widget getScreen(int index) {
//     return screens[index]; // Return the corresponding screen based on index
//   }
// }

import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
import 'package:student/features/navigate_screens/class_attend.dart';
import 'package:student/features/navigate_screens/home_page.dart';
import 'package:student/features/navigate_screens/profile_page.dart';
import 'package:student/features/navigate_screens/within_radius_location.dart';
import 'package:student/features/navigate_screens/your_location_screen.dart';
import 'package:student/utils/constants/colors.dart';
import 'package:student/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Obx(
        () {
          final index = controller.selectedIndex.value;
          return controller.getScreen(index);
        },
      ),
      drawer: BeautifulDrawer(
        controller: controller.drawerController,
        selectedIndex: controller.selectedIndex,
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.store), label: 'Class Attend'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final AnimatedDrawerController drawerController = AnimatedDrawerController();

  final List<Widget> screens = [HomePage(), ClassAttendScreen(), ProfilePage()];

  Widget getScreen(int index) {
    return screens[index];
  }
}

class BeautifulDrawer extends StatelessWidget {
  final AnimatedDrawerController controller;
  final RxInt selectedIndex;

  const BeautifulDrawer({
    Key? key,
    required this.controller,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/images/avatar.jpg'), // Replace with your avatar image path
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe', // Replace with the desired user name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              selectedIndex.value = 0;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Class Attend'),
            onTap: () {
              selectedIndex.value = 1;
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              selectedIndex.value = 2;
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('Your Location'),
            onTap: () {
              Get.to(() => LocationCheckScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              await AuthenticationRepository.instance.logout();
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedDrawerController extends GetxController {
  final RxBool isOpen = false.obs;

  void toggle() {
    isOpen.value = !isOpen.value;
  }
}
