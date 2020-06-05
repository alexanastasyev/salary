{
  Модуль рисования основных графических элементов.
}

Unit drawing;

Uses
  GraphABC;

Const
  // -------------------------
  // Координаты кнопок
  
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
  
  button5_y1 = 210;
  button5_y2 = 250;
  
  // ---------------------------

Var
  admin: boolean; // True, если в режиме админа
  menu_status: integer; // Переменная, хранящая номер состояния меню

// Выводит название программы на старте  
Procedure ProgName();
Begin
  SetFontColor(clBlack);
  SetFontSize(28);
  SetBrushColor(clWhite);
  TextOut(210, 20, 'Программа "Зарплата"');
  SetFontSize(20);
  TextOut(210, 70, 'курсовая работа');
  TextOut(210, 110, 'студента 935 группы');
  TextOut(210, 150, 'Старшинова Виталия');
end;

// Рисует форматированную кнопку
// (x1, y1, x2, y2 - координаты кнопки; s - текст)
Procedure DrawButton(x1, y1, x2, y2: integer; s: string);
Begin
  SetPenColor(clBlack);
  SetPenWidth(2);
  SetBrushColor(clLightGray);
  DrawRectangle(x1, y1, x2, y2);
  FillRectangle(x1 + 2, y1 + 2, x2 - 2, y2 - 2);
  SetFontColor(clBlack);
  SetFontSize(16);
  SetBrushStyle(bsClear);
  TextOut(x1 + 3, y1 + 3, s);
  SetBrushStyle(bsSolid);
  
end;

// Рисует главное меню пользователя
Procedure MainMenu();
Begin
  ClearWindow;
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= 0;
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  DrawRectangle(200, 10, 990, 590);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Показать записи');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Выход');
  
end;

// Рисует главное меню администратора
Procedure AdminMainMenu();
Begin
  admin:= true;
  
  ClearWindow;
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= 10;
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  DrawRectangle(200, 10, 990, 590);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Показать записи');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Добавить запись');
  DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'Удалить запись');
  DrawButton(button_x1, button4_y1, button_x2, button4_y2, 'Выход');
  
end;

// Рисует стрелку сортировки по окладу
Procedure DrawSalaryArrow(up: boolean);
Begin
  
  SetBrushColor(clGray);
  SetPenWidth(2);
  SetPenColor(clBlack);
  
  if not(up)
  then
  begin
    MoveTo(button_x1 + 150, button4_y1 + 30);
    LineTo(button_x1 + 150, button4_y1 + 10);
    LineTo(button_x1 + 140, button4_y1 + 20);
    MoveTo(button_x1 + 150, button4_y1 + 10);
    LineTo(button_x1 + 160, button4_y1 + 20);
  end
  else
  begin
    MoveTo(button_x1 + 150, button4_y1 + 10);
    LineTo(button_x1 + 150, button4_y1 + 30);
    LineTo(button_x1 + 140, button4_y1 + 20);
    MoveTo(button_x1 + 150, button4_y1 + 30);
    LineTo(button_x1 + 160, button4_y1 + 20);
  end;
  
end;

// Рисует стрелку сортировки по фамилии
Procedure DrawSurnameLetters(up: boolean);
Begin
  
  SetBrushColor(clLightGray);
  SetFontSize(14);
  SetFontColor(clBlack);
  
  if (up)
  then
    DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'По фамилии (а-я)')
  else
    DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'По фамилии (я-а)');
  
end;

Begin
end.