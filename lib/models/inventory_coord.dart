import 'package:hive/hive.dart';

part 'inventory_coord.g.dart';

@HiveType(typeId: 1)
class InventoryCoord {
  @HiveField(0)
  final String link;
  @HiveField(1)
  double x;
  @HiveField(2)
  double y;
  @HiveField(3)
  int classification;
  @HiveField(4)
  String witness;
  @HiveField(6)
  int year;
  @HiveField(7)
  int month;
  @HiveField(8)
  int day;
  @HiveField(9)
  String content;
  @HiveField(10)
  String image;
  @HiveField(11)
  final String identify;
  InventoryCoord({
    required this.link,
    required this.x,
    required this.y,
    required this.classification,
    required this.witness,
    required this.year,
    required this.month,
    required this.day,
    required this.content,
    required this.image,
    required this.identify,
  });
}
