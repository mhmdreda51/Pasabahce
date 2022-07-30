class CategoryModel {
  late final Data data;

  CategoryModel({required this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
  }
}

class Data {
  String? diameter;
  String? image;
  String? subtitle;
  String? strapColor;
  String? price;
  String? name;
  String? productionMethod;
  String? productRevNum;
  String? disc;
  String? material;
  String? productOrigin;
  int? productRev;
  String? sale;
  bool? isFav;
  bool? isOnSale;

  Data({
    required this.image,
    required this.isOnSale,
    required this.isFav,
    required this.sale,
    required this.disc,
    required this.name,
    required this.diameter,
    required this.material,
    required this.price,
    required this.productionMethod,
    required this.productOrigin,
    required this.productRev,
    required this.productRevNum,
    required this.strapColor,
    required this.subtitle,
  });

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    disc = json['disc'];
    name = json['name'];
    diameter = json['diameter'];
    material = json['material'];
    productionMethod = json['productionMethod'];
    productOrigin = json['productOrigin'];
    productRev = json['productRev'];
    productRevNum = json['productRevNum'];
    strapColor = json['strapColor'];
    subtitle = json['subtitle'];
  }
}

List<Data> products = [
  Data(
    isOnSale: true,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: false,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: false,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: false,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: false,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: false,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: true,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: false,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: false,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: false,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: false,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: false,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
  Data(
    isOnSale: false,
    isFav: true,
    sale: "30",
    subtitle:
        "Pitchers;They are thin-necked, wide-bellied, lidded and handled containers for putting liquids such as water, sherbet.,",
    name: "Mystical Vase",
    disc:
        "The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.,",
    diameter: "20 cm Length: 40 cm",
    material: "Gold and Glass crafting",
    price: "€3450",
    productionMethod: "100% handmade",
    productOrigin: "Turkey",
    productRev: 4,
    productRevNum: "1.248 Reviews",
    strapColor: "Gold Color",
    image:
        "https://firebasestorage.googleapis.com/v0/b/pasabahce-d1741.appspot.com/o/products%2FMysticalVase.png?alt=media&token=fcc18ff5-41b5-4c45-acf6-f674844f480a",
  ),
];
