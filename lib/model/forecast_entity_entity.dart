import 'package:firstFlutterApp/ListView/WeatherModel.dart';
import 'package:firstFlutterApp/generated/json/base/json_convert_content.dart';
import 'package:firstFlutterApp/generated/json/base/json_filed.dart';
import '../Constants/Constants.dart';

class ForecastEntityEntity with JsonConvert<ForecastEntityEntity> {
	String cod;
	int message;
	int cnt;
	@JSONField(name: "list")
	List<ForecastEntityList> xList;
	ForecastEntityCity city;
}

class ForecastEntityList extends ListItem with JsonConvert<ForecastEntityList> {
	int dt;
	ForecastEntityListMain main;
	List<ForecastEntityListWeather> weather;
	ForecastEntityListClouds clouds;
	ForecastEntityListWind wind;
	ForecastEntityListSys sys;
	@JSONField(name: "dt_txt")
	String dtTxt;

	DateTime getDateTime() {
		var dateTime = DateTime.parse(dtTxt);
		return dateTime;
	}

	String getIconUrl() {
		return Constants.WEATHER_IMAGES_URL + weather[0].icon + ".png";
	}
}

class ForecastEntityListMain with JsonConvert<ForecastEntityListMain> {
	double temp;
	@JSONField(name: "feels_like")
	double feelsLike;
	@JSONField(name: "temp_min")
	double tempMin;
	@JSONField(name: "temp_max")
	double tempMax;
	int pressure;
	@JSONField(name: "sea_level")
	int seaLevel;
	@JSONField(name: "grnd_level")
	int grndLevel;
	int humidity;
	@JSONField(name: "temp_kf")
	double tempKf;
}

class ForecastEntityListWeather with JsonConvert<ForecastEntityListWeather> {
	int id;
	String main;
	String description;
	String icon;
}

class ForecastEntityListClouds with JsonConvert<ForecastEntityListClouds> {
	int all;
}

class ForecastEntityListWind with JsonConvert<ForecastEntityListWind> {
	double speed;
	int deg;
}

class ForecastEntityListSys with JsonConvert<ForecastEntityListSys> {
	String pod;
}

class ForecastEntityCity with JsonConvert<ForecastEntityCity> {
	int id;
	String name;
	ForecastEntityCityCoord coord;
	String country;
	int timezone;
	int sunrise;
	int sunset;
}

class ForecastEntityCityCoord with JsonConvert<ForecastEntityCityCoord> {
	double lat;
	double lon;
}
