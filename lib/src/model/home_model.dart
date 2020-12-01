class HomeModel {
  final int status;
  final String messages;
  final List<_GridMenu> menu;

  HomeModel({this.status, this.messages, this.menu});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json['status'] == null ? null : json['status'],
        messages: json['messages'] == null ? null : json['messages'],
        menu: json['menu'] == null
            ? null
            : List<_GridMenu>.from(
                json['menu'].map(
                  (x) => _GridMenu.fromJson(x),
                ),
              ),
      );
}

class _GridMenu {
  final String title;
  final String icon;
  final String route;

  _GridMenu({this.title, this.icon, this.route});

  factory _GridMenu.fromJson(Map<String, dynamic> json) => _GridMenu(
        title: json['title'] == null ? '-' : json['title'],
        icon: json['icon'] == null ? '-' : json['icon'],
        route: json['route'] == null ? '' : json['route'],
      );
}
