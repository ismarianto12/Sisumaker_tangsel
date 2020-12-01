class ResponseModel {
  final int status;
  final String messages;
  final String link;

  ResponseModel({this.status, this.messages, this.link});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json['status'] == null ? 0 : json['status'],
        messages: json['messages'] == null ? '' : json['messages'],
        link: json['link'] == null ? '' : json['link'],
      );
}

class GridMenu {
  final String title;
  final String icon;
  final String route;

  GridMenu({this.title, this.icon, this.route});

  factory GridMenu.fronJson(Map<String, dynamic> json) => GridMenu(
        title: json['title'] == null ? '-' : json['title'],
        icon: json['icon'] == null ? '-' : json['icon'],
        route: json['route'] == null ? '' : json['route'],
      );
}
