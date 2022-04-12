class ValorantModel {
  String? displayName;
  String? description;
  String? img;
  String? imgBack;
  List<dynamic>? abilities; 
  String?  displayIcon; 

  ValorantModel(
      {this.description,
      this.displayName,
      this.img,
      this.imgBack,
      this.abilities,
      this.displayIcon});

  factory ValorantModel.fromJsomMap(Map<String, dynamic> json) {
    return ValorantModel(
      displayName: json['displayName'],
      description: json['description'],
      imgBack: json['background'],
      img: json['fullPortraitV2'],
      displayIcon: json['displayIcon'],
      abilities: json['abilities']
    );
  }
}
  
