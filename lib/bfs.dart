import 'dart:collection';

import'data.dart';
import'drob.dart';


int c=0;


bool isMatchingBloodType(String donorBloodType) {

  switch (initVal) {
    case "O-":
      return donorBloodType == "O-";
    case "O+":
      return donorBloodType == "O-" || donorBloodType == "O+";
    case "B-":
      return donorBloodType == "O-" || donorBloodType == "B-";
    case "B+":
      return donorBloodType == "O-" || donorBloodType == "O+" || donorBloodType == "B-" || donorBloodType == "B+";
    case "A-":
      return donorBloodType == "O-" || donorBloodType == "A-";
    case "A+":
      return donorBloodType == "O-" || donorBloodType == "A+" || donorBloodType == "A-" || donorBloodType == "O+";
    case "AB-":
      return donorBloodType == "O-" || donorBloodType == "A-" || donorBloodType == "B-" || donorBloodType == "AB-";
    case "AB+":
      return true;
    default:
      return false;
  }
}

void findDonors(int location) {
  for (List i in data[location]!) {
    if (isMatchingBloodType(i[1])) {
      input.add(i);
      if (c == 10) {
        return;
      }
      c++;
    }
  }
}




void bfs(int? v) {


  List<bool> visited = List.filled(10, false);

  Queue<int> queue = Queue();

  queue.add(v!);
  visited[v!] = true;

  while (queue.isNotEmpty && c<=10) {

    int location = queue.removeFirst();

    findDonors(location);

    for (int neighbor in graph[location]!) {
      if (!visited[neighbor]) {
        visited[neighbor] = true;
        queue.add(neighbor);
      }
    }
  }


}
