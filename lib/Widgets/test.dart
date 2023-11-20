import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
    throw _TimePickerScreenState();
  }
}


class _TimePickerScreenState extends State<TimePickerScreen> {
  List<TimeOfDay> selectedTimes = [];

  void _addNewTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null && !selectedTimes.contains(newTime)) {
      setState(() {
        selectedTimes.add(newTime);
      });
    }
  }

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < selectedTimes.length; i++) {
      Widget item = Chip(
        label: Text(selectedTimes[i].format(context)),
        onDeleted: () {
          setState(() {
            selectedTimes.removeAt(i);
          });
        },
        deleteIcon: Icon(Icons.close),
      );
      chips.add(item);
    }

    return Wrap(
      spacing: 8.0,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ElevatedButton(
            onPressed: _addNewTime,
            child: Text('Add Time'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: TextEditingController(), // This will be a dummy controller
              decoration: const InputDecoration(
                labelText: 'Selected Times',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Prevent the keyboard from showing
              onTap: _addNewTime, // Open the time picker when the field is tapped
            ),
          ),
          _buildChips(),
        ],
    );
  }
}
