class BoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;
  final String price;
  BoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.price,
  });
}

List<BoardingModel> boardingData = [
  BoardingModel(
    price: "€5650",
    imagePath: "assets/images/Gulcehre_ibrik.png",
    title: "Gülçehre İbrik Limited Edition",
    subTitle: "HISTORY CULTURE GLASS",
  ),
  BoardingModel(
    price: "€3450",
    imagePath: 'assets/images/SoteriaVazo.png',
    title: "Hagia Sophia Deesis Mosaic Vase",
    subTitle: "HISTORY CULTURE GLASS",
  ),
  BoardingModel(
    price: "€3150",
    imagePath: 'assets/images/MysticalVase.png',
    title: "Mystical Vase Limited Edition",
    subTitle: "HISTORY CULTURE GLASS",
  ),
];
