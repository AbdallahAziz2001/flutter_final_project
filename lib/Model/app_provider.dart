part of '../../utils/import/app_import.dart';

class AppProvider extends ChangeNotifier {
  static BuildContext? context;

  AppProvider() {
    setFoodGroupsList();
    setFoodsList();
  }

  bool isDark = false;
  int indexOfBottomNavigationBar = 0;
  FoodGroup? currentFoodGroup;
  Food? currentFood;

  List<FoodGroup> foodGroupsList = [];
  List<Food> foodsList = [];

  setFoodGroupsList() {
    DBHelper.dbHelper.getAllFoodGroups().then(
          (element) => foodGroupsList = element,
        );
  }

  setFoodsList() {
    DBHelper.dbHelper.getAllFoods().then(
          (element) => foodsList = element,
        );
  }

  int ingredientControllersIntInput = 1;
  int directionControllersIntInput = 1;

  changeIsDark({required bool isDark}) {
    this.isDark = isDark;
    notifyListeners();
  }

  changeIndexOfBottomNavigationBar({required int indexOfBottomNavigationBar}) {
    this.indexOfBottomNavigationBar = indexOfBottomNavigationBar;
    customNotifyListeners();
  }

  changeCurrentFood({required Food currentFood}) {
    this.currentFood = currentFood;

    /*-----------------------------------------------------*/
    foodNameController.text = this.currentFood!.name!;
    foodServiceController.text = this.currentFood!.service!;
    foodImageController.text = this.currentFood!.url!;

    foodIngredientControllers = [];
    for (var element in this.currentFood!.ingredients!) {
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = element;
      foodIngredientControllers.add(textEditingController);
    }
    ingredientControllersIntInput = foodIngredientControllers.length;

    foodDirectionControllers = [];
    for (var element in this.currentFood!.directions!) {
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = element;
      foodDirectionControllers.add(textEditingController);
    }
    directionControllersIntInput = foodDirectionControllers.length;

    foodFoodGroup = foodGroupsList
        .where((element) => element.id == this.currentFood!.foodGroup!.id)
        .toList()
        .first;
    foodSelectedValue = foodFoodGroup!.name;
    foodIsFavorite = this.currentFood!.isFavorite!;
    customNotifyListeners();
  }

  changeCurrentFoodGroup({required FoodGroup currentFoodGroup}) {
    this.currentFoodGroup = currentFoodGroup;

    /*-----------------------------------------------------*/

    foodGroupNameController.text = this.currentFoodGroup!.name!;
    foodGroupImageController.text = this.currentFoodGroup!.url!;

    customNotifyListeners();
  }

  changeIngredientControllersIntInput(
      {required int ingredientControllersIntInput}) {
    this.ingredientControllersIntInput = ingredientControllersIntInput;
    customNotifyListeners();
  }

  changeDirectionControllersIntInput(
      {required int directionControllersIntInput}) {
    this.directionControllersIntInput = directionControllersIntInput;
    customNotifyListeners();
  }

  saveFoodGroup({required bool fromAdd}) {
    if (fromAdd) {
      FoodGroup foodGroup = FoodGroup(
        name: foodGroupNameController.text,
        url: foodGroupImageController.text,
      );
      DBHelper.dbHelper
          .insertFoodGroup(foodGroup)
          .then((value) => value)
          .then((value) => foodGroup.id = value);
      foodGroupsList.add(foodGroup);
      resetFoodGroupControllers();
    } else {
      currentFoodGroup!.name = foodGroupNameController.text;
      currentFoodGroup!.url = foodGroupImageController.text;
      DBHelper.dbHelper.updateFoodGroup(currentFoodGroup!);
    }

    //-------------------------------//

    currentFoodGroup = null;
    customNotifyListeners();
  }

  deleteFoodGroup(FoodGroup foodGroup) {
    for (var element in foodsList) {
      if (element.foodGroup!.id == foodGroup.id) {
        DBHelper.dbHelper.deleteFood(element);
      }
    }

    foodsList.removeWhere(
      (element) {
        return element.foodGroup!.id == foodGroup.id;
      },
    );

    foodGroupsList.removeWhere(
      (element) {
        return element.id == foodGroup.id;
      },
    );
    DBHelper.dbHelper.deleteFoodGroup(foodGroup);
    customNotifyListeners();
  }

  resetFoodGroupControllers() {
    foodGroupNameController = TextEditingController();
    foodGroupImageController = TextEditingController();
    customNotifyListeners();
  }

  saveFood({required bool fromAdd}) {
    if (fromAdd) {
      Food food = Food(
        name: foodNameController.text,
        url: foodServiceController.text,
        service: foodImageController.text,
        ingredients:
            foodIngredientControllers.map((element) => element.text).toList(),
        directions:
            foodDirectionControllers.map((element) => element.text).toList(),
        foodGroup: foodFoodGroup,
        isFavorite: foodIsFavorite,
      );
      DBHelper.dbHelper.insertFood(food).then((value) => food.id = value);
      foodsList.add(food);
      currentFood = null;
      resetFoodsControllers();
    } else {
      currentFood!.name = foodNameController.text;
      currentFood!.service = foodServiceController.text;
      currentFood!.url = foodImageController.text;

      currentFood!.ingredients = [];
      for (var element in foodIngredientControllers) {
        currentFood!.ingredients!.add(element.text);
      }

      currentFood!.directions = [];
      for (var element in foodDirectionControllers) {
        currentFood!.directions!.add(element.text);
      }

      currentFood!.foodGroup = foodFoodGroup;
      currentFood!.isFavorite = foodIsFavorite;

      DBHelper.dbHelper.updateFood(currentFood!);
    }

    //-------------------------------//

    customNotifyListeners();
  }

  changeFoodIsFavorite() {
    currentFood!.isFavorite = !currentFood!.isFavorite!;
    DBHelper.dbHelper.updateFoodIsFavorite(currentFood!);

    customNotifyListeners();
  }

  resetFoodsControllers() {
    foodNameController = TextEditingController();
    foodServiceController = TextEditingController();
    foodImageController = TextEditingController();
    foodIngredientControllers = [
      TextEditingController(),
    ];
    ingredientControllersIntInput = foodIngredientControllers.length;
    foodDirectionControllers = [
      TextEditingController(),
    ];
    directionControllersIntInput = foodDirectionControllers.length;
    foodSelectedValue = null;
    foodFoodGroup = null;
    foodIsFavorite = false;
    customNotifyListeners();
  }

  deleteFood() {
    foodsList.removeWhere(
      (element) {
        return element.id == currentFood!.id;
      },
    );
    DBHelper.dbHelper.deleteFood(currentFood!);
    customNotifyListeners();
  }

  customNotifyListeners() {
    notifyListeners();
  }

/*---------------------------*/

  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodServiceController = TextEditingController();
  TextEditingController foodImageController = TextEditingController();
  List<TextEditingController> foodIngredientControllers = [
    TextEditingController(),
  ];
  List<TextEditingController> foodDirectionControllers = [
    TextEditingController(),
  ];
  String? foodSelectedValue;
  FoodGroup? foodFoodGroup;
  bool foodIsFavorite = false;

/*---------------------------*/

  TextEditingController foodGroupNameController = TextEditingController();
  TextEditingController foodGroupImageController = TextEditingController();
}
