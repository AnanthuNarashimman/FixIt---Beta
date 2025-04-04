import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'paymentpage.dart';

class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  final List<Map<String, dynamic>> bookings = const [
    {
      'workerName': 'John Doe',
      'category': 'Plumber',
      'status': 'Pending',
      'fee': 200
    },
    {
      'workerName': 'Jane Smith',
      'category': 'Electrician',
      'status': 'Accepted',
      'fee': 300
    },
    {
      'workerName': 'Raj Kumar',
      'category': 'Photographer',
      'status': 'Declined',
      'fee': 150
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings', style: GoogleFonts.permanentMarker(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 45, 147, 165),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          final status = booking['status'];

          Color statusColor;
          switch (status) {
            case 'Accepted':
              statusColor = Colors.green;
              break;
            case 'Pending':
              statusColor = Colors.orange;
              break;
            case 'Declined':
              statusColor = Colors.red;
              break;
            default:
              statusColor = Colors.grey;
          }

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                booking['workerName'],
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${booking['category']} | ₹${booking['fee']}', style: GoogleFonts.poppins()),
                  const SizedBox(height: 4),
                  Text(
                    'Status: ${booking['status']}',
                    style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: status == 'Accepted'
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PaymentPage(
                              workerName: booking['workerName'],
                              fee: booking['fee'],
                            ),
                          ),
                        );
                      },
                      child: const Text('Pay Now'),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}