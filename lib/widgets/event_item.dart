import 'package:evently/app_theme.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/settings_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventModel event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    bool isFavorite = userProvider.checkIsEventFavorite(event.id);
    bool isDark = Provider.of<SettingsProvider>(context).isDark;
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/${event.category.imageName}.png',
            height: screenSize.height * 0.23,
            width: double.infinity,
            fit: .fill,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.backgroundDark : AppTheme.backgroundLight,
            border: Border.all(
              color: isDark ? AppTheme.borderDark : AppTheme.offWhite,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            DateFormat('dd MMM').format(event.dateTime),
            style: textTheme.titleMedium?.copyWith(
              color: primaryColor,
              fontWeight: .w700,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark
                  ? AppTheme.backgroundDark
                  : AppTheme.backgroundLight,
              border: Border.all(
                color: isDark ? AppTheme.borderDark : AppTheme.offWhite,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: .w500,
                      color: isDark ? AppTheme.white : AppTheme.black,
                    ),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (isFavorite) {
                      userProvider.removeEventFromFavorites(event.id);
                      Provider.of<EventsProvider>(
                        context,
                        listen: false,
                      ).filterFavoriteEvents(
                        userProvider.currentUser!.favoriteEventsIds,
                      );
                    } else {
                      userProvider.addEventToFavorites(event.id);
                    }
                  },
                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
