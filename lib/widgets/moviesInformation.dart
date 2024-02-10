import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.start,
            style: GoogleFonts.raleway(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 15
            ),
          ),
        ],
      ),
    );
  }
}
