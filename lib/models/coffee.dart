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
  List<Object?> get props => [image]; // Unique identifier for comparison

  @override
  String toString() {
    return 'Coffee(name: $name, type: $type, rate: $rate, review: $review, price: $price)';
  }
}

// Sample coffee list
final List<Coffee> listGridCoffee = [
  const Coffee(
    image: 'assets/coffee1.png',
    name: 'Caffee Mocha',
    type: 'Deep Foam',
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
    type: 'Ice/Hot',
    rate: 4.7,
    review: 180,
    description:
    'Mocha Fusi blends chocolate with espresso and steamed milk for a rich and creamy drink.',
    price: 179.00,
  ),
  const Coffee(
    image: 'assets/coffee4.png',
    name: 'Caffe Panna',
    type: 'Ice/Hot',
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
    image: 'assets/coffee6.png',
    name: 'Vanilla Brew',
    type: 'Signature Roast',
    rate: 4.7,
    review: 210,
    description:
    'Vanilla Brew is a light roast infused with vanilla essence and topped with milk foam.',
    price: 169.00,
  ),
];

