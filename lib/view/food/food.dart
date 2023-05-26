part of '../../utils/import/app_import.dart';

class FoodPage extends StatelessWidget {
  static String route = "FoodPage";

  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Food> foods = Provider.of<AppProvider>(context)
        .foodsList
        .where((element) =>
            element.id != Provider.of<AppProvider>(context).currentFood!.id)
        .toList() ;
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: SpeedDial(
              activeIcon: Icons.close,
              icon: Icons.menu,
              children: [
                SpeedDialChild(
                  child: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  label: 'Delete Food',
                  onTap: () {
                    provider.deleteFood();
                    provider.customNotifyListeners();
                    Navigator.of(context).pop();
                  },
                ),
                SpeedDialChild(
                  child: const Icon(
                    Icons.edit,
                    color: Colors.blueAccent,
                  ),
                  label: 'Edit Food',
                  onTap: () {
                    Navigator.of(context).pushNamed(AddEditFoodPage.editroute);
                  },
                ),
              ],
            ),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              provider.currentFood!.url!,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  provider.isDark
                                      ? "assets/images/dark_error.png"
                                      : "assets/images/light_error.png",
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                              left: 7.5,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            width: 45,
                            height: 45,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Provider.of<AppProvider>(context, listen: false)
                                    .resetFoodsControllers();
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.blue,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                                Icons.arrow_back_rounded,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            alignment: const Alignment(1, -1),
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 15,
                                right: 15,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              width: 45,
                              height: 45,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Provider.of<AppProvider>(context,
                                          listen: false)
                                      .changeFoodIsFavorite();
                                },
                                icon: Icon(
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: provider.currentFood!.isFavorite!
                                          ? Colors.white
                                          : Colors.red,
                                      offset: const Offset(-3.0, 2.0),
                                    ),
                                  ],
                                  Icons.favorite,
                                  size: 30,
                                  color: provider.currentFood!.isFavorite!
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: const Alignment(-1, 0.75),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              provider.currentFood!.name!,
                              style: const TextStyle(
                                fontSize: 25,
                                overflow: TextOverflow.clip,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 15,
                              right: 15,
                              bottom: 7.5,
                            ),
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.fastfood_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Ingredients",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                for (var item
                                    in provider.currentFood!.ingredients!)
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.5,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          // // --------------------------------------
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 7.5,
                              right: 15,
                              bottom: 7.5,
                            ),
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.cookie_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Directions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                for (var item
                                    in provider.currentFood!.directions!)
                                  Column(
                                    children: [
                                      Text(
                                        item,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          // --------------------------------------
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 7.5,
                              right: 15,
                              bottom: 15,
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Random Wsfat",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.5,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // ignore: sized_box_for_whitespace
                                Container(
                                  height: 155,
                                  child: ListView.builder(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: foods.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
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
                                              blurRadius: 3.0,
                                            ),
                                          ],
                                        ),
                                        width: 150,
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
                                              Provider.of<AppProvider>(context,
                                                      listen: false)
                                                  .changeCurrentFood(
                                                      currentFood:
                                                          foods[index]);
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      FoodPage.route);
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
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    width: double.infinity,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Center(
                                                        child: Text(
                                                          foods[index].name!,
                                                          style:
                                                              const TextStyle(
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
