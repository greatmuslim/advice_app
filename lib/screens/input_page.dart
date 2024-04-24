import 'package:advice_app/theme.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Advice',
          style: TextStyle(
            color: primaryColor3,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: primaryColor2,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: AdviceForm(),
      ),
    );
  }
}

class AdviceForm extends StatefulWidget {
  const AdviceForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdviceFormState createState() => _AdviceFormState();
}

class _AdviceFormState extends State<AdviceForm> {
  final TextEditingController _adviceController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _adviceController,
          decoration: const InputDecoration(
            labelText: 'Advice',
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _authorController,
          decoration: const InputDecoration(
            labelText: 'Your Name (Optional)',
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor2),
          ),
          onPressed: () {
            _submitAdvice(context);
          },
          child: const Text(
            'Submit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor3,
            ),
          ),
        ),
      ],
    );
  }

  void _submitAdvice(BuildContext context) {
    // Validate inputs
    if (_adviceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your advice.'),
        ),
      );
      return;
    }

    // * Save advice to the database (you'll implement this part later)

    // Clear input fields
    _adviceController.clear();
    _authorController.clear();

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Advice submitted successfully!'),
      ),
    );
  }
}
