import '../../app.dart';

SizedBox stocksGridTileCard({
  required Size size,
  required BuildContext context,
  required StocksPriceModel data,
}) {
  return SizedBox(
    width: size.width * 0.45,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).primaryColorLight.withOpacity(0.5),
            width: 0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              minLeadingWidth: 1,
              minVerticalPadding: 2,
              contentPadding: const EdgeInsets.only(left: 10),
              horizontalTitleGap: 10,
              leading: const CircleAvatar(
                radius: 17,
                child: Icon(
                  Icons.account_balance_rounded,
                  size: 18,
                ),
              ),
              title: Text(data.exchange!),
              subtitle: Text(data.symbol!),
            ),
            ListTile(
              title: Text(
                '${data.open}'.toString(),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: BrandColors.colorGreen,
                    ),
              ),
              subtitle: Text(
               '${ data.close}'.toString(),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: BrandColors.colorError,
                    ),
              ),
              trailing: const Icon(Icons.sports_hockey_sharp),
            )
          ]),
    ),
  );
}

Card stocksListTileCard({
  required Size size,
  required BuildContext context,
  required StocksPriceModel data,
}) {
  return Card(
    margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.04, vertical: size.height * 0.01),
    shape: RoundedRectangleBorder(
      side: BorderSide(
          color: Theme.of(context).primaryColorLight.withOpacity(0.5),
          width: 0.5),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: ListTile(
      leading: const CircleAvatar(
        child: Icon(
          Icons.account_balance_rounded,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data.exchange ?? 'Nvidia'),
          Text(
            'Open: ${data.open}',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: BrandColors.colorGreen,
                ),
          ),
          Text('high: ${data.high}',
              style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${data.symbol}'),
          Text(
            'Close: ${data.close}',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: BrandColors.colorError,
                ),
          ),
          Text('low: ${data.low}',
              style: Theme.of(context).textTheme.bodyText2),
        ],
      ),
    ),
  );
}
