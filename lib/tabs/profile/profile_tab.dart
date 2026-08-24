import 'package:evently/app_theme.dart';
import 'package:evently/models/language_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).currentUser!;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/route_logo.png'),
            radius: MediaQuery.sizeOf(context).width * 0.15,
          ),
          SizedBox(height: 16),
          Text(
            user.name,
            style: textTheme.headlineSmall?.copyWith(fontWeight: .w600),
          ),
          SizedBox(height: 4),
          Text(user.email, style: textTheme.titleSmall),
          SizedBox(height: 32),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: false,
            onChanged: (value) {},
            thumbColor: WidgetStatePropertyAll(AppTheme.white),
            trackColor: WidgetStatePropertyAll(AppTheme.lightGrey),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton(
              value: 'en',
              items: LanguageModel.languages
                  .map(
                    (language) => DropdownMenuItem(
                      value: language.code,
                      child: Text(language.name),
                    ),
                  )
                  .toList(),
              onChanged: (languageCode) {},
              underline: SizedBox(),
              borderRadius: BorderRadius.circular(16),
              dropdownColor: AppTheme.white,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Logout'),
            trailing: SvgPicture.asset(
              'assets/icons/logout.svg',
              height: 24,
              width: 24,
              fit: .scaleDown,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
