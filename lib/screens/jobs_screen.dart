import 'package:flutter/material.dart';
import 'package:thozhil_flutter_app/screens/filter_screen.dart';
import 'package:thozhil_flutter_app/screens/job_detail_screen.dart';
import '../util/util_functions.dart';
import 'drawer.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  late double maxWidth;
  late double maxHeight;

  Widget jobCard(
      BuildContext context,
      String name,
      String role,
      String location,
      double salary,
      int DOP, // Day of posting
      VoidCallback onTap
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(color: Colors.black12)
      ),
      color: Colors.white,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: maxWidth,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: dmSansStyle(20, fontWeight: FontWeight.bold),
                ),
                Text(
                  role,
                  style: dmSansStyle(16, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.place, color: Colors.grey, size: 20,),
                    SizedBox(width: 10,),
                    Text(
                      location,
                      style: dmSansStyle(15, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.money, color: Colors.grey, size: 20),
                    SizedBox(width: 10,),
                    Text(
                      salary.toString(),
                      style: dmSansStyle(15, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Text(
                  "${DOP.toString()}d ago",
                  style: dmSansStyle(15, color: Colors.black38),
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage('assets/thozhil_logo.png');
    var image = Image(image: assetsImage, fit: BoxFit.cover, height: 30);
    maxWidth = MediaQuery.of(context).size.width;
    maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.blue, size: 35)
            );
          },
        ),
        title: Container(
          color: Colors.white,
          child: Center(
            child: image,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications, color: Colors.blue, size: 30)
          )
        ],
      ),
      drawer: getDrawer(context, 2),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Jobs",
                      style: dmSansStyle(20.0, fontWeight: FontWeight.bold, color: Colors.blue)
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.search)
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FilterScreen())
                            );
                          },
                          icon: const Icon(Icons.filter_alt)
                      ),
                    ],
                  ),
                ]),
            Expanded(
                child: ListView(
                  children: [
                    jobCard(context, "Google", "Software Engineer", "Mountain View, CA", 150000, 2, (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Microsoft", "Data Scientist", "Redmond, WA", 130000, 1, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Apple", "UI/UX Designer", "Cupertino, CA", 120000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Amazon", "Cloud Architect", "Seattle, WA", 140000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Facebook", "Product Manager", "Menlo Park, CA", 160000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Netflix", "DevOps Engineer", "Los Gatos, CA", 135000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Tesla", "Mechanical Engineer", "Palo Alto, CA", 125000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Twitter", "Backend Developer", "San Francisco, CA", 145000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "IBM", "AI Researcher", "Armonk, NY", 150000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                    jobCard(context, "Intel", "Hardware Engineer", "Santa Clara, CA", 130000, 2, (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen())
                      );
                    }),
                  ],
                )
            )
          ],
        )
      )
    );
  }
}
