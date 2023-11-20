import 'package:mobile/Widgets/reminder_list/reminder_card.dart';
import 'package:mobile/models/reminder.dart';
import 'package:flutter/material.dart';

class ReminderList extends StatelessWidget {
  ReminderList(
      {super.key, required this.onRemoveReminder, required this.reminders});

  final List<Reminder> reminders;
  final void Function(Reminder reminder) onRemoveReminder;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminders.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(reminders[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.6),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) {
          onRemoveReminder(reminders[index]);
        },
        
        child: ReminderItem(reminders[index]),
      ),
    );
  }
}
