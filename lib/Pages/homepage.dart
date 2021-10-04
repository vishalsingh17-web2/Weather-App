import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/Constants.dart';
import 'package:weather/models/places.dart';
import 'package:weather/Pages/search.dart';

class HomePage extends StatefulWidget {
  String place;
  HomePage({required this.place});

  @override
  _HomePageState createState() => _HomePageState();
}

Future<Welcome> getdata(String place) async {
  var response = await http.get(Uri.parse(Constant.baseUrl+place));
  Welcome body = welcomeFromJson(response.body);
  return body;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdata(widget.place),
      builder: (context, AsyncSnapshot<Welcome> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "Weather",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Search()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            body: ListView(
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        subtitle: Image.network(
                          'https:' + data.current.condition.icon,
                          height: 120,
                          width: 120,
                        ),
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data.location.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              data.location.localtime
                                  .substring(0, 10)
                                  .replaceAll("-", " / "),
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        isThreeLine: true,
                      ),
                      Text(
                        data.current.condition.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      Text(data.current.tempC +
                          "℃ / " +
                          data.current.tempF +
                          "℉"),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Today's Forecast",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.forecast.forecastday[0].hour.length,
                    itemBuilder: (context, index) {
                      var day = data.forecast.forecastday[0].hour[index];
                      if (DateTime.parse(day.time).isAfter(DateTime.now())) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(day.time.substring(11, 16)),
                              Image.network(
                                "https:" + day.condition.icon,
                                height: 100,
                                width: 100,
                              ),
                              Text(day.condition.text),
                              Text(
                                day.tempC + "℃ / " + day.tempF + "℉",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                const Divider(),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ListTile(
                              title: const Text("Sunrise"),
                              subtitle: Text(
                                data.forecast.forecastday[0].astro.sunrise,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ListTile(
                              title: const Text("Sunset"),
                              subtitle: Text(
                                data.forecast.forecastday[0].astro.sunset,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ListTile(
                              title: const Text("Precipitation"),
                              subtitle: Text(
                                  "${double.parse(data.current.precipIn) * 100}" +
                                      " %"),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ListTile(
                              title: const Text("Humidity"),
                              subtitle: Text(data.current.humidity + " %"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ListTile(
                              title: const Text("Wind"),
                              subtitle: Text(data.current.windKph + " km/h"),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ListTile(
                              title: const Text("Pressure"),
                              subtitle: Text(data.current.pressureMb + " hPa"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }
}
