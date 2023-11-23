import 'dart:core';

class Usage {

  int promptTokens;
  int completionTokens;
  int totalTokens;


  Usage(this.promptTokens, this.completionTokens, this.totalTokens);


  Usage.name(this.promptTokens, this.completionTokens, this.totalTokens);

  int getPromptTokens() {
    return promptTokens;
  }

  void setPromptTokens(int promptTokens) {
    this.promptTokens = promptTokens;
  }

  int getCompletionTokens() {
    return completionTokens;
  }

  void setCompletionTokens(int completionTokens) {
    this.completionTokens = completionTokens;
  }

  int getTotalTokens() {
    return totalTokens;
  }

  void setTotalTokens(int totalTokens) {
    this.totalTokens = totalTokens;
  }

  factory Usage.fromJson(Map<String, dynamic> json){
    return Usage(json['promptTokens'] ?? 0, json['completionTokens'] ?? 0, json['totalTokens'] ?? 0);
  }

}