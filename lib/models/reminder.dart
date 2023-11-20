import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Categories { syrup, tablet, capsule, drop, inhaler, injection }
enum Frequency { daily, weekly, monthly, yearly}

var categoryIcons = {
  Categories.syrup: 'assets/icons/syrup.png',
  Categories.tablet: 'assets/icons/tablets.png',
  Categories.capsule: 'assets/icons/capsule.png',
  Categories.drop: 'assets/icons/drop.png',
  Categories.inhaler: 'assets/icons/inhaler.png',
  Categories.injection: 'assets/icons/injection.png',
};

var categoryValue = {
  Categories.syrup: 'syrup',
  Categories.tablet: 'tablet',
  Categories.capsule: 'capsule',
  Categories.drop: 'drop',
  Categories.inhaler: 'inhaler',
  Categories.injection: 'injection',
};
var categoryUnit = {
  Categories.syrup: 'ml',
  Categories.tablet: 'pcs',
  Categories.capsule: 'pcs',
  Categories.drop: 'drop',
  Categories.inhaler: 'press',
  Categories.injection: 'ml',
};
class Reminder {
  Reminder({
    required this.name,
    required this.description,
    required this.quantity,
    required this.quantityUnit,
    required this.interval,
    required this.color,
    required this.categ,

  }) : id = uuid.v4();

  final String id;
  final String name;
  final String description;
  final double quantity;
  final String quantityUnit;
  // final Frequency frequency;
  final String interval;
  final String color;
  final Categories categ;

}

class ReminderBucket {
  const ReminderBucket({
    required this.category,
    required this.reminders,
  });

  ReminderBucket.forCategory(
    List<Reminder> allReminders,
    this.category,
  ) 
  : reminders = allReminders
    .where((reminder) => reminder.categ == category).toList();
  final Categories category;
  final List<Reminder> reminders;

}
