import 'package:json_annotation/json_annotation.dart';
import 'package:models/cat/cat_weight.dart';

part 'cat_breed.g.dart';

@JsonSerializable()
class CatBreed {
  CatWeight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;

  CatBreed({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) =>
      _$CatBreedFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedToJson(this);
}
