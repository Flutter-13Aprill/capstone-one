class BussController {
  static List<Map<String, dynamic>> allBuss = [
    {
      "isFavorite": "false",
      "line": 945,
      "time": 16,
      "nextTime": 30,
      "stationName": "al-khaleej station 514",
    },
    {
      "isFavorite": "false",
      "line": 945,
      "time": 32,
      "nextTime": 51,
      "stationName": "al-khaleej station 513",
    },
    {
      "isFavorite": "false",
      "line": 540,
      "time": 12,
      "nextTime": 30,
      "stationName": "salman al farsi 101",
    },
    {
      "isFavorite": "true",
      "line": 540,
      "time": 6,
      "nextTime": 12,
      "stationName": "salman al farsi 102",
    },
  ];

  static List listWithbuss =
      allBuss.where((element) => element["stationName"].contains("")).toList();

  static busfav(index) {
    if (allBuss[index]["isFavorite"] == "true") {
      allBuss[index]["isFavorite"] = "false";
    } else {
      allBuss[index]["isFavorite"] = "true";
    }
  }

  static busSearch(value) {
    listWithbuss =
        allBuss
            .where((element) => element["stationName"].contains(value))
            .toList();
  }
}
