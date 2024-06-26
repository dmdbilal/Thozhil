import 'package:flutter/material.dart';
import 'package:thozhil_flutter_app/screens/interships_screen.dart';
import 'package:thozhil_flutter_app/screens/jobs_screen.dart';
import '../util/util_functions.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';

/** Drawer Screens
 * 1. Home
 * 2. Jobs
 * 3. Internships
 * 4. Success signals
 * 5. How it works
 * 6. FAQs
 */

Widget getDrawer(BuildContext context, int screen) {
  return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10,),
                    ClipOval(
                      child: Image.network(
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfVkPyt-L1sE4Tis-L2F1qufJs6wu5WDJvyA&s',
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Text('Failed to load image');
                        },
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Mohamed Bilal",
                            style: dmSansStyle(20, fontWeight: FontWeight.bold)
                        ),
                        Text(
                            "B.Tech IT",
                            style: dmSansStyle(15, color: Colors.black45)
                        ),
                        Text(
                            "view profile",
                            style: dmSansStyle(18, fontWeight: FontWeight.bold, color: Colors.blue)
                        )
                      ],
                    )
                  ],
                ),
              )
          ),

          ListTile(
            title: Text(
                "Home",
                style: dmSansStyle(
                    18,
                    fontWeight: FontWeight.bold,
                    color: screen == 1 ? Colors.blue : Colors.black45
                )
            ),
            leading: Icon(
              Icons.home_outlined,
              color: screen == 1 ? Colors.blue : Colors.black45
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            },
          ),
          ListTile(
            title: Text(
                "Jobs",
                style: dmSansStyle(
                    18,
                    fontWeight: FontWeight.bold,
                    color: screen == 2 ? Colors.blue : Colors.black45
                )
            ),
            leading: Icon(
                Icons.shopping_bag_outlined,
                color: screen == 2 ? Colors.blue : Colors.black45
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const JobsScreen()),
              );
            },
          ),
          ListTile(
            title: Text(
                "Internships",
                style: dmSansStyle(
                    18,
                    fontWeight: FontWeight.bold,
                    color: screen == 3 ? Colors.blue : Colors.black45
                )
            ),
            leading: Icon(
                Icons.card_travel,
                color: screen == 3 ? Colors.blue : Colors.black45
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InternshipsScreen()),
              );
            },
          ),
          ListTile(
            title: Text(
                "Success Signal",
                style: dmSansStyle(
                    18,
                    fontWeight: FontWeight.bold,
                    color: screen == 4 ? Colors.blue : Colors.black45
                )
            ),
            leading: Icon(
                Icons.playlist_add_check,
                color: screen == 4 ? Colors.blue : Colors.black45
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
                "How it works?",
                style: dmSansStyle(
                    18,
                    fontWeight: FontWeight.bold,
                    color: screen == 5 ? Colors.blue : Colors.black45
                )
            ),
            leading: Icon(
                Icons.how_to_reg_outlined,
                color: screen == 5 ? Colors.blue : Colors.black45
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
                "FAQs",
                style: dmSansStyle(
                    18,
                    fontWeight: FontWeight.bold,
                    color: screen == 6 ? Colors.blue : Colors.black45
                )
            ),
            leading: Icon(
                Icons.question_answer_outlined,
                color: screen == 6 ? Colors.blue : Colors.black45
            ),
            onTap: () {},
          ),
          const ListTile(),
          ListTile(
            title: Text("\t\tLogout", style: dmSansStyle(18, fontWeight: FontWeight.bold, color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())
              );
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      )
  );
}