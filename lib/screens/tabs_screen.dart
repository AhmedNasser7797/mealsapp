import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
  List<Meal> favoriteMeal;
  TabsScreen(this.favoriteMeal);
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[CategoriesScreen(), Favorites(widget.favoriteMeal)],
        ),
      ),
    );
  }
}
