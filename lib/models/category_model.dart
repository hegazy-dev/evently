import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'sport',
      name: 'Sport',
      icon: Icons.sports_basketball_outlined,
      imageName: 'sport',
    ),
    CategoryModel(
      id: 'birthday',
      name: 'Birthday',
      icon: Icons.cake,
      imageName: 'birthday',
    ),
    CategoryModel(
      id: 'bookclub',
      name: 'Book Club',
      icon: Icons.book,
      imageName: 'bookclub',
    ),
    CategoryModel(
      id: 'meeting',
      name: 'Meeting',
      icon: Icons.laptop,
      imageName: 'meeting',
    ),
    CategoryModel(
      id: 'exhibition',
      name: 'Exhibition',
      icon: Icons.flag,
      imageName: 'exhibition',
    ),
  ];
}
