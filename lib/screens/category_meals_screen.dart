import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName= '/category-meals';
  List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData=false;

//  @override
//  void initState() {
//
//    //we can't add this code in initState because it's run before any widget or screen builds
//    // => so it can't identify the context
////    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String,String> ;
////    categoryTitle=routeArgs['title'];
////    final categoryId=routeArgs['id'];
////    displayedMeals=DUMMY_MEALS.where((meal){
////      return meal.categories.contains(categoryId);
////    }).toList();
//    super.initState();
//  }
  void _removeMeal(String mealId){
    displayedMeals.removeWhere((meal) => meal.id==mealId);

  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
  }
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem (
            id: displayedMeals[index].id,
            title:displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration:displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          removeItem: _removeMeal,
        );
      },
        itemCount:displayedMeals.length   ,),

    );

  }
}
