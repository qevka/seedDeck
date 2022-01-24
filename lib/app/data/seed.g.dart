// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seed _$SeedFromJson(Map<String, dynamic> json) => Seed(
      seedType: json['seedType'] as String?,
      quantity: json['quantity'] as int?,
      name: json['name'] as String?,
      fertilizationNotes: (json['fertilizationNotes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      generalNotes: (json['generalNotes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      germinationRate: (json['germinationRate'] as num?)?.toDouble(),
      inGarden: json['inGarden'] as bool? ?? false,
      packagedYear: json['packagedYear'] as int?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      soilNotes: (json['soilNotes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      taste: json['taste'] as int?,
      coldCrop: json['coldCrop'] as bool?,
      germMonth: json['germMonth'] as int?,
      perennial: json['perennial'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SeedToJson(Seed instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'perennial': instance.perennial,
      'coldCrop': instance.coldCrop,
      'inGarden': instance.inGarden,
      'germMonth': instance.germMonth,
      'taste': instance.taste,
      'germinationRate': instance.germinationRate,
      'id': instance.id,
      'name': instance.name,
      'seedType': instance.seedType,
      'packagedYear': instance.packagedYear,
      'photos': instance.photos,
      'fertilizationNotes': instance.fertilizationNotes,
      'soilNotes': instance.soilNotes,
      'generalNotes': instance.generalNotes,
    };
