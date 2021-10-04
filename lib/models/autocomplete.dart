import 'dart:convert';
List<Autocom> autocomFromJson(String str) => List<Autocom>.from(json.decode(str).map((x) => Autocom.fromJson(x)));
String autocomToJson(List<Autocom> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Autocom {
    Autocom({
        required this.id,
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.url,
    });

    int id;
    String name;
    String region;
    String country;
    String lat;
    String lon;
    String url;

    factory Autocom.fromJson(Map<String, dynamic> json) => Autocom(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"].toString(),
        lon: json["lon"].toString(),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "url": url,
    };
}
