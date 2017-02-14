import com.hamoid.*; // for video 
VideoExport videoExport;
boolean recording = true;

Table table;

int country = 0;
int month = 0;
int d = 20;
float value_m = 0;
PFont font;


void setup() {
  frameRate(25); //make it slower
  pixelDensity(2); //make it work for Retina
  font = createFont("Georgia", 20);
  size(750,720); //sets size of the canvas
  table = loadTable("oecd_CLI_monthly_wide.csv"); // load data
  videoExport = new VideoExport(this, "CLI_per_month.mp4");
  videoExport.setFrameRate(25);
  videoExport.startMovie();
}

// for each draw, draw a new month on all countries. 

void draw() {
    textFont(font);

    background(#FFDCBF); 
    
    // footer
    stroke(0,40);
    line(30,633,720,633);
  
    fill(10,100);
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Composite leading indicator (CLI)",32,655); 
    
    textSize(15);
    textAlign(LEFT, CENTER);
    text("Source: data.oecd.org",32,680); 
    

    // calculate the index of rows
    month = month + 1;
    if (month > 741) {
      month = 1;
      videoExport.endMovie();
      exit();}
     
    
    // draw year
    String year = table.getString(month, 45);
    fill(10);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(year,70,65); 
   
    
    country = 0;
    for (int i = 0; i < 7; i = i + 1) {
      for (int j = 0; j < 6; j = j +1) {
        pushMatrix();
        translate(20+i*100,15+j*100);
        country = country+1;
        
        // get right cell and show only if it's not NA 
        float value = table.getFloat(month, country); 
        if (value == 0) {
          value_m = 0; 
        } else {
          value_m = map(value,86,113,5,125);
        }
        
        
        // draw ellipse
        noStroke();
        fill( 255-(value_m*2.5),0, value_m);
        ellipse(50, 52,value_m,value_m);
        
        // draw country names, except where the year is drawn
        fill(#FFDCBF,130);
        textSize(15); 
        String country_text = table.getString(0, country); 
        if (country > 1) { 
          text(country_text, 50,50);
        }
      
        popMatrix();
      }
  }
    if(recording) {
    videoExport.saveFrame();
   
  }
}