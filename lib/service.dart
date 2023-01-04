import 'dart:convert';
import 'package:bus_app/models/busStation_model.dart';
import 'package:bus_app/models/busid.dart';
import 'package:bus_app/models/line_station_arr_model.dart';
import 'package:bus_app/models/line_station_model.dart';
import 'package:bus_app/models/station_arr_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';


class ApiServices{

  //baseUrl은 사용하는 모든 api에 들어가는 요소
  //'$baseUrl&lineno'
  //'$baseUrl&lineid'

  //localUrl = 부산진구의 버스넘버=lineno => 숫자를 넣어도 됨 ex)버스번호 1번이면 lineno=1
  //lineno로 lineid를 구하면 버스의 실시간 정보를 받을 수 있다.
  //노선정보조회 API로 lineid를 구함 => 노선 정류소 조회 API사용

  //위 url은 정류소정보 조회 api중 특정 파라미터가 첨가된것
  //사용시 파라미터를 변환해줘야함.

  static Future<List<BusStation>>getBusStationInfo(String bstopnm) async{ //버스정류장 정보 검색
    //1

    final String API = 'https://apis.data.go.kr/6260000/BusanBIMS/busStopList?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D';

    List<BusStation> busStationInstances = [];
    final url= Uri.parse('$API&bstopnm=$bstopnm');
    final response = await http.get(url);

    final getXmlData = response.body; //xml 데이터를 받아온다.
    final Xml2JsonData = Xml2Json()..parse(getXmlData); //json으로 변환
    final jsonData = Xml2JsonData.toParker(); //그냥 령식 옵션
    final List<dynamic> busStations= jsonDecode(jsonData)['response']['body']['items']['item'];
    //print(busStations[0]['stoptype'].runtimeType);
    for(var busStation in busStations){
    //print(BusStation.fromJson(busStation).gpsx);
    busStationInstances.add(BusStation.fromJson(busStation));
    //print(busStation);
  }
    return busStationInstances;
    //print(busStationInstances);
  }

  static Future<List<BusId>> getLineId(String lineno)async{ 
    //노선 정보 조회
    //lineid를 구하기 위한 API
    //2
    //버스 번호를 검색하면 해당 번호가 포함되는 버스의 출발점과 종점을 알 수 있다.

    final String API = 'https://apis.data.go.kr/6260000/BusanBIMS/busInfo?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D';

    List<BusId> busLineId = [];
    final url = Uri.parse('$API&lineno=$lineno');
    final response = await http.get(url);

    final getXmlData = response.body; 
    final Xml2JsonData = Xml2Json()..parse(getXmlData);
    final jsonData = Xml2JsonData.toParker(); 
    final buses= jsonDecode(jsonData)['response']['body']['items']['item'];

    //print(buses.runtimeType);
    if('${buses.runtimeType}'=="List<dynamic>"){
      for(var bus in buses){
      busLineId.add(BusId.fromJson(bus));
    }
    }else{
      busLineId.add(BusId.fromJson(buses));
      //print('Map');
    }
    return busLineId;
  }

  //https://apis.data.go.kr/6260000/BusanBIMS/busInfo?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D&lineid=5200179000&lineno=179


  // 4-https://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D&bstopid=505780000
  // 5-https://apis.data.go.kr/6260000/BusanBIMS/busStopArrByBstopidLineid?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D&lineid=5200179000&bstopid=505780000
  static Future<List<LineStationModel>> getLineStationInfo(String lineid) async{
    //노선 정류소 조회
    //3
    //버스 진행도(버스 리스트)

    final String API = 'https://apis.data.go.kr/6260000/BusanBIMS/busInfoByRouteId?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D';

    final url = Uri.parse('$API&lineid=$lineid');
    final response = await http.get(url);

    List<LineStationModel> listStationInstances = [];

    final getXmlData = response.body; 
    final Xml2JsonData = Xml2Json()..parse(getXmlData);
    final jsonData = Xml2JsonData.toParker(); 
    final lineStations= jsonDecode(jsonData)['response']['body']['items']['item'];
    for(var lineStation in lineStations){
    listStationInstances.add(LineStationModel.fromJson(lineStation));
  }
    return listStationInstances;
  }

  static Future<List<StationArrModel>> getStationArrInfo( String bstopid) async{
    //4
    //정류장을 거쳐가는 버스 종류

    final String API = 'https://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D';

    List<StationArrModel> arrInfoInstances = [];

    final url = Uri.parse('$API&bstopid=$bstopid');
    final response = await http.get(url);

    final getXmlData = response.body; 
    final Xml2JsonData = Xml2Json()..parse(getXmlData);
    final jsonData = Xml2JsonData.toParker(); 
    final infos = jsonDecode(jsonData)['response']['body']['items']['item'];

    for(var info in infos ){
    arrInfoInstances.add(StationArrModel.fromJson(info));
  }
    return arrInfoInstances;
  }
  //	노선 정류소 도착정보 조회
  static Future<List<LineStationArrInfoModel>> getLineStationArrInfo(String lineid, String bstopid) async{
    //5
    //해당 정류장까지 버스 남은 시간

    final String API = 'https://apis.data.go.kr/6260000/BusanBIMS/busStopArrByBstopidLineid?serviceKey=fqfHkv8FqBv3owcwidWY4R4PB7cITG%2FavEUwoL%2FWzmKjgevLWcU5EC%2FMoxwA6IbPYiG6%2FAxsATu7qGILV6c%2Big%3D%3D';
    List<LineStationArrInfoModel> infoInStances = [];

    final url =Uri.parse('$API&lineid=$lineid&bstopid=$bstopid');
    final response = await http.get(url);

    final getXmlData = response.body; 
    final Xml2JsonData = Xml2Json()..parse(getXmlData);
    final jsonData = Xml2JsonData.toParker(); 
    final info = jsonDecode(jsonData)['response']['body']['items']['item'];

    infoInStances.add(LineStationArrInfoModel.fromJson(info));
    return infoInStances;
    //    for(var info in infos){
    //    infoInStances.add(LineStationArrInfoModel.fromJson(info));
    //    print(infoInStances);
    //  }
  }
}
