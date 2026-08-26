import 'package:evently/models/user_model.dart';
import 'package:evently/widgets/firebase_service.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsEventFavorite(String eventId) =>
      currentUser!.favoriteEventsIds.contains(eventId);

  void addEventToFavorites(String eventId) {
    FirebaseService.addEventToFavorites(eventId);
    currentUser!.favoriteEventsIds.add(eventId);
    notifyListeners();
  }

  void removeEventFromFavorites(String eventId) {
    FirebaseService.removeEventFromFavorites(eventId);
    currentUser!.favoriteEventsIds.remove(eventId);
    notifyListeners();
  }
}
