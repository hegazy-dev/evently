import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:evently/ui_utils.dart';
import 'package:evently/widgets/default_elevated_button.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:evently/widgets/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = '/create-event';

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int currentIndex = 0;
  CategoryModel selectedCategory = CategoryModel.categories.first;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Add Event')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: .circular(16),
              child: Image.asset(
                'assets/images/sport.png',
                height: MediaQuery.sizeOf(context).height * 0.23,
                width: double.infinity,
                fit: .fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: DefaultTabController(
              length: CategoryModel.categories.length,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: .start,
                labelPadding: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(vertical: 16),
                onTap: (index) {
                  if (currentIndex == index) return;
                  currentIndex = index;
                  selectedCategory = CategoryModel.categories[currentIndex];
                  setState(() {});
                },
                tabs: CategoryModel.categories
                    .map(
                      (Category) => TabItem(
                        label: Category.name,
                        icon: Category.icon,
                        isSelected:
                            currentIndex ==
                            CategoryModel.categories.indexOf(Category),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Title', style: textTheme.titleMedium),
                  SizedBox(height: 8),
                  DefaultTextFormField(
                    hintText: 'Event Title',
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        'Title can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Text('Description', style: textTheme.titleMedium),
                  SizedBox(height: 8),
                  DefaultTextFormField(
                    hintText: 'Event Description',
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        'description can not be empty';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/date.svg',
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      SizedBox(width: 4),
                      Text('Event Date', style: textTheme.titleMedium),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            initialDate: selectedDate,
                            initialEntryMode: .calendarOnly,
                          );
                          if (date == null) return;
                          selectedDate = date;
                          setState(() {});
                        },
                        child: Text(
                          selectedDate == null
                              ? 'Choose Date'
                              : dateFormat.format(selectedDate!),
                          style: textTheme.titleSmall?.copyWith(
                            color: primaryColor,
                            decoration: .underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/time.svg',
                        height: 24,
                        width: 24,
                        fit: .scaleDown,
                      ),
                      SizedBox(width: 4),
                      Text('Event Time', style: textTheme.titleMedium),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: selectedTime ?? TimeOfDay.now(),
                          );
                          if (time == null) return;
                          selectedTime = time;
                          setState(() {});
                        },
                        child: Text(
                          selectedTime == null
                              ? 'Choose Time'
                              : selectedTime!.format(context),
                          style: textTheme.titleSmall?.copyWith(
                            color: primaryColor,
                            decoration: .underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  DefaultElevatedButton(
                    label: 'Add Event',
                    onPressed: addEvent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      EventModel event = EventModel(
        category: selectedCategory,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: dateTime,
      );
      FirebaseService.createEvent(event)
          .then((_) {
            Navigator.of(context).pop();
            UiUtils.showSuccessMessage('Event created successfully');
          })
          .catchError((_) {
            UiUtils.showErrorMessage('Failed to create event');
          });
    }
  }
}
