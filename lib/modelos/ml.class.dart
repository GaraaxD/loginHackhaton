import 'package:json_annotation/json_annotation.dart';

part 'ml.class.g.dart';

@JsonSerializable()
class ml {
  final double acc;
  final double caminar;
  final double ver;
  final double escuchar;
  final double hablar;
  final double cuidado;
  final double recordar;
  final double mental;

  ml(this.acc, this.caminar, this.ver, this.escuchar, this.hablar, this.cuidado,
      this.recordar, this.mental);

  factory ml.fromJson(Map<String, dynamic> json) => _$mlFromJson(json);

  Map<String, dynamic> toJson() => _$mlToJson(this);
}
