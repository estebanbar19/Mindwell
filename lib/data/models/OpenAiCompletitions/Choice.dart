import 'package:foodfast/data/models/OpenAiCompletitions/Message.dart';

class Choice {

  int index;
  Message message;
  String finishReason;

  Choice(this.index, this.message, this.finishReason);

  Choice.name(this.index, this.message, this.finishReason);

  int getIndex() {
    return index;
  }

  void setIndex(int index) {
    this.index = index;
  }

  Message getMessage() {
    return message;
  }

  void setMessage(Message message) {
    this.message = message;
  }

  String getFinishReason() {
    return finishReason;
  }

  void setFinishReason(String finishReason) {
    this.finishReason = finishReason;
  }

  factory Choice.fromJson(Map<String, dynamic> json){
    return Choice(json['index'], Message.fromJson(json['message']), json['finishReason'] ?? "");
  }
}