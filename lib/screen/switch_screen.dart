import 'package:flutter/material.dart';
class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});
  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}
class _SwitchScreenState extends State<SwitchScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Screen'),
      ),
      body: Center(
        child: Switch(
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
            });
          },
        ),
      ),
    );
  }
}