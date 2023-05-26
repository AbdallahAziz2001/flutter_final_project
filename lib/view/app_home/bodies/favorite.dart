part of '../../../utils/import/app_import.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Food> foods = Provider.of<AppProvider>(context).foodsList
        .where((element) => element.isFavorite == true)
        .toList() ;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 7.5,
        mainAxisSpacing: 7.5,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.5),
              topRight: Radius.circular(7.5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          height: 75,
          width: 75,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(7.5),
              topRight: Radius.circular(7.5),
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Provider.of<AppProvider>(context, listen: false)
                    .changeCurrentFood(currentFood: foods[index]);
                Navigator.of(context).pushNamed(FoodPage.route);
              },
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.green,
                      width: double.infinity,
                      height: double.infinity,
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
