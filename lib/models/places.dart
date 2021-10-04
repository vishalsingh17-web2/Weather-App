// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.location,
    required this.current,
    required this.forecast,
  });

  Location location;
  Current current;
  Forecast forecast;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
      };
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  String lastUpdatedEpoch;
  String lastUpdated;
  String tempC;
  String tempF;
  String isDay;
  Condition condition;
  String windMph;
  String windKph;
  String windDegree;
  String pressureMb;
  String pressureIn;
  String precipMm;
  String precipIn;
  String humidity;
  String cloud;
  String feelslikeC;
  String feelslikeF;
  String visKm;
  String visMiles;
  String uv;
  String gustMph;
  String gustKph;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"].toString(),
        lastUpdated: json["last_updated"].toString(),
        tempC: json["temp_c"].toString(),
        tempF: json["temp_f"].toString(),
        isDay: json["is_day"].toString(),
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"].toString(),
        windKph: json["wind_kph"].toString(),
        windDegree: json["wind_degree"].toString(),
        pressureMb: json["pressure_mb"].toString(),
        pressureIn: json["pressure_in"].toString(),
        precipMm: json["precip_mm"].toString(),
        precipIn: json["precip_in"].toString(),
        humidity: json["humidity"].toString(),
        cloud: json["cloud"].toString(),
        feelslikeC: json["feelslike_c"].toString(),
        feelslikeF: json["feelslike_f"].toString(),
        visKm: json["vis_km"].toString(),
        visMiles: json["vis_miles"].toString(),
        uv: json["uv"].toString(),
        gustMph: json["gust_mph"].toString(),
        gustKph: json["gust_kph"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  String text;
  String icon;
  String code;

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}



class Forecast {
  Forecast({
    required this.forecastday,
  });

  List<Forecastday> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
      };
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  DateTime date;
  int dateEpoch;
  Day day;
  Astro astro;
  List<Hour> hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
      };
}

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  String moonIllumination;

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
      };
}

class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  String maxtempC;
  String maxtempF;
  String mintempC;
  String mintempF;
  String avgtempC;
  String avgtempF;
  String maxwindMph;
  String maxwindKph;
  String totalprecipMm;
  String totalprecipIn;
  String avgvisKm;
  String avgvisMiles;
  String avghumidity;
  String dailyWillItRain;
  String dailyChanceOfRain;
  String dailyWillItSnow;
  String dailyChanceOfSnow;
  Condition condition;
  String uv;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"].toString(),
        maxtempF: json["maxtemp_f"].toString(),
        mintempC: json["mintemp_c"].toString(),
        mintempF: json["mintemp_f"].toString(),
        avgtempC: json["avgtemp_c"].toString(),
        avgtempF: json["avgtemp_f"].toString(),
        maxwindMph: json["maxwind_mph"].toString(),
        maxwindKph: json["maxwind_kph"].toString(),
        totalprecipMm: json["totalprecip_mm"].toString(),
        totalprecipIn: json["totalprecip_in"].toString(),
        avgvisKm: json["avgvis_km"].toString(),
        avgvisMiles: json["avgvis_miles"].toString(),
        avghumidity: json["avghumidity"].toString(),
        dailyWillItRain: json["daily_will_it_rain"].toString(),
        dailyChanceOfRain: json["daily_chance_of_rain"].toString(),
        dailyWillItSnow: json["daily_will_it_snow"].toString(),
        dailyChanceOfSnow: json["daily_chance_of_snow"].toString(),
        condition: Condition.fromJson(json["condition"]),
        uv: json["uv"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition.toJson(),
        "uv": uv,
      };
}

class Hour {
  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  String timeEpoch;
  String time;
  String tempC;
  String tempF;
  String isDay;
  Condition condition;
  String windMph;
  String windKph;
  String windDegree;
  String pressureMb;
  String pressureIn;
  String precipMm;
  String precipIn;
  String humidity;
  String cloud;
  String feelslikeC;
  String feelslikeF;
  String windchillC;
  String windchillF;
  String heatindexC;
  String heatindexF;
  String dewpointC;
  String dewpointF;
  String willItRain;
  String chanceOfRain;
  String willItSnow;
  String chanceOfSnow;
  String visKm;
  String visMiles;
  String gustMph;
  String gustKph;
  String uv;

  factory Hour.fromJson(Map<String, dynamic> json){ 
    var a = Hour(
        timeEpoch: json["time_epoch"].toString(),
        time: json["time"].toString(),
        tempC: json["temp_c"].toString(),
        tempF: json["temp_f"].toString(),
        isDay: json["is_day"].toString(),
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"].toString(),
        windKph: json["wind_kph"].toString(),
        windDegree: json["wind_degree"].toString(),
        pressureMb: json["pressure_mb"].toString(),
        pressureIn: json["pressure_in"].toString(),
        precipMm: json["precip_mm"].toString(),
        precipIn: json["precip_in"].toString(),
        humidity: json["humidity"].toString(),
        cloud: json["cloud"].toString(),
        feelslikeC: json["feelslike_c"].toString(),
        feelslikeF: json["feelslike_f"].toString(),
        windchillC: json["windchill_c"].toString(),
        windchillF: json["windchill_f"].toString(),
        heatindexC: json["heatindex_c"].toString(),
        heatindexF: json["heatindex_f"].toString(),
        dewpointC: json["dewpoint_c"].toString(),
        dewpointF: json["dewpoint_f"].toString(),
        willItRain: json["will_it_rain"].toString(),
        chanceOfRain: json["chance_of_rain"].toString(),
        willItSnow: json["will_it_snow"].toString(),
        chanceOfSnow: json["chance_of_snow"].toString(),
        visKm: json["vis_km"].toString(),
        visMiles: json["vis_miles"].toString(),
        gustMph: json["gust_mph"].toString(),
        gustKph: json["gust_kph"].toString(),
        uv: json["uv"].toString(),
      );
      print(a.uv);
      return a;
  }
  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "uv": uv,
      };
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  String name;
  String region;
  String country;
  String lat;
  String lon;
  String tzId;
  String localtimeEpoch;
  String localtime;

  factory Location.fromJson(Map<String, dynamic> json) {
    var a = Location(
      name: json["name"].toString(),
      region: json["region"].toString(),
      country: json["country"].toString(),
      lat: json["lat"].toString(),
      lon: json["lon"].toString(),
      tzId: json["tz_id"].toString(),
      localtimeEpoch: json["localtime_epoch"].toString(),
      localtime: json["localtime"].toString(),
    );
    return a;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  EnumValues(this.map);

  Map<T, String> get reverse {
    Map<T, String> reverseMap;

    reverseMap = map.map((k, v) => new MapEntry(v, k));

    return reverseMap;
  }
}
