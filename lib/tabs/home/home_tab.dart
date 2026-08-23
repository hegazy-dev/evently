import 'package:evently/models/event_model.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/tabs/home/home_header.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:evently/widgets/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);

    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(eventsProvider.events[index]),
            itemCount: eventsProvider.events.length,
            separatorBuilder: (_, _) => SizedBox(height: 16),
          ),
        ),
      ],
    );
  }
}
