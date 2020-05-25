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
  
  button5_y1 = 210;
  button5_y2 = 250;
  
  // ---------------------------
  
  tax_perc = 13;
  soc_ins_perc = 7;
  pens_fund_perc = 5;
  sick_list_perc = 5;
  union_perc = 3;
  
  // ---------------------------
  
  file_name = 'src/data_list.txt';
  file_amount_name = 'src/amount.txt';

Type
  person = record
    surname: string[20];
    job: string[20];
    salary: integer;
    tax: real;
    soc_ins: real;
    pens_fund: real;
    sick_list: real;
    union: real;
    on_hands: real;
    
  end;

Var
  menu_status: byte;
  last_record: integer;

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

Procedure ViewMenu();
Begin
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= 1; // view list
  
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Следующие');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Предыдущие');
  DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'По имени');
  DrawButton(button_x1, button4_y1, button_x2, button4_y2, 'По зарплате');
  DrawButton(button_x1, button5_y1, button_x2, button5_y2, 'Главное меню');
  
end;

Procedure ViewList();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  
Begin
  ViewMenu;
  
  SetBrushColor(clWhite);
  FillRectangle(200, 10, 990, 590);
  
  SetFontColor(clBlack);
  SetFontSize(10);
  SetBrushColor(clWhite);
  
  SetPenColor(clBlack);
  SetPenWidth(1);
  DrawRectangle(200, 10, 330, 590);
  DrawRectangle(200, 10, 450, 590);
  DrawRectangle(200, 10, 520, 590);
  DrawRectangle(200, 10, 590, 590);
  DrawRectangle(200, 10, 660, 590);
  DrawRectangle(200, 10, 730, 590);
  DrawRectangle(200, 10, 800, 590);
  DrawRectangle(200, 10, 870, 590);
  DrawRectangle(200, 10, 990, 590);
  
  DrawRectangle(200, 10, 990, 45);
  
  SetFontStyle(fsBold);
  
  TextOut(220, 20, 'Фамилия');
  TextOut(340, 20, 'Должность');
  TextOut(460, 20, 'Оклад');
  TextOut(530, 20, 'Налог');
  TextOut(595, 20, 'Соцстрах');
  TextOut(670, 20, 'Пенс. ф.');
  TextOut(740, 20, 'Б. лист');
  TextOut(805, 20, 'Профком');
  TextOut(880, 20, 'На руки');
  
  
  SetFontStyle(fsNormal);
  
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  last_record:= 0;
  
  assign(f, file_name);
  reset(f);
  for i:= 1 to amount do
  begin
    
    if (i = 14)
    then
    begin
      last_record:= i - 1;
      close(f);
      exit;
    end;
    
    readln(f, persons[i].surname);
    readln(f, persons[i].job);
    readln(f, persons[i].salary);
    readln(f, persons[i].tax);
    readln(f, persons[i].soc_ins);
    readln(f, persons[i].pens_fund);
    readln(f, persons[i].sick_list);
    readln(f, persons[i].union);
    readln(f, persons[i].on_hands);
        
    TextOut(220, 40 * i + 20, persons[i].surname);
    TextOut(340, 40 * i + 20, persons[i].job);
    TextOut(460, 40 * i + 20, IntToStr(persons[i].salary));
    TextOut(530, 40 * i + 20, IntToStr(round(persons[i].tax)));
    TextOut(600, 40 * i + 20, IntToStr(round(persons[i].soc_ins)));
    TextOut(670, 40 * i + 20, IntToStr(round(persons[i].pens_fund)));
    TextOut(740, 40 * i + 20, IntToStr(round(persons[i].sick_list)));
    TextOut(810, 40 * i + 20, IntToStr(round(persons[i].union)));
    TextOut(880, 40 * i + 20, IntToStr(round(persons[i].on_hands)));
    
  end;
  
    
end;

Procedure ShowPrevious();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  k: integer;
  
Begin
  ViewMenu;
  
  menu_status := 1;
  
  SetBrushColor(clWhite);
  FillRectangle(200, 10, 990, 590);
    
  SetFontColor(clBlack);
  SetFontSize(10);
  SetBrushColor(clWhite);
  
  SetPenColor(clBlack);
  SetPenWidth(1);
  DrawRectangle(200, 10, 330, 590);
  DrawRectangle(200, 10, 450, 590);
  DrawRectangle(200, 10, 520, 590);
  DrawRectangle(200, 10, 590, 590);
  DrawRectangle(200, 10, 660, 590);
  DrawRectangle(200, 10, 730, 590);
  DrawRectangle(200, 10, 800, 590);
  DrawRectangle(200, 10, 870, 590);
  DrawRectangle(200, 10, 990, 590);
  
  DrawRectangle(200, 10, 990, 45);
  
  SetFontStyle(fsBold);
  
  TextOut(220, 20, 'Фамилия');
  TextOut(340, 20, 'Должность');
  TextOut(460, 20, 'Оклад');
  TextOut(530, 20, 'Налог');
  TextOut(595, 20, 'Соцстрах');
  TextOut(670, 20, 'Пенс. ф.');
  TextOut(740, 20, 'Б. лист');
  TextOut(805, 20, 'Профком');
  TextOut(880, 20, 'На руки');
  
  
  SetFontStyle(fsNormal);
  
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  assign(f, file_name);
  reset(f);
  k:= 1;
  
  for i:= 1 to amount do
  begin
    
    readln(f, persons[i].surname);
    readln(f, persons[i].job);
    readln(f, persons[i].salary);
    readln(f, persons[i].tax);
    readln(f, persons[i].soc_ins);
    readln(f, persons[i].pens_fund);
    readln(f, persons[i].sick_list);
    readln(f, persons[i].union);
    readln(f, persons[i].on_hands);
    
    if (last_record - i < 26)
    then
    begin
      
      if (k = 14)
      then
      begin
        close(f);
        last_record:= i - 1;
        exit;
      end;
      
      TextOut(220, 40 * k + 20, persons[i].surname);
      TextOut(340, 40 * k + 20, persons[i].job);
      TextOut(460, 40 * k + 20, IntToStr(persons[i].salary));
      TextOut(530, 40 * k + 20, IntToStr(round(persons[i].tax)));
      TextOut(600, 40 * k + 20, IntToStr(round(persons[i].soc_ins)));
      TextOut(670, 40 * k + 20, IntToStr(round(persons[i].pens_fund)));
      TextOut(740, 40 * k + 20, IntToStr(round(persons[i].sick_list)));
      TextOut(810, 40 * k + 20, IntToStr(round(persons[i].union)));
      TextOut(880, 40 * k + 20, IntToStr(round(persons[i].on_hands)));
      
      k:= k + 1;
    
    end;
    
  end;
  
  last_record:= i;
  
end;

Procedure ShowNext();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  k: integer;
  
Begin
  ViewMenu;
  
  menu_status := 1;
  
  SetBrushColor(clWhite);
  FillRectangle(200, 10, 990, 590);
    
  SetFontColor(clBlack);
  SetFontSize(10);
  SetBrushColor(clWhite);
  
  SetPenColor(clBlack);
  SetPenWidth(1);
  DrawRectangle(200, 10, 330, 590);
  DrawRectangle(200, 10, 450, 590);
  DrawRectangle(200, 10, 520, 590);
  DrawRectangle(200, 10, 590, 590);
  DrawRectangle(200, 10, 660, 590);
  DrawRectangle(200, 10, 730, 590);
  DrawRectangle(200, 10, 800, 590);
  DrawRectangle(200, 10, 870, 590);
  DrawRectangle(200, 10, 990, 590);
  
  DrawRectangle(200, 10, 990, 45);
  
  SetFontStyle(fsBold);
  
  TextOut(220, 20, 'Фамилия');
  TextOut(340, 20, 'Должность');
  TextOut(460, 20, 'Оклад');
  TextOut(530, 20, 'Налог');
  TextOut(595, 20, 'Соцстрах');
  TextOut(670, 20, 'Пенс. ф.');
  TextOut(740, 20, 'Б. лист');
  TextOut(805, 20, 'Профком');
  TextOut(880, 20, 'На руки');
  
  
  SetFontStyle(fsNormal);
  
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  assign(f, file_name);
  reset(f);
  k:= 1;
  
  for i:= 1 to amount do
  begin
    
    readln(f, persons[i].surname);
    readln(f, persons[i].job);
    readln(f, persons[i].salary);
    readln(f, persons[i].tax);
    readln(f, persons[i].soc_ins);
    readln(f, persons[i].pens_fund);
    readln(f, persons[i].sick_list);
    readln(f, persons[i].union);
    readln(f, persons[i].on_hands);
    
    if (i > last_record)
    then
    begin
      
      if (k = 14)
      then
      begin
        close(f);
        last_record:= i - 1;
        exit;
      end;
      
      TextOut(220, 40 * k + 20, persons[i].surname);
      TextOut(340, 40 * k + 20, persons[i].job);
      TextOut(460, 40 * k + 20, IntToStr(persons[i].salary));
      TextOut(530, 40 * k + 20, IntToStr(round(persons[i].tax)));
      TextOut(600, 40 * k + 20, IntToStr(round(persons[i].soc_ins)));
      TextOut(670, 40 * k + 20, IntToStr(round(persons[i].pens_fund)));
      TextOut(740, 40 * k + 20, IntToStr(round(persons[i].sick_list)));
      TextOut(810, 40 * k + 20, IntToStr(round(persons[i].union)));
      TextOut(880, 40 * k + 20, IntToStr(round(persons[i].on_hands)));
      
      k:= k + 1;
    
    end;
    
  end;
  
  last_record:= i;
  
end;

Procedure SortByName();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  helper: person;
  i, j: integer;  
  
Begin
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  assign(f, file_name);
  reset(f);
  
  for i:= 1 to amount do
  begin
    readln(f, persons[i].surname);
    readln(f, persons[i].job);
    readln(f, persons[i].salary);
    readln(f, persons[i].tax);
    readln(f, persons[i].soc_ins);
    readln(f, persons[i].pens_fund);
    readln(f, persons[i].sick_list);
    readln(f, persons[i].union);
    readln(f, persons[i].on_hands);
    
  end;
  
  close(f);
  
  for i:= 1 to (amount - 1) do
    for j:= 1 to (amount - 1) do
      if (persons[j].surname > persons[j + 1].surname)
      then
      begin
        helper.surname:= persons[j].surname;
        helper.job:= persons[j].job;
        helper.salary:= persons[j].salary;
        helper.tax:= persons[j].tax;
        helper.soc_ins:= persons[j].soc_ins;
        helper.pens_fund:= persons[j].pens_fund;
        helper.sick_list:= persons[j].sick_list;
        helper.union:= persons[j].union;
        helper.on_hands:= persons[j].on_hands;
        
        persons[j].surname:= persons[j + 1].surname;
        persons[j].job:= persons[j + 1].job;
        persons[j].salary:= persons[j + 1].salary;
        persons[j].tax:= persons[j + 1].tax;
        persons[j].soc_ins:= persons[j + 1].soc_ins;
        persons[j].pens_fund:= persons[j + 1].pens_fund;
        persons[j].sick_list:= persons[j + 1].sick_list;
        persons[j].union:= persons[j + 1].union;
        persons[j].on_hands:= persons[j + 1].on_hands;
        
        persons[j + 1].surname:= helper.surname;
        persons[j + 1].job:= helper.job;
        persons[j + 1].salary:= helper.salary;
        persons[j + 1].tax:= helper.tax;
        persons[j + 1].soc_ins:= helper.soc_ins;
        persons[j + 1].pens_fund:= helper.pens_fund;
        persons[j + 1].sick_list:= helper.sick_list;
        persons[j + 1].union:= helper.union;
        persons[j + 1].on_hands:= helper.on_hands;
      end;
  
  assign(f, file_name);
  rewrite(f);
  for i:= 1 to amount do
  begin
    writeln(f, persons[i].surname);
    writeln(f, persons[i].job);
    writeln(f, persons[i].salary);
    writeln(f, persons[i].tax);
    writeln(f, persons[i].soc_ins);
    writeln(f, persons[i].pens_fund);
    writeln(f, persons[i].sick_list);
    writeln(f, persons[i].union);
    writeln(f, persons[i].on_hands);
    
  end;
  
  close(f);
  
end;

Procedure SortBySalary();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  helper: person;
  i, j: integer;  
  
Begin
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  assign(f, file_name);
  reset(f);
  
  for i:= 1 to amount do
  begin
    readln(f, persons[i].surname);
    readln(f, persons[i].job);
    readln(f, persons[i].salary);
    readln(f, persons[i].tax);
    readln(f, persons[i].soc_ins);
    readln(f, persons[i].pens_fund);
    readln(f, persons[i].sick_list);
    readln(f, persons[i].union);
    readln(f, persons[i].on_hands);
    
  end;
  
  close(f);
  
  for i:= 1 to (amount - 1) do
    for j:= 1 to (amount - 1) do
      if (persons[j].salary > persons[j + 1].salary)
      then
      begin
        helper.surname:= persons[j].surname;
        helper.job:= persons[j].job;
        helper.salary:= persons[j].salary;
        helper.tax:= persons[j].tax;
        helper.soc_ins:= persons[j].soc_ins;
        helper.pens_fund:= persons[j].pens_fund;
        helper.sick_list:= persons[j].sick_list;
        helper.union:= persons[j].union;
        helper.on_hands:= persons[j].on_hands;
        
        persons[j].surname:= persons[j + 1].surname;
        persons[j].job:= persons[j + 1].job;
        persons[j].salary:= persons[j + 1].salary;
        persons[j].tax:= persons[j + 1].tax;
        persons[j].soc_ins:= persons[j + 1].soc_ins;
        persons[j].pens_fund:= persons[j + 1].pens_fund;
        persons[j].sick_list:= persons[j + 1].sick_list;
        persons[j].union:= persons[j + 1].union;
        persons[j].on_hands:= persons[j + 1].on_hands;
        
        persons[j + 1].surname:= helper.surname;
        persons[j + 1].job:= helper.job;
        persons[j + 1].salary:= helper.salary;
        persons[j + 1].tax:= helper.tax;
        persons[j + 1].soc_ins:= helper.soc_ins;
        persons[j + 1].pens_fund:= helper.pens_fund;
        persons[j + 1].sick_list:= helper.sick_list;
        persons[j + 1].union:= helper.union;
        persons[j + 1].on_hands:= helper.on_hands;
      end;
  
  assign(f, file_name);
  rewrite(f);
  for i:= 1 to amount do
  begin
    writeln(f, persons[i].surname);
    writeln(f, persons[i].job);
    writeln(f, persons[i].salary);
    writeln(f, persons[i].tax);
    writeln(f, persons[i].soc_ins);
    writeln(f, persons[i].pens_fund);
    writeln(f, persons[i].sick_list);
    writeln(f, persons[i].union);
    writeln(f, persons[i].on_hands);
    
  end;
  
  close(f);
  
end;

Procedure MenuMouseDown(x, y, mousebutton: integer);
var
  f: text;
  amount: integer;
  
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
            ViewList;
          
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
    
    1: // view menu
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2) // next
          then
          begin
            assign(f, file_amount_name);
            reset(f);
            readln(f, amount);
            close(f);
            
            if (last_record < amount)
            then
              ShowNext;
          end;
          
          if (y > button2_y1) and (y < button2_y2) // previous
          then
          begin
            assign(f, file_amount_name);
            reset(f);
            readln(f, amount);
            close(f);
            
            if (last_record > 13)
            then
              ShowPrevious;
          end;
        
          if (y > button3_y1) and (y < button3_y2)
          then
          begin
            SortByName;
            ViewList;
          end;  
          
          if (y > button4_y1) and (y < button4_y2)
          then
          begin
            SortBySalary;
            ViewList;
          end;
          
          if (y > button5_y1) and (y < button5_y2)
          then
          begin
            ClearWindow;
            
            menu_status:= 0; // main menu
            SetPenColor(clBlack);
            SetPenWidth(1);
            SetBrushColor(clWhite);
            DrawRectangle(200, 10, 990, 590);
            DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Показать записи');
            DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Button 2');
            DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'Button 3');
            DrawButton(button_x1, button4_y1, button_x2, button4_y2, 'Button 4');
          end;
          
        end;
        
      end;
    
  end;
  
end;

Procedure MainMenu();
Begin
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= 0; // main menu
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  DrawRectangle(200, 10, 990, 590);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Показать записи');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Button 2');
  DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'Button 3');
  DrawButton(button_x1, button4_y1, button_x2, button4_y2, 'Button 4');
  
  OnMouseDown:= MenuMouseDown;
  
end;

Begin
  last_record:= 0;
  
end.