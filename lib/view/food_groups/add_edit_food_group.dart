part of '../../utils/import/app_import.dart';


// ignore: must_be_immutable
class AddEditFoodGroupPage extends StatelessWidget {
  static String addRoute = "AddFoodGroupPage";
  static String editRoute = "EditFoodGroupPage";

  bool isAdd;
  AddEditFoodGroupPage({super.key, required this.isAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<AppProvider>(context, listen: false)
              .saveFoodGroup(fromAdd: isAdd);
          Navigator.of(context).pop();
        },
        label: Text(isAdd ? "Add Food Group" : "Edit Food Group"),
        icon: const Icon(Icons.save),
        backgroundColor: isAdd ? Colors.blue : Colors.green,
      ),
      appBar: AppBar(
        backgroundColor: isAdd ? Colors.blue : Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<AppProvider>(context, listen: false)
                .resetFoodGroupControllers();
            Navigator.of(context).pop();
          },
        ),
        title: Text(isAdd ? "Add Food Group" : "Edit Food Group"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            CustomTextfield(
              label: "Food Group Name",
              controller:
                  Provider.of<AppProvider>(context).foodGroupNameController,
            ),
            CustomTextfield(
              label: "Food Group Image URL",
              controller:
                  Provider.of<AppProvider>(context).foodGroupImageController,
            ),
          ],
        ),
      ),
    );
  }
}
