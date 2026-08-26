import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late EventsProvider eventsProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> favoriteEventsIds = Provider.of<UserProvider>(
        context,
        listen: false,
      ).currentUser!.favoriteEventsIds;
      eventsProvider.filterFavoriteEvents(favoriteEventsIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: 'Search for event',
            suffixIconImageName: 'search',
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  EventItem(eventsProvider.favoriteEvents[index]),
              itemCount: eventsProvider.favoriteEvents.length,
              separatorBuilder: (_, _) => SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
