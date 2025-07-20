import 'package:equatable/equatable.dart';

class Coffee extends Equatable {
  final String image;
  final String name;
  final String type;
  final double rate;
  final int review;
  final String description;
  final double price;

  const Coffee({
    required this.image,
    required this.name,
    required this.type,
    required this.rate,
    required this.review,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [image];

  @override
  String toString() {
    return 'Coffee(name: $name, type: $type, rate: $rate, review: $review, price: $price)';
  }
}

final List<Coffee> listGridCoffee = [
  const Coffee(
    image: 'assets/coffee1.png',
    name: 'Caffee Mocha',
    type: 'Cappuccino',
    rate: 4.8,
    review: 230,
    description:
    'A cappuccino is an approximately 150 ml (5 oz) beverage with 25 ml of espresso coffee and 85 ml of fresh milk.',
    price: 199.00,
  ),
  const Coffee(
    image: 'assets/coffee2.png',
    name: 'Flat White',
    type: 'Espresso',
    rate: 4.8,
    review: 200,
    description:
    'Flat White is made with a double shot of espresso and topped with silky steamed milk.',
    price: 149.00,
  ),
  const Coffee(
    image: 'assets/coffee3.png',
    name: 'Mocha Fusi',
    type: 'Cappuccino',
    rate: 4.7,
    review: 180,
    description:
    'Mocha Fusi blends chocolate with espresso and steamed milk for a rich and creamy drink.',
    price: 179.00,
  ),
  const Coffee(
    image: 'assets/coffee4.png',
    name: 'Caffe Panna',
    type: 'Cappuccino',
    rate: 4.6,
    review: 160,
    description:
    'Caffe Panna is topped with whipped cream, offering a sweet and smooth coffee experience.',
    price: 159.00,
  ),
  const Coffee(
    image: 'assets/coffee5.png',
    name: 'Hazelnut Bliss',
    type: 'Creamy Roast',
    rate: 4.9,
    review: 220,
    description:
    'Hazelnut Bliss combines nutty aroma with smooth espresso, perfect for cozy moments.',
    price: 189.00,
  ),
  const Coffee(
    image: 'assets/coffee7.png',
    name: 'Irish Cream Latte',
    type: 'Hot Coffee',
    rate: 4.6,
    review: 175,
    description:
    'Irish Cream Latte is a sweet, creamy coffee with notes of Irish cream, espresso, and steamed milk.',
    price: 199.00,
  ),
  const Coffee(
    image: 'assets/coffee6.png',
    name: 'Vanilla Brew',
    type: 'Creamy Roast',
    rate: 4.7,
    review: 210,
    description:
    'Vanilla Brew is a light roast infused with vanilla essence and topped with milk foam.',
    price: 169.00,
  ),
  const Coffee(
    image: 'assets/coffee8.png',
    name: 'Cinnamon Dolce Latte',
    type: 'Cappuccino',
    rate: 4.5,
    review: 190,
    description:
    'Cinnamon Dolce Latte features espresso, steamed milk, and sweet cinnamon syrup topped with whipped cream.',
    price: 199.00,
  ),
  const Coffee(
    image: 'assets/coffee9.png',
    name: 'Iced Americano',
    type: 'Americano',
    rate: 4.3,
    review: 100,
    description:
    'A refreshing iced Americano made with rich espresso and chilled water, perfect for hot days.',
    price: 130.00,
  ),
  const Coffee(
    image: 'assets/coffee10.png',
    name: 'Classic Americano',
    type: 'Americano',
    rate: 4.6,
    review: 140,
    description:
    'Smooth and bold Americano brewed with rich espresso and hot water.',
    price: 125.00,
  ),
];
