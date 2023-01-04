import '../../app.dart';

SizedBox stocksGridTileCard(Size size, BuildContext context) {
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
          children: const [
            ListTile(
              minLeadingWidth: 1,
              minVerticalPadding: 2,
              contentPadding: EdgeInsets.only(left: 10),
              horizontalTitleGap: 10,
              leading: CircleAvatar(
                radius: 17,
                child: Icon(
                  Icons.account_balance_rounded,
                  size: 18,
                ),
              ),
              title: Text('Nvidia'),
              subtitle: Text('Nvidia inc.'),
            ),
            ListTile(
              title: Text('\$98.90'),
              subtitle: Text('178% [0.1786]'),
              trailing: Icon(Icons.sports_hockey_sharp),
            )
          ]),
    ),
  );
}

Card stocksListTileCard(Size size, BuildContext context) {
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
        children: const [
          Text('Nvidia'),
          Text('Nvidia'),
          Text('Nvidia'),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Nvidia Inc.'),
          Text('Nvidia Inc.'),
          Text('Nvidia Inc.'),
        ],
      ),
    ),
  );
}
