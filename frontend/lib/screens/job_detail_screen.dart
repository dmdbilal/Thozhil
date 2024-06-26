import 'package:flutter/material.dart';
import 'package:thozhil_flutter_app/util/util_functions.dart';

import '../util/job.dart';

class JobDetailsScreen extends StatefulWidget {
  // late Job job;

  JobDetailsScreen({super.key}) {
    // job = job;
  }

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late double maxWidth;
  late double maxHeight;

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                      'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=595&height=400&name=image8-2.jpg',
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
                    )
                ),
                const SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Role name",
                        style: dmSansStyle(20, fontWeight: FontWeight.bold)
                    ),
                    Text(
                        "Company name",
                        style: dmSansStyle(15)
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Row(
                            children: [
                              Icon(Icons.place, color: Colors.grey, size: 20),
                              Text("Location", style: dmSansStyle(15, color: Colors.grey))
                            ]
                        ),
                        const SizedBox(width: 30),
                        Row(
                            children: [
                              Icon(Icons.money, color: Colors.grey, size: 20),
                              Text("Salary", style: dmSansStyle(15, color: Colors.grey))
                            ]
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(color: Colors.black12)
                      ),
                      color: Colors.white,
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Job Summary",
                                style: dmSansStyle(
                                    20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                )
                            ),
                            const SizedBox(height: 10),
                            const Text(
                                    "Published On: 10-06-2024\n" +
                                    "Vacancies: 10 Positions\n" +
                                    "Job Nature: Full-time\n" +
                                    "Salary: ₹Earnings discussed during interview\n" +
                                    "Work Location: Bengaluru\n" +
                                    "Deadline: 10-10-2024\n" +
                                    "Experience: Fresher & Experienced"
                            )
                          ],
                        ),
                      )
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Job Description",
                    style: dmSansStyle(20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Text(
                      "We are looking for a proactive lead generation executive for our sales team who will be responsible for identifying and qualifying potential leads through various social media channels. The ideal candidate will have a strong understanding of social media platforms and how to leverage them for lead-generation purposes.",
                      style: dmSansStyle(15, color: Colors.grey)
                  ),

                  const SizedBox(height: 20),
                  Text(
                      "Qualifications",
                      style: dmSansStyle(20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Text(
                      "Any Degree",
                      style: dmSansStyle(15, color: Colors.grey)
                  ),

                  const SizedBox(height: 20),
                  Text(
                      "Required Skills",
                      style: dmSansStyle(20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Text(
                      "CRM Effective Communication English Proficiency (Written) Lead Generation MS-Office Sales.",
                      style: dmSansStyle(15, color: Colors.grey)
                  ),

                  const SizedBox(height: 20),
                  Text(
                      "Responsibilities",
                      style: dmSansStyle(20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),
                  Text(
                      "Key responsibilities: 1. Utilize social media channels like LinkedIn, Instagram Facebook, etc., to identify and connect with content creators. 2. Engage with prospects through direct messaging and relevant content sharing to foster interest in our services. 3. Qualify leads by understanding their content creation needs and objectives. 4. Schedule appointments for our sales representatives with qualified content creators. 5. Maintain accurate records of interactions and lead status in our CRM system. What we offer: 1. An environment conducive to high-paced learning. 2. Limitless opportunities for rapid professional growth. 3. A culture of high autonomy and ownership, free from micromanagement. 4. Collaborative involvement with a team boasting a proven track record (yes, we achieved over 1 million DAUs in our past startup). 5. The chance to contribute to the future by being a part of the emerging creator economy.",
                      style: dmSansStyle(15, color: Colors.grey)
                  ),

                  const SizedBox(height: 20),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: Colors.blue),
                            ),
                            minimumSize: Size(maxWidth/2 - 20, 50),
                            backgroundColor: Colors.white,
                            elevation: 0
                        ),
                        child: Text(
                            'Similar Jobs',
                            style: dmSansStyle(
                                20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue
                            )
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            minimumSize: Size(maxWidth/2 - 20, 50),
                            backgroundColor: Colors.blue,
                            elevation: 0
                        ),
                        child: Text(
                            'Apply Now',
                            style: dmSansStyle(
                                20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
