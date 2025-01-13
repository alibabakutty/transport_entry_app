import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  const InputField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 4.0), // Reduced vertical spacing between fields
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true, // Reduces the default height
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
            ),
            style: const TextStyle(fontSize: 14), // Optional: compact font size
          ),
        ],
      ),
    );
  }
}
