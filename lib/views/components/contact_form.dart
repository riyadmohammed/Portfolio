import 'package:flutter/material.dart';
import 'dart:html' as html;

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Contact Me', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 12),
          TextFormField(
            controller: _name,
            decoration: const InputDecoration(labelText: "Your Name"),
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _message,
            maxLines: 4,
            decoration: const InputDecoration(labelText: "Your Message"),
            validator: (value) => value!.isEmpty ? "Required" : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text("Send"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final uri = Uri(
                  scheme: 'mailto',
                  path: 'your.email@example.com',
                  query:
                  'subject=Contact from Portfolio&body=${_message.text}\n\nFrom: ${_name.text}',
                );
                html.window.open(uri.toString(), '_blank');
              }
            },
          ),
        ],
      ),
    );
  }
}
