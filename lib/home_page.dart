import 'package:flutter/material.dart';
import 'package:transport_entry_app/widgets/expense_row.dart';
import 'package:transport_entry_app/widgets/header_section.dart';
import 'package:transport_entry_app/widgets/input_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Create a global key for the form
  final _formKey = GlobalKey<FormState>();

  // Function to handle form submission
  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );

      // You can process the form data here (e.g., send to an API or save locally)
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trip Sheet Entry',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color.fromARGB(255, 221, 235, 246),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                const HeaderSection(),

                // Input Fields Section
                const InputField(label: 'No.'),
                const InputField(label: 'Job No.'),
                const InputField(label: 'Date'),
                const InputField(label: 'Vehicle No.'),
                const InputField(label: 'From Location'),
                const InputField(label: 'To Location'),
                const SizedBox(height: 10),

                // Diesel Section
                Row(
                  children: const [
                    Expanded(child: InputField(label: 'Diesel')),
                    SizedBox(width: 8),
                    Expanded(child: InputField(label: 'Amount')),
                  ],
                ),
                const InputField(label: 'Driver Name'),
                const InputField(label: 'Cleaner Name'),
                const InputField(label: 'Container No.'),
                const SizedBox(height: 10),

                // ** Claim and Approve Headers (only for the first ExpenseRow) **
                const ExpenseRow(label: 'Advance', isFirstRow: true),
                const ExpenseRow(label: 'M.T.Expenses'),
                const ExpenseRow(label: 'Toll'),
                const ExpenseRow(label: 'Driver Charges'),
                const ExpenseRow(label: 'Cleaner Charges'),
                const ExpenseRow(label: 'R.T.O./ Police'),
                const ExpenseRow(label: 'Harbour Expenses'),
                const ExpenseRow(label: 'Driver Expenses'),
                const ExpenseRow(label: 'Weight Charges'),
                const ExpenseRow(label: 'Loading Charges'),
                const ExpenseRow(label: 'Unloading Charges'),
                const ExpenseRow(label: 'Other Expenses'),
                const SizedBox(height: 10),

                // Total, Advance, Balance
                const ExpenseRow(label: 'Total'),
                const ExpenseRow(label: 'Advance'),
                const ExpenseRow(label: 'Balance'),

                // Verification Section
                const InputField(label: 'Verified By'),
                const InputField(label: 'Passed'),
                const InputField(label: 'Driver'),

                const SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () => _handleSubmit(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
