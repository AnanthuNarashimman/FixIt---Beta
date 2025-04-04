import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyJobsPage extends StatefulWidget {
  const MyJobsPage({super.key});

  @override
  State<MyJobsPage> createState() => _MyJobsPageState();
}

class _MyJobsPageState extends State<MyJobsPage> {
  List<Map<String, dynamic>> jobs = [
    {
      'client': 'Arun Kumar',
      'job': 'Electrical wiring fix',
      'status': 'In Progress',
      'datetime': 'April 5, 2025 - 2:30 PM',
    },
    {
      'client': 'Priya S',
      'job': 'Tap leakage repair',
      'status': 'Pending',
      'datetime': 'April 6, 2025 - 11:00 AM',
    },
    {
      'client': 'Rahul D',
      'job': 'Fan installation',
      'status': 'Completed',
      'datetime': 'April 2, 2025 - 4:00 PM',
    },
  ];

  void markJobCompleted(int index) {
    setState(() {
      jobs[index]['status'] = 'Completed';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Job marked as completed!', style: GoogleFonts.poppins()),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Jobs',
          style: GoogleFonts.permanentMarker(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff2D93A5),
      ),
      backgroundColor: const Color(0xffF8FAFC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            final isCompleted = job['status'] == 'Completed';

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Client: ${job['client']}", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("Job: ${job['job']}", style: GoogleFonts.poppins(fontSize: 15)),
                  Text("Date/Time: ${job['datetime']}", style: GoogleFonts.poppins(color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status: ${job['status']}",
                        style: GoogleFonts.poppins(
                          color: isCompleted ? Colors.green : Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (!isCompleted)
                        ElevatedButton(
                          onPressed: () => markJobCompleted(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2D93A5),
                          ),
                          child: const Text('Mark Completed'),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}