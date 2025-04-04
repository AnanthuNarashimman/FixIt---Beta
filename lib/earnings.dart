import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  final List<Map<String, dynamic>> jobEarnings = const [
    {
      'job': 'Electrical wiring fix',
      'amount': 1200,
      'date': 'April 5, 2025',
    },
    {
      'job': 'Tap leakage repair',
      'amount': 800,
      'date': 'April 6, 2025',
    },
    {
      'job': 'Fan installation',
      'amount': 1000,
      'date': 'April 2, 2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final totalEarnings = jobEarnings.fold(0, (sum, job) => sum + job['amount'] as int);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Earnings',
          style: GoogleFonts.permanentMarker(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff2D93A5),
      ),
      backgroundColor: const Color(0xffF8FAFC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Earnings Summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff2D93A5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Earnings", style: GoogleFonts.poppins(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text("₹ $totalEarnings", style: GoogleFonts.poppins(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("${jobEarnings.length} jobs completed", style: GoogleFonts.poppins(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Recent Jobs Section
            Text(
              'Recent Payments',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: jobEarnings.length,
                itemBuilder: (context, index) {
                  final job = jobEarnings[index];
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
                            Text(job['job'], style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text(job['date'], style: GoogleFonts.poppins(color: Colors.grey.shade600)),
                          ],
                        ),
                        Text("₹ ${job['amount']}", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}