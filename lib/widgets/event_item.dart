import 'package:evently/app_theme.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
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
            color: AppTheme.backgroundLight,
            border: Border.all(color: AppTheme.offWhite),
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
              color: AppTheme.backgroundLight,
              border: Border.all(color: AppTheme.offWhite),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: textTheme.titleSmall?.copyWith(fontWeight: .w500),
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.favorite_border_outlined),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
