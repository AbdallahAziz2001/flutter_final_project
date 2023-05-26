part of '../../utils/import/app_import.dart';

// ignore: must_be_immutable
class AddEditFoodPage extends StatelessWidget {
  static String addroute = "AddFoodPage";
  static String editroute = "EditFoodPage";

  bool isAdd;
  AddEditFoodPage({
    Key? key,
    required this.isAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Provider.of<AppProvider>(context, listen: false)
                  .saveFood(fromAdd: isAdd);
              Navigator.of(context).pop();
            },
            label: Text(isAdd ? "Add Food" : "Edit Food"),
            icon: const Icon(Icons.save),
            backgroundColor: isAdd ? Colors.blue : Colors.green,
          ),
          appBar: AppBar(
            backgroundColor: isAdd ? Colors.blue : Colors.green,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                provider.resetFoodsControllers();
                Navigator.of(context).pop();
              },
            ),
            title: Text(isAdd ? "Add Food" : "Edit Food"),
          ),
          body: Container(
            margin: const EdgeInsets.only(
              bottom: 150,
            ),
            child: SingleChildScrollView(
              // ignore: sized_box_for_whitespace
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextfield(
                      label: "Food Name",
                      controller: provider.foodNameController,
                    ),
                    CustomTextfield(
                      label: "Food Yield",
                      controller: provider.foodServiceController,
                    ),
                    CustomTextfield(
                      label: "Food Image URL",
                      controller: provider.foodImageController,
                    ),
                    QuantityInput(
                      buttonColor: isAdd ? Colors.blue : Colors.green,
                      value: provider.ingredientControllersIntInput,
                      onChanged: (value) {
                        if (provider.ingredientControllersIntInput <
                            int.parse(value.replaceAll(',', ''))) {
                          provider.foodIngredientControllers
                              .add(TextEditingController());
                          provider.changeIngredientControllersIntInput(
                              ingredientControllersIntInput:
                                  int.parse(value.replaceAll(',', '')));
                          provider.customNotifyListeners();
                        } else if (provider.ingredientControllersIntInput >
                                int.parse(value.replaceAll(',', '')) &&
                            provider.ingredientControllersIntInput != 1) {
                          provider.foodIngredientControllers
                              .removeAt(int.parse(value.replaceAll(',', '')));
                          provider.changeIngredientControllersIntInput(
                              ingredientControllersIntInput:
                                  int.parse(value.replaceAll(',', '')));
                          provider.customNotifyListeners();
                        }
                      },
                      label: "Add Food Ingredient TextField",
                    ),
                    for (int index = 0;
                        index < provider.foodIngredientControllers.length;
                        index++)
                      CustomTextfield(
                        label: "Food Ingredients [${index + 1}]",
                        controller: provider.foodIngredientControllers[index],
                      ),
                    QuantityInput(
                      buttonColor: isAdd ? Colors.blue : Colors.green,
                      value: provider.directionControllersIntInput,
                      onChanged: (value) {
                        if (provider.directionControllersIntInput <
                            int.parse(value.replaceAll(',', ''))) {
                          provider.foodDirectionControllers
                              .add(TextEditingController());
                          provider.changeDirectionControllersIntInput(
                              directionControllersIntInput:
                                  int.parse(value.replaceAll(',', '')));
                          provider.customNotifyListeners();
                        } else if (provider.directionControllersIntInput >
                                int.parse(value.replaceAll(',', '')) &&
                            provider.directionControllersIntInput != 1) {
                          provider.foodDirectionControllers
                              .removeAt(int.parse(value.replaceAll(',', '')));
                          provider.changeDirectionControllersIntInput(
                              directionControllersIntInput:
                                  int.parse(value.replaceAll(',', '')));
                          provider.customNotifyListeners();
                        }
                      },
                      label: "Add Food Direction TextField",
                    ),
                    for (int index = 0;
                        index < provider.foodDirectionControllers.length;
                        index++)
                      CustomTextfield(
                        label: "Food Direction [${index + 1}]",
                        controller: provider.foodDirectionControllers[index],
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7.5,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: isAdd ? Colors.blue : Colors.green,
                          border: Border.all(
                            color: Colors.black38,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.57),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: DropdownButton(
                            value: provider.foodSelectedValue,
                            items: [
                              for (int index = 0;
                                  index <
                                      Provider.of<AppProvider>(context)
                                          .foodGroupsList
                                          .length;
                                  index++)
                                DropdownMenuItem(
                                  value: Provider.of<AppProvider>(context)
                                      .foodGroupsList[index]
                                      .name,
                                  child: Text(
                                    Provider.of<AppProvider>(context)
                                        .foodGroupsList[index]
                                        .name!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ],
                            onChanged: (value) {
                              provider.foodSelectedValue = value;
                              provider.foodFoodGroup = Provider.of<AppProvider>(
                                      context,
                                      listen: false)
                                  .foodGroupsList
                                  .where((element) => element.name == value)
                                  .first;
                              provider.customNotifyListeners();
                            },
                            hint: const Text("Select Food Group"),
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.arrow_circle_down_sharp),
                            ),
                            iconEnabledColor: Colors.black45,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            dropdownColor: isAdd ? Colors.blue : Colors.green,
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Favorite: ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Radio(
                            value: true,
                            activeColor: isAdd ? Colors.blue : Colors.green,
                            groupValue: provider.foodIsFavorite,
                            onChanged: (v) {
                              provider.foodIsFavorite = true;
                              provider.customNotifyListeners();
                            },
                          ),
                          const Text(
                            "Yes",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Radio(
                            value: false,
                            activeColor: isAdd ? Colors.blue : Colors.green,
                            groupValue: provider.foodIsFavorite,
                            onChanged: (v) {
                              provider.foodIsFavorite = false;
                              provider.customNotifyListeners();
                            },
                          ),
                          const Text(
                            "No",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
