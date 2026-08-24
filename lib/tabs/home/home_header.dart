import 'package:evently/models/category_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).currentUser!;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Welcome Back ✨', style: textTheme.titleSmall),
          SizedBox(height: 4),
          Text(user.name, style: textTheme.headlineSmall),
          DefaultTabController(
            length: CategoryModel.categories.length + 1,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: .start,
              labelPadding: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(vertical: 24),
              onTap: (index) {
                if (currentIndex == index) return;
                currentIndex = index;
                CategoryModel? selectedCategory = currentIndex == 0
                    ? null
                    : CategoryModel.categories[currentIndex - 1];
                Provider.of<EventsProvider>(
                  context,
                  listen: false,
                ).filterEvents(selectedCategory);
                setState(() {});
              },
              tabs: [
                TabItem(
                  label: 'All',
                  icon: Icons.menu,
                  isSelected: currentIndex == 0,
                ),
                ...CategoryModel.categories.map(
                  (Category) => TabItem(
                    label: Category.name,
                    icon: Category.icon,
                    isSelected:
                        currentIndex ==
                        CategoryModel.categories.indexOf(Category) + 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
