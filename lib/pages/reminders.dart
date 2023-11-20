import 'package:mobile/Widgets/new_reminder.dart';
import 'package:mobile/Widgets/Report.dart';
import 'package:mobile/models/reminder.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Widgets/reminder_list/reminder_list.dart';
import 'package:mobile/Widgets/test.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});
  @override
  State<StatefulWidget> createState() {
    return _RemindersState();
  }
}

class _RemindersState extends State<Reminders> {
  final List<Reminder> _registeredReminders = [
    Reminder(
      name: 'panadol',
      description: 'oiuwngw',
      color:'White',
      // frequency: Frequency.daily,
      quantity: 50,
      quantityUnit: 'pcs',
      interval: '20',
      categ: Categories.tablet,
    ),
    Reminder(
      name: 'panadol',
      // frequency: Frequency.daily,
      interval: '20',
      color:'White',
      quantityUnit: 'pcs',
      description: 'oiuwngw',
      quantity: 50,
      categ: Categories.tablet,
    )
  ];

  void _addReminder(Reminder reminder) {
    setState(() {
      _registeredReminders.add(reminder);
    });
  }

 void _submitReport(Report report) {
    setState(() {
      //
    });
  }
  void _removeReminders(Reminder reminder) {
    final reminderIndex = _registeredReminders.indexOf(reminder);
    setState(() {
      _registeredReminders.remove(reminder);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Reminder Deleted!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredReminders.insert(reminderIndex, reminder);
            });
          },
        ),
      ),
    );
  }

  void _openAddReminderOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewReminder(
        _addReminder,
      ),
    );
  }

  void _openReportOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Report(_submitReport),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Reminders Found!'),
    );
    if (_registeredReminders.isNotEmpty) {
      mainContent = ReminderList(
          reminders: _registeredReminders, onRemoveReminder: _removeReminders);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('MedRem'),
        actions: [
          IconButton(
            onPressed: _openReportOverlay,
            icon: const Icon(Icons.note_add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: _openAddReminderOverlay,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}
