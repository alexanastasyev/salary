Unit unit1;

Uses
  GraphABC;
  
Const
  height = 600;
  width = 1000;
  
  button_x1 = 10;
  button_x2 = 190;
  
  button1_y1 = 10;
  button1_y2 = 50;
  
  button2_y1 = 60;
  button2_y2 = 100;
  
  button3_y1 = 110;
  button3_y2 = 150;
  
  button4_y1 = 160;
  button4_y2 = 200;

Var
  menu_status: byte;

Procedure MenuMouseDown(x, y, mousebutton: integer);
Begin
  if (mousebutton = 2)
  then
    exit;
  
  case menu_status of
    0: // main menu
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            TextOut(250, 50, 'Action 1');
          
          if (y > button2_y1) and (y < button2_y2)
          then
            TextOut(250, 50, 'Action 2');
          
          if (y > button3_y1) and (y < button3_y2)
          then
            TextOut(250, 50, 'Action 3');
          
          if (y > button4_y1) and (y < button4_y2)
          then
            TextOut(250, 50, 'Action 4');
          
        end;
        
      end;
    
  end;
  
end;

Procedure DrawField();
Begin
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  DrawRectangle(200, 10, 990, 590);
end;

Procedure DrawButton(x1, y1, x2, y2: integer; s: string);
Begin
  SetPenColor(clBlack);
  SetPenWidth(2);
  SetBrushColor(clLightGray);
  DrawRectangle(x1, y1, x2, y2);
  FillRectangle(x1 + 2, y1 + 2, x2 - 2, y2 - 2);
  SetFontColor(clBlack);
  SetFontSize(16);
  TextOut(x1 + 3, y1 + 3, s);
  
end;

Procedure MainMenu();
Begin
  menu_status:= 0; // main menu
  DrawField;
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Button 1');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Button 2');
  DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'Button 3');
  DrawButton(button_x1, button4_y1, button_x2, button4_y2, 'Button 4');
  
  OnMouseDown:= MenuMouseDown;
  
end;

Begin
end.