

class SaveDataModel{
  late String id;
  late String data;


  SaveDataModel({
    required this.data,
    required this.id,
  });

  SaveDataModel.fromJson(Map <String , dynamic>? json) {
    data= json!['data'];
    id=json['id'];
  }

  Map <String , dynamic> toMap(){
    return {
      'data' : data,
      'id' : id,
    };
  }
}








