import g4p_controls.*;

int gridSize = 10;
int zoomFactor = 1;
int sX, sY;

//Data Strorage
ArrayList<Point> points = new ArrayList();
ArrayList<String> pointStrings = new ArrayList();
//End Data Strorage

//Point Class
public class Point {
  float x, y;
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
//End Point Class

//Color Class
public class Color {
  int r, g, b, a;
  public Color(int r, int g, int b, int a) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
  
  public Color(int r, int g, int b) {
    this(r, g, b, 255);
  }
}
//End Color Class

//Draw Coordinate System
void createGrid() {
  //Text Config
  fill(0, 128, 192);
  float textOffSide = gridSize / 8;
  textAlign(RIGHT, TOP);
  textSize(gridSize / 3);
  //Line Config
  stroke(0, 128, 192);
  //Draw Coordinate System
  for (int y = -height / 2, index = height / (gridSize * 2); 
    y <= height / 2; y += gridSize) {
    strokeWeight(y == 0 ? 1.2 : 0.3);
    text(index--, -textOffSide, y + textOffSide);
    ellipseMode(RADIUS);
    ellipse(0, y, gridSize / 15, gridSize / 15);
    line(-width / 2, y, width / 2, y);
  }
  for (int x = -width / 2, index = -width / (gridSize * 2); 
    x <= width / 2; x += gridSize) {
    strokeWeight(x == 0 ? 1.2 : 0.3);
    text(index++, x - textOffSide, textOffSide);
    ellipseMode(RADIUS);
    ellipse(x, 0, gridSize / 15, gridSize / 15);
    line(x, -height / 2, x, height / 2);
  }
}
//End Draw Coordinate System

//Zoom Coordinate System
float clamp(float val, float min, float max) {
  return val < min ? min : val > max ? max : val;
}

void mouseWheel(MouseEvent event) {
  zoomFactor = (int)clamp(zoomFactor - event.getCount(), 1, 4);
  gridSize = 10 * zoomFactor;
}
//End Zoom Coordinate System

//Add Point When Mouse Clicked
void mouseClicked() {
  float x = (mouseX - width / 2.0) / gridSize;
  float y = -(mouseY - height / 2.0) / gridSize;
  points.add(new Point(x, y));
  Choose =0;
}
//End Add Point When Mouse Clicked

//Draw Point on Screen
void drawPoint(ArrayList<Point> points_, Color color_) {
  for (Point point : points_) {
    float radius = clamp(gridSize / 12, 0.75, 5);
    fill(color_.r, color_.g, color_.b, color_.a);
    noStroke();
    ellipse(point.x * gridSize, point.y * gridSize, radius, radius);
    printLabel(point.x, point.y, color_);
  }
}

void printLabel(float x, float y, Color color_) {
  textSize(gridSize / 3);
  pushMatrix();
  fill(color_.r, color_.g, color_.b, color_.a);
  scale(1, -1);
  text("(" +nfc(x, 2) +", " +nfc(y, 2) +")", x * gridSize, -y * gridSize);
  popMatrix();
}
//End Draw Point on Screen

//Draw Polygon From Points
void drawPolygon(ArrayList<Point> points, Color color_) {
  if (!points.isEmpty()) {
    pushMatrix();
    stroke(color_.r, color_.g, color_.b, color_.a);
    strokeWeight(1.2);
    for (int i = 0; i < points.size() - 1; i++) {
      Point p1 = points.get(i);
      Point p2 = points.get(i + 1);
      line(p1.x * gridSize, p1.y * gridSize, p2.x * gridSize, p2.y * gridSize);
    }

    Point start = points.get(0);
    Point end = points.get(points.size() - 1);
    line(start.x * gridSize, start.y * gridSize, end.x * gridSize, end.y * gridSize);
    popMatrix();
  }
}

int orientation(Point p, Point q, Point r) {
  float val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);

  if (val == 0) return 0;
  return (val > 0)? 1: 2;
}

ArrayList<Point> convexHull(ArrayList<Point> points) {
  if (points.size() < 3) return points;
  ArrayList<Point> hull = new ArrayList();

  int l = 0;
  for (int i = 1; i < points.size(); i++)
    if (points.get(i).x < points.get(l).x)
      l = i;

  int p = l, q;
  do {
    hull.add(points.get(p));
    q = (p + 1) % points.size();

    for (int i = 0; i < points.size(); i++) {
      if (orientation(points.get(p), points.get(i), points.get(q))== 2)
        q = i;
    } 
    p = q;
  } while (p != l); 
  return hull;
}
//End Draw Polygon From Points

//Draw line
void drawLine(float m, float c, Color color_) {
  pushMatrix();
  stroke(color_.r, color_.g, color_.b, color_.a);
  strokeWeight(1.2);
  float x = width / 2;
  line(-x, lineEq(m, -x, c), x, lineEq(m, x, c));
  popMatrix();
}

float lineEq(float m, float x, float c) {
  return m * x + (c * gridSize);
}
//End Draw Line

//Linear Trasnformation
ArrayList<Point> stretch(ArrayList<Point> points, float xFactor, float yFactor){
  ArrayList<Point> result = new ArrayList<Point>();
  if(!points.isEmpty()) {
    for(Point point : points){
      result.add(new Point(point.x * xFactor, point.y * yFactor));
    }
  }
  return result;
}

ArrayList<Point> translate(ArrayList<Point> points, float x, float y){
  ArrayList<Point> result = new ArrayList<Point>();
  if(!points.isEmpty()) {
    for(Point point : points){
      result.add(new Point(point.x + x, point.y + y));
    }
  }
  return result;
}

ArrayList<Point> shear(ArrayList<Point> points, float k, char axis){
  ArrayList<Point> result = new ArrayList<Point>();
  float kX, kY;
  if(axis == 'x' || axis == 'X') {
    kX = k;
    kY = 0;
  } else if(axis == 'y' || axis == 'Y'){
    kX = 0;
    kY = k;
  } else {
    return result;
  }
  if(!points.isEmpty()) {
    for(Point point : points){
      result.add(new Point(
      point.x + (kX * point.y),
      point.y + (kY * point.x)));
    }
  }
  return result;
}

ArrayList<Point> rotate(ArrayList<Point> points, float theta){
  return rotate(points, theta, new Point(0, 0));
}

ArrayList<Point> rotate(ArrayList<Point> points, float theta, Point origin){
  ArrayList<Point> result = new ArrayList<Point>();
  float radTheta = radians(theta);
  if(!points.isEmpty()) {
    for(Point point : points){
      result.add(new Point(
      point.x * cos(radTheta) + point.y * -1 * sin(radTheta) + origin.x,
      point.x * sin(radTheta) + point.y * cos(radTheta) + origin.y
      ));
    }
  }
  return result;
}

ArrayList<Point> reflect(ArrayList<Point> points, String axis){
  ArrayList<Point> result = new ArrayList<Point>();
  int[][] matrix;
  if(axis.equalsIgnoreCase("x")) {
    matrix = new int[2][2];
    matrix[0][0] = 1;  matrix[0][1] = 0;
    matrix[1][0] = 0;  matrix[1][1] = -1;
  } else if(axis.equalsIgnoreCase("y")) {
    matrix = new int[2][2];
    matrix[0][0] = -1; matrix[0][1] = 0;
    matrix[1][0] = 0;  matrix[1][1] = 1;
  } else if(axis.equalsIgnoreCase("origin")) {
    matrix = new int[2][2];
    matrix[0][0] = -1; matrix[0][1] = 0;
    matrix[1][0] = 0;  matrix[1][1] = -1;
  } else if(axis.equalsIgnoreCase("y=x")) {
    matrix = new int[2][2];
    matrix[0][0] = 0;  matrix[0][1] = 1;
    matrix[1][0] = 1; matrix[1][1] = 0;
  } else return result;
  if(!points.isEmpty()) {
    for(Point point : points){
      result.add(new Point(
        matrix[0][0] * point.x +  matrix[0][1] * point.y,
        matrix[1][0] * point.x +  matrix[1][1] * point.y));
    }
  }
  return result;
}

ArrayList<Point> reflect(ArrayList<Point> points, float m, float c){
  ArrayList<Point> result = new ArrayList<Point>();
  if(!points.isEmpty()) {
    for(Point point : points){
      result.add(new Point(
        ((1 - m * m) * point.x + (point.y - c) * 2 * m) / (1 + m * m),
        (2 * m * point.x - (1 - m * m) * point.y + 2 * c) / (1 + m * m)));
    }
  }
  return result;
}
//End Linear Trasnformation

void clearshape(){
  points.clear();
}

//Gui
void DrawResult(ArrayList<Point> result) {
  if(Choose==1)drawLine(x, y, new Color(255, 155, 100));
  drawPoint(result, new Color(255, 0, 255));
  drawPolygon(result, new Color(255, 0, 255));
}
int Choose =0;
int theta=0;
float x=0,y=0,k=0,xFactor=0,yFactor=0;
char axis='q';
String refAxis="";
//Gui
void setup() {
  size(1200, 720);
  createGUI();
}

void draw() {
  background(255);
  translate(width/ 2, height/ 2);
  createGrid();
  scale(1, -1);
  drawPoint(points, new Color(255, 0, 0));
  drawPolygon(convexHull(points), new Color(255, 0, 0));
 // drawLine(2, 3, new Color(255, 155, 100));
  if(Choose==1)DrawResult(reflect(convexHull(points), x, y));
  if(Choose==2)DrawResult(rotate(convexHull(points),theta));
  if(Choose==3)DrawResult(translate(convexHull(points),x,y));
  if(Choose==4)DrawResult(shear(convexHull(points),k, axis));
  if(Choose==5)DrawResult(stretch(convexHull(points),xFactor,yFactor));
  if(Choose==6)DrawResult(reflect(convexHull(points), refAxis)); //belum dibuat
}