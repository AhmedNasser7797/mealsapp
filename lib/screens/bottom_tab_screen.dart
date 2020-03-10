import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorites.dart';
import '../screens/categories_screen.dart';

class BottomTabScreen extends StatefulWidget {
  List<Meal> favoriteMeal;
  BottomTabScreen(this.favoriteMeal);
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  List<Map<String,Object>> _page;
int _selectedPAgeIndex=0;
  void _selectedPage(index){
setState(() {
  _selectedPAgeIndex=index;
});
  }

  @override
  void initState() {
    _page=[
      {'page' :CategoriesScreen(), 'title' :'Categories'},
      {'page' :Favorites(widget.favoriteMeal), 'title' :'Your Favorites'}
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_page[_selectedPAgeIndex]['title']),
      ),
      body: _page[_selectedPAgeIndex]['page'],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).backgroundColor,

        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category,),
            title: Text('Categories')
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites')
          )
        ]
      ),
    );
  }
}
