import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'note.dart';

part 'seed.g.dart';

@JsonSerializable()
class Seed {
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

  ///[id] a unique identifier to indentify this specific species.
  String id;

  ///[name] The name of the species.
  String name;

  ///[seedType] The family the seed belongs to.
  String seedType;

  ///[packagedYear] the year the seeds where produced
  String packagedYear;

  ///[photos] a list of photos of the plant growning.
  List<String>? photos;

  ///[fertilizationNotes] These are just generic notes about what has been done to fertilize the plants.
  List<Note>? fertilizationNotes;
  List<Note>? soilNotes;
  List<Note>? generalNotes;

  Seed(
      {required this.seedType,
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
      : id = id ?? Uuid().v4();

  factory Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);

  Map<String, dynamic> toJson() => _$SeedToJson(this);

  /// The format of the QR code data needs to be id_seedType_name_germRate_date
  factory Seed.fromQRCode(String data) {
    List values;
    values = data.split("_");
    return Seed(
        id: values[0],
        seedType: values[1],
        name: values[2],
        germinationRate: double.tryParse(values[3]) ?? 0,
        packagedYear: values[4]);
  }
}
