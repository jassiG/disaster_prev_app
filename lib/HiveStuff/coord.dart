import 'package:hive/hive.dart';
part 'coord.g.dart';


@HiveType(typeId: 0)
class Coord extends HiveObject{
  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double long;
  
  Coord(this.lat, this.long);
}
