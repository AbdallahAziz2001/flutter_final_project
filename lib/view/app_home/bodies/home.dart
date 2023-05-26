part of '../../../utils/import/app_import.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Text(
            "Groups",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.5,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 155,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 7.5,
            ),
            scrollDirection: Axis.horizontal,
            itemCount:
                Provider.of<AppProvider>(context).foodGroupsList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
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
                      Provider.of<AppProvider>(context, listen: false)
                          .changeCurrentFoodGroup(
                        currentFoodGroup:
                            Provider.of<AppProvider>(context, listen: false)
                                .foodGroupsList[index],
                      );
                      Navigator.of(context).pushNamed(FoodGroupsPage.route);
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
                              Provider.of<AppProvider>(context)
                                  .foodGroupsList[index]
                                  .url!,
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
                                  Provider.of<AppProvider>(context)
                                      .foodGroupsList[index]
                                      .name!,
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
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: const Text(
            "Foods",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.5,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 7.5,
                mainAxisSpacing: 7.5,
              ),
              itemCount: Provider.of<AppProvider>(context).foodsList.length,
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
                            .changeCurrentFood(
                                currentFood: Provider.of<AppProvider>(context,
                                        listen: false)
                                    .foodsList[index]);
                        Navigator.of(context).pushNamed("FoodPage");
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
                                Provider.of<AppProvider>(context)
                                    .foodsList[index]
                                    .url!,
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
                                  child: Text(
                                    Provider.of<AppProvider>(context)
                                        .foodsList[index]
                                        .name!,
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
            ),
          ),
        ),
      ],
    );
  }
}
