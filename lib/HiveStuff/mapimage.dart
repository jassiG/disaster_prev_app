import 'package:hive/hive.dart';
import 'coord.dart';
part 'mapimage.g.dart';

@HiveType(typeId: 1)
class MapImage extends HiveObject{
  @HiveField(0)
  final String path;
  @HiveField(1)
  final Coord ne_coord;
  @HiveField(2)
  final Coord sw_coord;
  @HiveField(3)
  final String name;

  MapImage(this.path, this.ne_coord, this.sw_coord, this.name);
}
