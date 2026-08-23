import 'package:evently/models/event_model.dart';
import 'package:evently/widgets/firebase_service.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> events = [];

  Future<void> getEvents() async {
    events = await FirebaseService.getEvents();
    notifyListeners();
  }
}
