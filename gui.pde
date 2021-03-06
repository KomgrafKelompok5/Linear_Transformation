/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:353142:
  appc.background(230);
} //_CODE_:window1:353142:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:693935:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
 
} //_CODE_:textfield1:693935:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:792332:
  println("textfield2 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield2:792332:

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:775357:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
   points.add(new Point(int(textfield1.getText()), int(textfield2.getText())));
   textfield1.setText("");
   textfield2.setText("");
   Choose =0;
} //_CODE_:button1:775357:

public void button2_click1(GButton source, GEvent event) { //_CODE_:button2:502307:
  println("button2 - GButton >> GEvent." + event + " @ " + millis());
  x= float( textfield10.getText());
  y=float (textfield11.getText());
  Choose=1;
   textfield10.setText("");
   textfield11.setText("");
} //_CODE_:button2:502307:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:280832:
  println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
 
} //_CODE_:textfield3:280832:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:423514:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
  theta = int (textfield3.getText());
  Choose=2;
  textfield3.setText("");
} //_CODE_:button3:423514:

public void textfield4_change1(GTextField source, GEvent event) { //_CODE_:textfield4:537282:
  println("textfield4 - GTextField >> GEvent." + event + " @ " + millis());
 
} //_CODE_:textfield4:537282:

public void button4_click1(GButton source, GEvent event) { //_CODE_:button4:319971:
  println("button4 - GButton >> GEvent." + event + " @ " + millis());
  x = float (textfield4.getText());
  y = float (textfield5.getText());
  Choose=3;
   textfield4.setText("");
    textfield5.setText("");
} //_CODE_:button4:319971:

public void textfield6_change1(GTextField source, GEvent event) { //_CODE_:textfield6:847531:
  println("textfield6 - GTextField >> GEvent." + event + " @ " + millis());
 
} //_CODE_:textfield6:847531:

public void textfield7_change1(GTextField source, GEvent event) { //_CODE_:textfield7:760164:
  println("textfield7 - GTextField >> GEvent." + event + " @ " + millis());
  
} //_CODE_:textfield7:760164:

public void button5_click1(GButton source, GEvent event) { //_CODE_:button5:839469:
  println("button5 - GButton >> GEvent." + event + " @ " + millis());
  k= float (textfield6.getText());
  axis = (textfield7.getText()).charAt(0);
   Choose=4;
    textfield6.setText("");
     textfield7.setText("");
} //_CODE_:button5:839469:

public void textfield9_change1(GTextField source, GEvent event) { //_CODE_:textfield9:271526:
  println("textfield9 - GTextField >> GEvent." + event + " @ " + millis());

} //_CODE_:textfield9:271526:

public void button6_click1(GButton source, GEvent event) { //_CODE_:button6:484688:
  println("button6 - GButton >> GEvent." + event + " @ " + millis());
  yFactor = float (textfield9.getText());
   xFactor = yFactor;
  Choose=5;
  textfield9.setText("");
} //_CODE_:button6:484688:

public void textfield10_change1(GTextField source, GEvent event) { //_CODE_:textfield10:408774:
  println("textfield10 - GTextField >> GEvent." + event + " @ " + millis());
  
} //_CODE_:textfield10:408774:

public void textfield11_change1(GTextField source, GEvent event) { //_CODE_:textfield11:651069:
  println("textfield11 - GTextField >> GEvent." + event + " @ " + millis());
  
} //_CODE_:textfield11:651069:

public void textfield12_change1(GTextField source, GEvent event) { //_CODE_:textfield12:321277:
  println("textfield12 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield12:321277:

public void button7_click1(GButton source, GEvent event) { //_CODE_:button7:622198:
  println("button7 - GButton >> GEvent." + event + " @ " + millis());
  Choose=6;
  refAxis= textfield12.getText();
  textfield12.setText("");
} //_CODE_:button7:622198:

public void textfield5_change1(GTextField source, GEvent event) { //_CODE_:textfield5:967213:
  println("textfield5 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield5:967213:

public void button8_click1(GButton source, GEvent event) { //_CODE_:button8:471526:
  println("button8 - GButton >> GEvent." + event + " @ " + millis());
  clearshape();
} //_CODE_:button8:471526:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Control", 0, 0, 220, 450, JAVA2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw1");
  textfield1 = new GTextField(window1, 15, 29, 52, 25, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  textfield2 = new GTextField(window1, 76, 29, 52, 24, G4P.SCROLLBARS_NONE);
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  button1 = new GButton(window1, 137, 26, 68, 30);
  button1.setText("Build Shape");
  button1.addEventHandler(this, "button1_click1");
  label1 = new GLabel(window1, 64, 3, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Build Shape");
  label1.setOpaque(false);
  label2 = new GLabel(window1, 64, 69, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Reflect");
  label2.setOpaque(false);
  button2 = new GButton(window1, 137, 95, 60, 29);
  button2.setText("Reflect");
  button2.addEventHandler(this, "button2_click1");
  label3 = new GLabel(window1, 66, 132, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Rotate");
  label3.setOpaque(false);
  textfield3 = new GTextField(window1, 37, 159, 64, 25, G4P.SCROLLBARS_NONE);
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  button3 = new GButton(window1, 108, 158, 74, 30);
  button3.setText("Rotate");
  button3.addEventHandler(this, "button3_click1");
  label4 = new GLabel(window1, 64, 194, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Translate");
  label4.setOpaque(false);
  textfield4 = new GTextField(window1, 13, 221, 63, 26, G4P.SCROLLBARS_NONE);
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  button4 = new GButton(window1, 145, 217, 66, 28);
  button4.setText("Translate");
  button4.addEventHandler(this, "button4_click1");
  textfield6 = new GTextField(window1, 13, 278, 59, 26, G4P.SCROLLBARS_NONE);
  textfield6.setOpaque(true);
  textfield6.addEventHandler(this, "textfield6_change1");
  label5 = new GLabel(window1, 62, 252, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Shear");
  label5.setOpaque(false);
  textfield7 = new GTextField(window1, 78, 278, 61, 26, G4P.SCROLLBARS_NONE);
  textfield7.setOpaque(true);
  textfield7.addEventHandler(this, "textfield7_change1");
  button5 = new GButton(window1, 145, 277, 65, 29);
  button5.setText("Shear");
  button5.addEventHandler(this, "button5_click1");
  label6 = new GLabel(window1, 64, 311, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("Stretch");
  label6.setOpaque(false);
  textfield9 = new GTextField(window1, 49, 335, 66, 26, G4P.SCROLLBARS_NONE);
  textfield9.setOpaque(true);
  textfield9.addEventHandler(this, "textfield9_change1");
  button6 = new GButton(window1, 119, 334, 62, 26);
  button6.setText("Stretch");
  button6.addEventHandler(this, "button6_click1");
  textfield10 = new GTextField(window1, 9, 96, 60, 24, G4P.SCROLLBARS_NONE);
  textfield10.setOpaque(true);
  textfield10.addEventHandler(this, "textfield10_change1");
  textfield11 = new GTextField(window1, 75, 96, 55, 26, G4P.SCROLLBARS_NONE);
  textfield11.setOpaque(true);
  textfield11.addEventHandler(this, "textfield11_change1");
  label7 = new GLabel(window1, 64, 367, 80, 20);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Reflect 2");
  label7.setOpaque(false);
  textfield12 = new GTextField(window1, 42, 387, 65, 26, G4P.SCROLLBARS_NONE);
  textfield12.setOpaque(true);
  textfield12.addEventHandler(this, "textfield12_change1");
  button7 = new GButton(window1, 113, 386, 59, 28);
  button7.setText("Face text");
  button7.addEventHandler(this, "button7_click1");
  textfield5 = new GTextField(window1, 80, 219, 60, 28, G4P.SCROLLBARS_NONE);
  textfield5.setOpaque(true);
  textfield5.addEventHandler(this, "textfield5_change1");
  button8 = new GButton(window1, 70, 421, 67, 27);
  button8.setText("CLEAR");
  button8.addEventHandler(this, "button8_click1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GTextField textfield1; 
GTextField textfield2; 
GButton button1; 
GLabel label1; 
GLabel label2; 
GButton button2; 
GLabel label3; 
GTextField textfield3; 
GButton button3; 
GLabel label4; 
GTextField textfield4; 
GButton button4; 
GTextField textfield6; 
GLabel label5; 
GTextField textfield7; 
GButton button5; 
GLabel label6; 
GTextField textfield9; 
GButton button6; 
GTextField textfield10; 
GTextField textfield11; 
GLabel label7; 
GTextField textfield12; 
GButton button7; 
GTextField textfield5; 
GButton button8; 