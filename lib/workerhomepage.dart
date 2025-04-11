import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'jobdetail.dart';
import 'package:flutter_app/workprof.dart';
import 'models/job.dart';
import 'earnings.dart';
import 'myjobspage.dart';
import 'chat.dart';

class WorkerHomePage extends StatefulWidget {
  const WorkerHomePage({super.key});

  @override
  State<WorkerHomePage> createState() => _WorkerHomePageState();
}

class _WorkerHomePageState extends State<WorkerHomePage> {
  bool isAvailable = true;

  final List<Job> jobRequests = [
    Job(
      client: "Arun Kumar",
      title: "Electrical wiring fix",
      description: "Fix faulty wiring in living room and kitchen.",
      dateTime: "April 5, 2025 - 2:30 PM",
      location: "No. 12, Anna Nagar, Chennai",
    ),
    Job(
      client: "Priya S",
      title: "Tap leakage repair",
      description: "Repair leaky kitchen tap and check pressure.",
      dateTime: "April 6, 2025 - 11:00 AM",
      location: "45, Velachery Main Rd, Chennai",
    ),
    Job(
      client: "Rahul D",
      title: "Fan installation",
      description: "Install ceiling fan in study room.",
      dateTime: "April 2, 2025 - 4:00 PM",
      location: "23, Adyar, Chennai",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Fix-it',
          style: GoogleFonts.permanentMarker(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff2D93A5),
        toolbarHeight: 70,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff2D93A5)),
              accountName: const Text('Welcome, Worker!'),
              accountEmail: const Text('worker@email.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xff666666)),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dashboard),
                    title: const Text('Dashboard'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                         MaterialPageRoute(builder: (context) => const WorkerProfilePage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.work),
                    title: const Text('My Jobs'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyJobsPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Earnings'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EarningsPage()));},
                  ),
                ],
              ),

            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Availability Toggle
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Availability:',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          isAvailable ? "Available" : "Busy",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: isAvailable ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Switch(
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.red.shade200,
                          value: isAvailable,
                          onChanged: (value) {
                            setState(() {
                              isAvailable = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Incoming Job Requests',
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              // Job Cards
              ...jobRequests.map((job) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Client: ${job.client}", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          Text("Job: ${job.title}", style: GoogleFonts.poppins(color: Colors.grey.shade600)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => JobDetailsPage(job: job)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2D93A5),
                        ),
                        child: Text("View", style: GoogleFonts.poppins(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const chat()));
        },
        backgroundColor: const Color(0xff2D93A5),
        child: const Icon(Icons.chat),
      ),
    );
  }
}