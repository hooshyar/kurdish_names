import 'dart:convert';

import 'package:flutter/foundation.dart';

class KurdishNames {
  final List<Name> names;
  final int recordCount;
  KurdishNames({
    required this.names,
    required this.recordCount,
  });

  KurdishNames copyWith({
    List<Name>? names,
    int? recordCount,
  }) {
    return KurdishNames(
      names: names ?? this.names,
      recordCount: recordCount ?? this.recordCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'names': names.map((x) => x.toMap()).toList(),
      'recordCount': recordCount,
    };
  }

  factory KurdishNames.fromMap(Map<String, dynamic> map) {
    return KurdishNames(
      names: List<Name>.from(map['names']?.map((x) => Name.fromMap(x))),
      recordCount: map['recordCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory KurdishNames.fromJson(String source) =>
      KurdishNames.fromMap(json.decode(source));

  @override
  String toString() => 'KurdishNames(names: $names, recordCount: $recordCount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KurdishNames &&
        listEquals(other.names, names) &&
        other.recordCount == recordCount;
  }

  @override
  int get hashCode => names.hashCode ^ recordCount.hashCode;
}

class Name {
  final int nameId;
  final String name;
  final String desc;
  final String gender;
  final int positive_votes;
  final int negative_votes;
  Name({
    required this.nameId,
    required this.name,
    required this.desc,
    required this.gender,
    required this.positive_votes,
    required this.negative_votes,
  });

  Name copyWith({
    int? nameId,
    String? name,
    String? desc,
    String? gender,
    int? positive_votes,
    int? negative_votes,
  }) {
    return Name(
      nameId: nameId ?? this.nameId,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      gender: gender ?? this.gender,
      positive_votes: positive_votes ?? this.positive_votes,
      negative_votes: negative_votes ?? this.negative_votes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameId': nameId,
      'name': name,
      'desc': desc,
      'gender': gender,
      'positive_votes': positive_votes,
      'negative_votes': negative_votes,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      nameId: map['nameId']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      gender: map['gender'] ?? '',
      positive_votes: map['positive_votes']?.toInt() ?? 0,
      negative_votes: map['negative_votes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) => Name.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Name(nameId: $nameId, name: $name, desc: $desc, gender: $gender, positive_votes: $positive_votes, negative_votes: $negative_votes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Name &&
        other.nameId == nameId &&
        other.name == name &&
        other.desc == desc &&
        other.gender == gender &&
        other.positive_votes == positive_votes &&
        other.negative_votes == negative_votes;
  }

  @override
  int get hashCode {
    return nameId.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        gender.hashCode ^
        positive_votes.hashCode ^
        negative_votes.hashCode;
  }
}
