import 'dart:convert';
import 'package:bus_app/models/busStation_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';


class ApiServices{

  final String baseUrl = 'https://apis.data.go.kr/6260000/BusanBIMS/busInfo?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D';
  //baseUrl은 사용하는 모든 api에 들어가는 요소
  //'$baseUrl&lineno'
  //'$baseUrl&lineid'

  final String localUrl = '%EB%B6%80%EC%82%B0%EC%A7%84%EA%B5%AC6';
  //localUrl = 부산진구의 버스넘버=lineno => 숫자를 넣어도 됨 ex)버스번호 1번이면 lineno=1
  //lineno로 lineid를 구하면 버스의 실시간 정보를 받을 수 있다.
  //노선정보조회 API로 lineid를 구함 => 노선 정류소 조회 API사용

  final String testUrl = 'https://apis.data.go.kr/6260000/BusanBIMS/busStopList?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D&pageNo=1&numOfRows=10&bstopnm=%EB%8F%99%EC%9D%98%EB%8C%80%EC%97%AD';
  //위 url은 정류소정보 조회 api중 특정 파라미터가 첨가된것
  //사용시 파라미터를 변환해줘야함.

  getBusStation() async{ //버스정류장 정보 검색
    List<BusStation> busStationInstances = [];
    final url= Uri.parse(testUrl);
    final response = await http.get(url);

    final getXmlData = response.body; //xml 데이터를 받아온다.
    final Xml2JsonData = Xml2Json()..parse(getXmlData); //json으로 변환
    final jsonData = Xml2JsonData.toParker(); //그냥 령식 옵션
    final List<dynamic> busStations= jsonDecode(jsonData)['response']['body']['items']['item'];
    //print(busStations[0]['stoptype'].runtimeType);
    for(var busStation in busStations){
    print(BusStation.fromJson(busStation).gpsx);
    busStationInstances.add(BusStation.fromJson(busStation));
    //print(busStation);
  }
    print(busStationInstances);
  }

    getLineId(){}

  getCurrentLocation(){}
}
