import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String selectedRole;
  final ValueChanged<String?> onChanged;

  CustomDropdown({required this.selectedRole, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedRole,
      decoration: InputDecoration(labelText: 'Select Role'),
      items: ['Employee', 'Admin']
          .map((role) => DropdownMenuItem<String>(
        value: role,
        child: Text(role),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
