import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms_flutter/constants/images.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Color white = Color(0xffF8F6F6);

  final List<Map<String, dynamic>> leaveData = [
    {
      "count": "6",
      "title": "Total Leaves Applied",
      "icon": Icons.calendar_today,
      "cardColor": Colors.blue,
    },
    {
      "count": "3",
      "title": "Approved Leaves",
      "icon": Icons.check_circle_outline,
      "cardColor": Colors.green,
    },
    {
      "count": "3",
      "title": "Rejected Leaves",
      "icon": Icons.cancel,
      "cardColor": Colors.red,
    },
    {
      "count": "0",
      "title": "Pending Leaves",
      "icon": Icons.pending,
      "cardColor": Colors.orange,
    },
    {
      "count": "365",
      "title": "Total Paid Leaves",
      "icon": Icons.account_balance_wallet, // Default icon
      "cardColor": Colors.purple, // Default color
    },
    {
      "count": "3",
      "title": "Used Paid Leaves",
      "icon": Icons.account_balance_wallet, // Default icon
      "cardColor": Colors.purple, // Default color
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge(child: Icon(Icons.notifications_none)))
        ],
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lets get to work",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ).paddingOnly(right: 5),
                        Image.asset(
                          writing,
                          height: 26,
                          width: 26,
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(Colors.blue),
                        ),
                        child: Text("Clock In"),
                      ),
                    ).paddingSymmetric(horizontal: 20, vertical: 12),
                    Text(
                      "Your hours will be calculated here",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ).paddingAll(16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leaves",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                FilledButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.blue),
                    ),
                    child: Text("Apply Leave"))
              ],
            ).paddingSymmetric(vertical: 10),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5, // Adjust aspect ratio for better layout
              ),
              itemCount: leaveData.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              leaveData[index]["count"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              leaveData[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      color: leaveData[index]["cardColor"]!,
                      child: Icon(leaveData[index]["icon"]!, color: white)
                          .paddingAll(6),
                    )
                  ],
                );
              },
            ),
          ],
        ).paddingAll(16),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
