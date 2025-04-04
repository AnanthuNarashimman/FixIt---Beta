import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Plumber', 'icon': Icons.plumbing},
    {'title': 'Electrician', 'icon': Icons.electrical_services},
    {'title': 'Carpenter', 'icon': Icons.construction},
    {'title': 'Tailor', 'icon': Icons.checkroom},
    {'title': 'Photographer', 'icon': Icons.camera_alt},
    {'title': 'DJ', 'icon': Icons.music_note},
    {'title': 'Mechanic', 'icon': Icons.build},
    {'title': 'Cook', 'icon': Icons.restaurant_menu},
    {'title': 'Painter', 'icon': Icons.format_paint},
    {'title': 'Driver', 'icon': Icons.directions_car},
    {'title': 'Maid', 'icon': Icons.cleaning_services},
    {'title': 'Technician', 'icon': Icons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        title: Text('Categories', style: GoogleFonts.permanentMarker(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 45, 147, 165),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                // Handle category tap
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category['icon'], size: 40, color: const Color(0xff6b62f6)),
                    const SizedBox(height: 10),
                    Text(
                      category['title'],
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}