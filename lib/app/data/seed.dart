import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'note.dart';

part 'seed.g.dart';

@JsonSerializable()
class Seed {
  ///[quantity] current seeds in inventory
  int? quantity;

  ///[perennial] boolean value indicating if the plant will grow for more than one year.
  bool? perennial;

  ///[coldCrop] Boolean indicating if this is a cold weather crop.
  bool? coldCrop;

  ///[inGarden] - bool - Determines if the seed is currently in the garden.
  bool inGarden;

  ///[germMonth] The month the seed should be started in.
  int? germMonth;

  ///[taste] This is a value between 1-10 rating the taste of the variety.
  int? taste;

  ///[germinationRate] the rate of seeds out of 100 that will sprout.
  double? germinationRate;

  ///[id] a unique identifier to identify this specific species.
  String id;

  ///[name] The name of the species.
  String? name;

  ///[seedType] The family the seed belongs to.
  String? seedType;

  ///[packagedYear] the year the seeds where produced
  int? packagedYear;

  ///[photos] a list of photos of the plant growning.
  List<String>? photos;

  ///[fertilizationNotes] These are just generic notes about what has been done to fertilize the plants.
  List<Note>? fertilizationNotes;
  List<Note>? soilNotes;
  List<Note>? generalNotes;

  Seed(
      {required this.seedType,
      required this.quantity,
      required this.name,
      this.fertilizationNotes,
      this.generalNotes,
      required this.germinationRate,
      this.inGarden = false,
      required this.packagedYear,
      this.photos,
      this.soilNotes,
      this.taste,
      this.coldCrop,
      this.germMonth,
      this.perennial,
      String? id})
      : id = id ?? Uuid().v4().substring(0, 10) {
    if (taste != null) {
      assert(taste! <= 10);
    }
  }

  factory Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);

  Map<String, dynamic> toJson() => _$SeedToJson(this);
}
