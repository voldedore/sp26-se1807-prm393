import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

// PRODUCER - RIVERPOD

class _ScreenOneState extends State<ScreenOne> {
  String _textFieldOne = '';
  TextEditingController _fieldTwoController = TextEditingController();
  bool _checkboxVal = false;
  int _radioVal = 1;

  @override
  void dispose() {
    _fieldTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          // spacing: 6,
          children: [
            Text('Widgets', style: Theme.of(context).textTheme.headlineLarge),
            Divider(),
            Text('Text fields', style: Theme.of(context).textTheme.headlineMedium),
            TextField(
              decoration: InputDecoration(
                labelText: 'Field one',
                hintText: 'Enter you text', // placeholder
              ),
              onChanged: (value) {
                setState(() {
                  // re-render UI
                  _textFieldOne = value;
                });
              },
            ),
            Text('You just typed: $_textFieldOne'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Field two',
                hintText: 'Enter your secret',
              ),
              keyboardType: TextInputType.number,
              controller: _fieldTwoController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text('You just typed: ${_fieldTwoController.text}'),
            Divider(),
            Text('Checkbox', style: Theme.of(context).textTheme.headlineMedium),
            Row(

              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Checkbox(value: false, onChanged: (value) {}),
                Checkbox(value: null, tristate: true, onChanged: (value) {}),
              ],
            ),
            ListTile(
              title: Text('Checkbox label'),
              leading: Checkbox(value: true, onChanged: (v) {}),
            ),
            CheckboxListTile(
              value: _checkboxVal,
              title: Text('Checkbox (Recommended)'),
              onChanged: (value) {
                setState(() {
                  _checkboxVal = value!;
                });
              },
            ),
            Divider(),
            Text('Radio', style: Theme.of(context).textTheme.headlineMedium),
            RadioGroup<int>(
              onChanged: (value) {
                setState(() {
                  _radioVal = value!;
                });
              },
              groupValue: _radioVal,
              child: Column(

                children: [
                  RadioListTile(value: 1, title: Text('Option 1')),
                  RadioListTile(value: 2, title: Text('Option 2')),
                  RadioListTile(value: false, title: Text('Option 3')),
                ],
              ),
            ),
            // Slider
            Slider(value: 0.5, onChanged: (v) {}),
            // Switch
            SwitchListTile(
              value: true,
              title: Text('Dark theme'),
              onChanged: (v) {},
            ),
            // Dropdown
            DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'one', label: 'One'),
                DropdownMenuEntry(value: 'tow', label: 'Two'),
                DropdownMenuEntry(value: 'three', label: 'Three'),
              ],
              initialSelection: 'one',
            ),
          ],
        ),
      ),
    );
  }
}
