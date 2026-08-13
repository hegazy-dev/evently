import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;

  TabItem({required this.label, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        color: isSelected ? primaryColor : AppTheme.white,
        border: Border.all(color: AppTheme.offWhite),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? AppTheme.white : primaryColor),
          SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
