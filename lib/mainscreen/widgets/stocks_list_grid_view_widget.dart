
  import '../../app.dart';

Widget stocksListGridWIdget(
      AsyncValue<List<StocksPriceModel>> stocks, bool isGrid, Size size) {
    return Expanded(
      child: stocks.when(
          data: (data) {
            // GRID VIEW DESIGN
            return isGrid == true
                ? GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => stocksGridTileCard(
                      size: size,
                      context: context,
                      data: data[index],
                    ),
                  )
                //LIST VIEW DESIGN
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => stocksListTileCard(
                      size: size,
                      context: context,
                      data: data[index],
                    ),
                  );
          },
          error: (error, st) => const Center(
                  child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'There is no information available for this Exchange',
                    textScaleFactor: 1.4,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )),
    );
  }