import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:thozhil_flutter_app/screens/drawer.dart';
import 'package:thozhil_flutter_app/screens/login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late double maxWidth;
  late double maxHeight;
  TextStyle dmSansStyle(double size, {FontWeight fontWeight = FontWeight.normal, Color color = Colors.black}) {
    return GoogleFonts.dmSans(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }


  // Dashboard cards
  Widget dashboardCard(Color color, String text, int n) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: maxWidth / 2 - 22,
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              child: Container(
                color: color,
                constraints: const BoxConstraints(
                  maxHeight: 250,
                  maxWidth: 20,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: dmSansStyle(15, fontWeight: FontWeight.bold, color: color),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      "$n",
                      style: dmSansStyle(20.0, fontWeight: FontWeight.bold, color: Colors.black54)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    maxHeight = MediaQuery.of(context).size.height;

    var assetsImage = const AssetImage('assets/thozhil_logo.png');
    var image = Image(image: assetsImage, fit: BoxFit.cover, height: 30);

    Map<String, double> dataMap = {
      "Applied":10, "Approved":3, "Rejected":7
    };
  
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
      drawer: getDrawer(context, 1),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Dashboard",
                    style: dmSansStyle(20.0, fontWeight: FontWeight.bold, color: Colors.blue)
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    dashboardCard(Colors.purple, "Applied Applications", dataMap["Applied"]!.toInt()),
                    dashboardCard(Colors.green, "Approved Applications", dataMap["Approved"]!.toInt()),
                  ],
                ),
                Row(
                  children: [
                    dashboardCard(Colors.lightBlue, "Rejected Applications", dataMap["Rejected"]!.toInt()),
                    dashboardCard(Colors.orange, "Success Signals", 0),
                  ],
                ),
                const SizedBox(height: 20),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Interview Schedule",
                              style: dmSansStyle(20.0, fontWeight: FontWeight.bold, color: Colors.black45)
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "No future meetings scheduled.",
                            style: dmSansStyle(15, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Revenue Score",
                              style: dmSansStyle(20.0, fontWeight: FontWeight.bold, color: Colors.black45)
                          ),
                          const SizedBox(height: 10),
                          PieChart(
                            dataMap: dataMap,
                            colorList: const [Colors.purple, Colors.green, Colors.lightBlue],
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValues: false
                            ),
                            legendOptions: LegendOptions(
                              legendTextStyle: dmSansStyle(15, color: Colors.grey)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}