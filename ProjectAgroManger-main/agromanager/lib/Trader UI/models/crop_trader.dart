class Crop {
  String imageUrl;
  String name;
  String category;
  int price;
  String size;
  String description;

  Crop({
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.price,
    required this.size,
    required this.description,
  });
}
final List<Crop> crop = [
  Crop(
    imageUrl: 'assets/images/crop0.png',
    name: 'Crop 1',
    category: 'Outdoor',
    price: 25,
    size: 'Small',
    description:
    'Aloe vera is a succulent plant species of the genus Aloe. It\'s medicinal uses and air purifying ability make it an awesome plant.',
  ),
  Crop(
    imageUrl: 'assets/images/crop1.png',
    name: 'Crop 2',
    category: 'Indoor',
    price: 30,
    size: 'Medium',
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur.',
  ),
  Crop(
    imageUrl: 'assets/images/crop2.png',
    name: 'Crop 3',
    category: 'New Arrival',
    price: 42,
    size: 'Large',
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porta risus id urna luctus efficitur. Suspendisse vulputate faucibus est, a vehicula sem eleifend quis.',
  ),
];