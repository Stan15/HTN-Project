class User {
  String id;
  int numberOfSuggestions;
  int increaseBy = 20;
  static int unique = 0;

  User(this.id) {
    this.numberOfSuggestions = 20;
  }

  String getSuggestion(index) {
    unique++;
    return unique.toString();

  }

  List<String> getSuggestions() {
    List<String> suggestions = new List<String>();
    for (int i=0; i<this.numberOfSuggestions; i++) {
      //remove user from database
      String suggestedUser = getSuggestion(i);
      if (suggestedUser!=null) {
        suggestions.add(suggestedUser);
      }
    }
    return suggestions;
  }

  List<String> addSuggestions(List<String> suggestions) {
    numberOfSuggestions += increaseBy;
    while(suggestions.length<numberOfSuggestions) {
      String suggestedUser = getSuggestion(suggestions.length);
      if (suggestedUser!=null) {
        suggestions.add(suggestedUser);
      }
    }
  }

  List<String> removeUserSuggestion(List<String> suggestions, String suggestedUser) {
    //remove user from database
    String responseCode = "200";
    if (responseCode=="200") {
      suggestions.remove(suggestedUser);
      addSuggestions(suggestions);
    }
    return suggestions;
  }
}