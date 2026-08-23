import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/widgets/firebase_service.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allEvents = [];
  List<EventModel> displayedEvents = [];

  Future<void> getAllEvents() async {
    allEvents = await FirebaseService.getEvents();
    displayedEvents = allEvents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? selectedCategory) {
    if (selectedCategory == null) {
      displayedEvents = allEvents;
    } else {
      displayedEvents = allEvents
          .where((event) => event.category == selectedCategory)
          .toList();
    }
    notifyListeners();
  }
}
