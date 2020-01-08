class History {
  String date;
  String message;
  int idUser;
  int idFriend;
  int idSender;

  History({this.date, this.message, this.idUser, this.idFriend, this.idSender});

  History.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    message = json['message'];
    idUser = json['idUser'];
    idFriend = json['idFriend'];
    idSender = json['idSender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['message'] = this.message;
    data['idUser'] = this.idUser;
    data['idFriend'] = this.idFriend;
    data['idSender'] = this.idSender;
    return data;
  }
}
