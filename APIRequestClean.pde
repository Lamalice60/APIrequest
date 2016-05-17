/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/225852*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//For more information about this API visit: https://market.mashape.com/gobter/online-images-associated-with-a-keyword
import processing.net.*;
import http.requests.*;

String apiUrl = "http://api.open-notify.org/iss-now.json";
String mashApeKey = "je sais pas";
GetRequest get; //request object


float lat;

boolean apiReady = false; //API LOADED ?

void setup() 
{
  size(700, 700);
  smooth();
  println("click to load API");
}


void draw() {
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  
  noFill();
  stroke(255);
  ellipse(0, 0, 300, 300);
  strokeWeight(5);
  stroke(0,255,0);
  line(0,0,175,0);
  
  if (apiReady) {
    fill(255);
    noStroke();
    float A = map(lat, -180, 180, -PI, PI);
    float x = cos(A)*200;
    float y = sin(A)*200;
    text("ISS position", x+10,y-20);
    text(lat, x+10,y-5);
    ellipse(x, y, 10, 10);
  }
  
  popMatrix();
}

/***********************************************
 When the mouse is clicked request API from the ISS and parse and load the response.
 ************************************************/
void mouseClicked() {
  println("sending API request...");
  apiGetRequest(apiUrl, mashApeKey);
  parseResponse();
}

/***********************************************
 parseResponse parses the JSON image urls into an array.
 Then loads those data from each url.
 ************************************************/
void parseResponse() {
  // affichage du contenu JSON
  println("JSON response: " + get.getContent());
  println("------------------------------------ Success!");

  JSONObject response = parseJSONObject(get.getContent());
  println("My ISS latitude :  ");

  JSONObject position = response.getJSONObject("iss_position");
  lat = position.getFloat("latitude");
  
  println(position.getFloat("latitude"));
  println(position.getFloat("longitude"));

  println("Done! Click again to load new API data!");
  apiReady = true; //ready to display, all API are loaded
}

/***********************************************
 apiGetRequest loads a request from an API
 ************************************************/
void apiGetRequest(String url, String APIKey) {
  get = new GetRequest(url);
  //  get.addHeader("X-Mashape-Key", APIKey); //add mashape api key to header
  //  get.addHeader("Accept", "application/json"); //ask request to return json data from API
  get.send(); // program will wait untill the request is completed
}
