import 'package:hive/hive.dart';

part 'inventory_image.g.dart';

@HiveType(typeId: 0)
class InventoryImage {
  @HiveField(0)
  final String link;
  @HiveField(1)
  final String identify;
  InventoryImage({
    required this.link,
    required this.identify,
  });
}
