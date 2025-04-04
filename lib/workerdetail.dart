import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerDetailPage extends StatefulWidget {
  final String name;
  final String profession;
  final double rating;

  const WorkerDetailPage({
    super.key,
    required this.name,
    required this.profession,
    required this.rating,
  });

  @override
  State<WorkerDetailPage> createState() => _WorkerDetailPageState();
}

class _WorkerDetailPageState extends State<WorkerDetailPage> {
  bool isRequested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Details', style: GoogleFonts.permanentMarker(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 45, 147, 165),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 60, color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.name, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Text('${widget.profession} • ★ ${widget.rating}', style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700])),
            const SizedBox(height: 20),
            Text('Qualifications', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              '• Certified Electrician\n• 5 years of experience\n• Expert in residential wiring and troubleshooting.',
              style: TextStyle(fontSize: 15),
            ),
             const SizedBox(height: 20),
            Text('About', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'I am a passionate and experienced electrician dedicated to providing top-notch service to all my clients.',
              style: TextStyle(fontSize: 15),
            ),
            Text('Pricing', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              '₹700',
              style: TextStyle(fontSize: 15),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: isRequested
                    ? null
                    : () {
                        setState(() {
                          isRequested = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Hire request sent!')),
                        );
                      },
                icon: Icon(
                  isRequested ? Icons.check_circle : Icons.send,
                  color: Colors.white,
                ),
                label: Text(
                  isRequested ? 'Requested' : 'Hire Now',
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isRequested ? Colors.grey : const Color.fromARGB(255, 45, 147, 165),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}