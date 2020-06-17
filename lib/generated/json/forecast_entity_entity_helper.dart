import 'package:firstFlutterApp/model/forecast_entity_entity.dart';

forecastEntityEntityFromJson(ForecastEntityEntity data, Map<String, dynamic> json) {
	if (json['cod'] != null) {
		data.cod = json['cod']?.toString();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toInt();
	}
	if (json['cnt'] != null) {
		data.cnt = json['cnt']?.toInt();
	}
	if (json['list'] != null) {
		data.xList = new List<ForecastEntityList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new ForecastEntityList().fromJson(v));
		});
	}
	if (json['city'] != null) {
		data.city = new ForecastEntityCity().fromJson(json['city']);
	}
	return data;
}

Map<String, dynamic> forecastEntityEntityToJson(ForecastEntityEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cod'] = entity.cod;
	data['message'] = entity.message;
	data['cnt'] = entity.cnt;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	if (entity.city != null) {
		data['city'] = entity.city.toJson();
	}
	return data;
}

forecastEntityListFromJson(ForecastEntityList data, Map<String, dynamic> json) {
	if (json['dt'] != null) {
		data.dt = json['dt']?.toInt();
	}
	if (json['main'] != null) {
		data.main = new ForecastEntityListMain().fromJson(json['main']);
	}
	if (json['weather'] != null) {
		data.weather = new List<ForecastEntityListWeather>();
		(json['weather'] as List).forEach((v) {
			data.weather.add(new ForecastEntityListWeather().fromJson(v));
		});
	}
	if (json['clouds'] != null) {
		data.clouds = new ForecastEntityListClouds().fromJson(json['clouds']);
	}
	if (json['wind'] != null) {
		data.wind = new ForecastEntityListWind().fromJson(json['wind']);
	}
	if (json['sys'] != null) {
		data.sys = new ForecastEntityListSys().fromJson(json['sys']);
	}
	if (json['dt_txt'] != null) {
		data.dtTxt = json['dt_txt']?.toString();
	}
	return data;
}

Map<String, dynamic> forecastEntityListToJson(ForecastEntityList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dt'] = entity.dt;
	if (entity.main != null) {
		data['main'] = entity.main.toJson();
	}
	if (entity.weather != null) {
		data['weather'] =  entity.weather.map((v) => v.toJson()).toList();
	}
	if (entity.clouds != null) {
		data['clouds'] = entity.clouds.toJson();
	}
	if (entity.wind != null) {
		data['wind'] = entity.wind.toJson();
	}
	if (entity.sys != null) {
		data['sys'] = entity.sys.toJson();
	}
	data['dt_txt'] = entity.dtTxt;
	return data;
}

forecastEntityListMainFromJson(ForecastEntityListMain data, Map<String, dynamic> json) {
	if (json['temp'] != null) {
		data.temp = json['temp']?.toDouble();
	}
	if (json['feels_like'] != null) {
		data.feelsLike = json['feels_like']?.toDouble();
	}
	if (json['temp_min'] != null) {
		data.tempMin = json['temp_min']?.toDouble();
	}
	if (json['temp_max'] != null) {
		data.tempMax = json['temp_max']?.toDouble();
	}
	if (json['pressure'] != null) {
		data.pressure = json['pressure']?.toInt();
	}
	if (json['sea_level'] != null) {
		data.seaLevel = json['sea_level']?.toInt();
	}
	if (json['grnd_level'] != null) {
		data.grndLevel = json['grnd_level']?.toInt();
	}
	if (json['humidity'] != null) {
		data.humidity = json['humidity']?.toInt();
	}
	if (json['temp_kf'] != null) {
		data.tempKf = json['temp_kf']?.toDouble();
	}
	return data;
}

Map<String, dynamic> forecastEntityListMainToJson(ForecastEntityListMain entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['temp'] = entity.temp;
	data['feels_like'] = entity.feelsLike;
	data['temp_min'] = entity.tempMin;
	data['temp_max'] = entity.tempMax;
	data['pressure'] = entity.pressure;
	data['sea_level'] = entity.seaLevel;
	data['grnd_level'] = entity.grndLevel;
	data['humidity'] = entity.humidity;
	data['temp_kf'] = entity.tempKf;
	return data;
}

forecastEntityListWeatherFromJson(ForecastEntityListWeather data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['main'] != null) {
		data.main = json['main']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	return data;
}

Map<String, dynamic> forecastEntityListWeatherToJson(ForecastEntityListWeather entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['main'] = entity.main;
	data['description'] = entity.description;
	data['icon'] = entity.icon;
	return data;
}

forecastEntityListCloudsFromJson(ForecastEntityListClouds data, Map<String, dynamic> json) {
	if (json['all'] != null) {
		data.all = json['all']?.toInt();
	}
	return data;
}

Map<String, dynamic> forecastEntityListCloudsToJson(ForecastEntityListClouds entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['all'] = entity.all;
	return data;
}

forecastEntityListWindFromJson(ForecastEntityListWind data, Map<String, dynamic> json) {
	if (json['speed'] != null) {
		data.speed = json['speed']?.toDouble();
	}
	if (json['deg'] != null) {
		data.deg = json['deg']?.toInt();
	}
	return data;
}

Map<String, dynamic> forecastEntityListWindToJson(ForecastEntityListWind entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['speed'] = entity.speed;
	data['deg'] = entity.deg;
	return data;
}

forecastEntityListSysFromJson(ForecastEntityListSys data, Map<String, dynamic> json) {
	if (json['pod'] != null) {
		data.pod = json['pod']?.toString();
	}
	return data;
}

Map<String, dynamic> forecastEntityListSysToJson(ForecastEntityListSys entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pod'] = entity.pod;
	return data;
}

forecastEntityCityFromJson(ForecastEntityCity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['coord'] != null) {
		data.coord = new ForecastEntityCityCoord().fromJson(json['coord']);
	}
	if (json['country'] != null) {
		data.country = json['country']?.toString();
	}
	if (json['timezone'] != null) {
		data.timezone = json['timezone']?.toInt();
	}
	if (json['sunrise'] != null) {
		data.sunrise = json['sunrise']?.toInt();
	}
	if (json['sunset'] != null) {
		data.sunset = json['sunset']?.toInt();
	}
	return data;
}

Map<String, dynamic> forecastEntityCityToJson(ForecastEntityCity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	if (entity.coord != null) {
		data['coord'] = entity.coord.toJson();
	}
	data['country'] = entity.country;
	data['timezone'] = entity.timezone;
	data['sunrise'] = entity.sunrise;
	data['sunset'] = entity.sunset;
	return data;
}

forecastEntityCityCoordFromJson(ForecastEntityCityCoord data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat']?.toDouble();
	}
	if (json['lon'] != null) {
		data.lon = json['lon']?.toDouble();
	}
	return data;
}

Map<String, dynamic> forecastEntityCityCoordToJson(ForecastEntityCityCoord entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	return data;
}