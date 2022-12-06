import 'package:weather_app/models/sys.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/wind.dart';

import 'cloud.dart';
import 'cord.dart';
import 'main.dart';

class ApiResponse {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  ApiResponse(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = this.base;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    data['visibility'] = this.visibility;
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    data['dt'] = this.dt;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['timezone'] = this.timezone;
    data['id'] = this.id;
    data['name'] = this.name;
    data['cod'] = this.cod;
    return data;
  }
}
