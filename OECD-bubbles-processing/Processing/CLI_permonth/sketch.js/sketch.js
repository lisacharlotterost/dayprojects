var table;
var country = 0;
var month2 = 0;
var d = 20;
var value_m = 0;


function preload() {
  table = loadTable("data/oecd_CLI_monthly_wide.csv", "csv");
}

function setup() {
  var canvas = createCanvas(windowWidth/2, windowHeight);
  // var x = (windowWidth - width) / 2;
  // var y = (windowHeight - height) / 2;
  // canvas.position(windowWidth/2, windowHeight/2);
}

function windowResized() {
	resizeCanvas(windowWidth, windowHeight);
}


function draw() {
  //background('#FFDCBF'); 
  background(200,100,0); 

  // calculate the index of rows
  month2 = month2 + 1;
  if (month2 > 741) {
    month2 = 1;
  }
  
  var year2 = table.getString(month2, 45);
  fill(100,100,100);
  textSize(20);
  text(year2,70,65); 
  
  country = 0;
  for (var i = 0; i < 4; i = i + 1) {
    for (var j = 0; j < 8; j = j +1) {
      push();
      translate(20+i*windowWidth,15+j*100);
      country = country+1;
      
      // get right cell and show only if it's not NA 
      var value = table.getString(month2, country); 
      value = float(value);
      if (value == 0) {
        value_m = 0; 
      } else {
        value_m = map(value,86,113,5,125);
      }
      
      
      // draw ellipse
      noStroke();
      fill(255-(value_m*2.5),0, value_m);
      ellipse(50, 52,value_m,value_m);
      
      // draw country names, except where the year is drawn
      fill('#FFDCBF');
      textSize(15); 
      var country_text = table.getString(0, country); 
      if (country > 1) { 
        text(country_text, 50,50);
      }
    
      pop();
    }
  }
}





// function setup() {
//   //count the columns
//   print(table.getRowCount() + " total rows in table");
//   print(table.getColumnCount() + " total columns in table");

//   print(table.getColumn("name"));
//   //["Goat", "Leopard", "Zebra"]

//   //cycle through the table
//   for (var r = 0; r < table.getRowCount(); r++)
//     for (var c = 0; c < table.getColumnCount(); c++) {
//       print(table.getString(r, c));
//     }
// }