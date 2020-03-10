import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/FiltersScreen';
Function saveFilters;
Map<String,bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree=false;
  var _vegetarian=false;
  var _vegan=false;
  var _lactoseFree=false;
  @override
  initState(){

    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactos'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchTitle(String title , String subTitle , Function updateValue){
    return SwitchListTile(
      title: Text(title),
      value:_glutenFree ,
      subtitle: Text(subTitle),
      onChanged: updateValue,
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton
            (icon: Icon(Icons.save),
            onPressed:(){
              final selectedFilter={
                'gluten':_glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactos' : _lactoseFree
              };
              widget.saveFilters(selectedFilter);}
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Adjust your meal selection',
            style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true ,
              children: <Widget>[
                _buildSwitchTitle('Gluten Free',
                    'only include gluten-free meals',
                      (newValue){
                    _glutenFree=newValue;
                  },),
                _buildSwitchTitle('vegan',
                    'only include vegan meals',
                      (newValue){
                    _vegan=newValue;
                  },
                ),
                _buildSwitchTitle('vegetarian',
                  'only include vegetarian meals',
                      (newValue){
                        _vegetarian=newValue;
                  },
                ),
                _buildSwitchTitle('lactose Free',
                  'only include _lactose-free meals',
                      (newValue){
                        _lactoseFree=newValue;
                  },
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
