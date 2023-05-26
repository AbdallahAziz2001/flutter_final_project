part of '../../utils/import/app_import.dart';

class FoodGroupsPage extends StatelessWidget {
  static String route = "FoodGroupsPage";

  const FoodGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Food> foods = Provider.of<AppProvider>(context)
        .foodsList
        .where((element) =>
            element.foodGroup!.id ==
            Provider.of<AppProvider>(context, listen: false)
                .currentFoodGroup!
                .id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<AppProvider>(context).currentFoodGroup!.name!),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Provider.of<AppProvider>(context, listen: false)
                .resetFoodGroupControllers();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: foods.length,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentFood(currentFood: foods[index]);
                Navigator.of(context).pushNamed(FoodPage.route);
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.blue,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  width: double.infinity,
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: Image.network(
                              foods[index].url!,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  Provider.of<AppProvider>(context).isDark
                                      ? "assets/images/dark_error.png"
                                      : "assets/images/light_error.png",
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 15,
                                top: 15,
                                right: 15,
                              ),
                              width: double.infinity,
                              child: Center(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    foods[index].name!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.5)),
                              ),
                              width: double.infinity,
                              height: 100,
                              margin: const EdgeInsets.only(
                                left: 15,
                                top: 5,
                                right: 15,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Service ↴",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Center(
                                      child: Text(
                                        foods[index].service!,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
