Unit actions;

Uses
  GraphABC;
Uses
  drawing;
Uses
  sorting;
  
Const
  height = 600; // Высота окна
  width = 1000; // Ширина окна
  
  // Координаты полей ввода
  
  field_x1 = 210;
  field_x2 = 410;
  
  field1_y1 = 40;
  field1_y2 = 70;
  
  field2_y1 = 120;
  field2_y2 = 150;
  
  field3_y1 = 200;
  field3_y2 = 230;
  
  
  // ---------------------------
  // Процентные ставки
  
  tax_perc = 13; // налог
  soc_ins_perc = 7; // соц страхование
  pens_fund_perc = 5; // пенсионный фонд
  sick_list_perc = 5; // больничный лист
  union_perc = 3; // профком
  
  // ---------------------------
  
  password = 'salary'; // Пароль от администратора

Var
  last_record: integer; // Номер последней отображенной записи
  str: string; // Строка ввода парооля
  
  name: string; // Строка ввода имени
  job: string; // Строка ввода должности
  salary: string; // Строка ввода оклада
    
  // Суммы по  соответствующим полям
  sum_salary: integer;
  sum_tax: real;
  sum_soc_ins: real;
  sum_pens_fund: real;
  sum_sick_list: real;
  sum_union: real;
  sum_on_hands: real;
  

// Суммирует все денежные поля
Procedure SumAll();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  
Begin
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  sum_salary:= 0;
  sum_tax:= 0;
  sum_soc_ins:= 0;
  sum_pens_fund:= 0;
  sum_sick_list:= 0;
  sum_union:= 0;
  sum_on_hands:= 0;
  
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
    
    sum_salary:= sum_salary + persons[i].salary;
    sum_tax:= sum_tax + persons[i].tax;
    sum_soc_ins:= sum_soc_ins + persons[i].soc_ins;
    sum_pens_fund:= sum_pens_fund + persons[i].pens_fund;
    sum_sick_list:= sum_sick_list + persons[i].sick_list;
    sum_union:= sum_union + persons[i].union;
    sum_on_hands:= sum_on_hands + persons[i].on_hands;
    
  end;
  
  close(f);
  
end;

// Процедура ввода пароля
procedure InputPassword(Key: integer);
var
  i: integer;
  str_help: string;
  
begin 
  
  if not (menu_status = -11)
  then
    exit;
  
  SetFontColor(clBlack);
  SetFontSize(16);
  case key of
    48..57, 65..90, 97..122, 32: // Char keys
    begin
       if (length(str)) < 16 then
       begin
         str:= str + LowerCase(chr(key));
         TextOut(210, 60, str); 
       end;
    end;
    8: // backspace
      begin
        str_help:= '';
        for i:= 1 to (length(str)-1) do
          str_help:= str_help + str[i];
        str:= str_help;
        SetBrushColor(clWhite);
        FillRectangle(210, 60, 420, 300);
        TextOut(210, 60, str);
      end;
  end;
  
 
end;

// Перевод кодов клавиш в русские символы
Function InChar(number: integer): char;
var
  res: char;
Begin
  case number of
    65: res:= 'ф';
    66: res:= 'и';
    67: res:= 'с';
    68: res:= 'в';
    69: res:= 'у';
    70: res:= 'а';
    71: res:= 'п';
    72: res:= 'р';
    73: res:= 'ш';
    74: res:= 'о';
    75: res:= 'л';
    76: res:= 'д';
    77: res:= 'ь';
    78: res:= 'т';
    79: res:= 'щ';
    80: res:= 'з';
    81: res:= 'й';
    82: res:= 'к';
    83: res:= 'ы';
    84: res:= 'е';
    85: res:= 'г';
    86: res:= 'м';
    87: res:= 'ц';
    88: res:= 'ч';
    89: res:= 'н';
    90: res:= 'я';
    
    188: res:= 'б';
    190: res:= 'ю';
    186: res:= 'ж';
    219: res:= 'х';
    221: res:= 'ъ';
    222: res:= 'э';
  end;
  
  InChar:= res;
end;

// Процедура ввода имени
procedure InputName(Key: integer);
var
  i: integer;
  str_help: string;
  
begin 
  
  if not ((menu_status = 13) or (menu_status = 14))
  then
    exit;
   
  SetFontColor(clBlack);
  SetFontSize(12);
  case key of
    65..90, 97..122, 186, 188, 190, 219, 221, 222: // Char keys
    begin
       if (length(name)) < 16 then
       begin
         if (name = '')
         then
           name:= name + UpperCase(InChar(key))
         else
           name:= name + LowerCase(InChar(key));
         
         TextOut(field_x1 + 2, field1_y1 + 2, name); 
       end;
    end;
    8: // backspace
      begin
        str_help:= '';
        for i:= 1 to (length(name)-1) do
          str_help:= str_help + name[i];
        name:= str_help;
        SetBrushColor(clWhite);
        FillRectangle(field_x1 + 2, field1_y1 + 2, field_x2 - 2, field1_y2 - 2);
        TextOut(field_x1 + 2, field1_y1 + 2, name);
      end;
  end;
  
 
end;

// Процедура ввода должности
procedure InputJob(Key: integer);
var
  i: integer;
  str_help: string;
  
begin 
  
  if not ((menu_status = 13) or (menu_status = 14))
  then
    exit;
    
  SetFontColor(clBlack);
  SetFontSize(12);
  case key of
    65..90, 97..122, 186, 188, 190, 219, 221, 222: // Char keys
    begin
       if (length(job)) < 16 then
       begin
         if (job = '')
         then
           job:= job + UpperCase(InChar(key))
         else
           job:= job + LowerCase(InChar(key));
         
         TextOut(field_x1 + 2, field2_y1 + 2, job); 
       end;
    end;
    8: // backspace
      begin
        str_help:= '';
        for i:= 1 to (length(job)-1) do
          str_help:= str_help + job[i];
        job:= str_help;
        SetBrushColor(clWhite);
        FillRectangle(field_x1 + 2, field2_y1 + 2, field_x2 - 2, field2_y2 - 2);
        TextOut(field_x1 + 2, field2_y1 + 2, job);
      end;
  end;
  
 
end;

// Процедура ввода оклада
procedure InputSalary(Key: integer);
var
  i: integer;
  str_help: string;
  
begin 
  
  if not ((menu_status = 13) or (menu_status = 14))
  then
    exit;
    
  SetFontColor(clBlack);
  SetFontSize(12);
  case key of
    48..57: // Numbers keys
    begin
       if (length(salary)) < 16 then
       begin
         if not ((salary = '') and (key = 48))
         then
           salary:= salary + LowerCase(chr(key));
         TextOut(field_x1 + 2, field3_y1 + 2, salary); 
       end;
    end;
    8: // backspace
      begin
        str_help:= '';
        for i:= 1 to (length(salary)-1) do
          str_help:= str_help + salary[i];
        salary:= str_help;
        SetBrushColor(clWhite);
        FillRectangle(field_x1 + 2, field3_y1 + 2, field_x2 - 2, field3_y2 - 2);
        TextOut(field_x1 + 2, field3_y1 + 2, salary);
      end;
  end;
  
 
end;

// Окно ввода пароля
Procedure AskPassword();
Begin
  ClearWindow;
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= -11; // ask password
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  DrawRectangle(200, 10, 990, 590);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Подтвердить');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Назад');

  
  SetFontColor(clBlack);
  SetFontSize(20);
  SetBrushColor(clWhite);
  TextOut(210, 20, 'Введите пароль:');
  OnKeyDown:= InputPassword;

end;

// Меню просмотра записей
Procedure ViewMenu();
Begin
  SumAll;
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= 1; // view list
  
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Следующие');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Предыдущие');
  DrawButton(button_x1, button3_y1, button_x2, button3_y2, 'По фамилии');
  DrawButton(button_x1, button4_y1, button_x2, button4_y2, 'По окладу');
  DrawButton(button_x1, button5_y1, button_x2, button5_y2, 'Главное меню');
  
  DrawSalaryArrow(sort_salary_up);
  DrawSurnameLetters(sort_surname_up);
  
end;

// Показать первые записи
Procedure ViewList();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  
Begin
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  if (amount = 0)
  then
  begin
    SetFontColor(clRed);
    SetBrushColor(clWhite);
    SetFontSize(16);
    TextOut(210, 20, 'Записей нет');
    
    exit;
  end;
  
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
  DrawRectangle(200, 560, 990, 590);
  
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
  
  TextOut(220, 570, 'Всего');
  
  TextOut(460, 570, IntToStr(sum_salary));
  TextOut(530, 570, IntToStr(round(sum_tax)));
  TextOut(595, 570, IntToStr(round(sum_soc_ins)));
  TextOut(670, 570, IntToStr(round(sum_pens_fund)));
  TextOut(740, 570, IntToStr(round(sum_sick_list)));
  TextOut(805, 570, IntToStr(round(sum_union)));
  TextOut(880, 570, IntToStr(round(sum_on_hands)));
  
  
  SetFontStyle(fsNormal);
  
  
  
  last_record:= 0;
  
  assign(f, file_name);
  reset(f);
  for i:= 1 to amount do
  begin
    
    if (i = 13)
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
  
  close(f);
  
end;

// Показать следующие
Procedure ShowPrevious();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  k: integer;
  m: integer;
  
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
  DrawRectangle(200, 560, 990, 590);
  
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
  
  TextOut(220, 570, 'Всего');
  
  TextOut(460, 570, IntToStr(sum_salary));
  TextOut(530, 570, IntToStr(round(sum_tax)));
  TextOut(595, 570, IntToStr(round(sum_soc_ins)));
  TextOut(670, 570, IntToStr(round(sum_pens_fund)));
  TextOut(740, 570, IntToStr(round(sum_sick_list)));
  TextOut(805, 570, IntToStr(round(sum_union)));
  TextOut(880, 570, IntToStr(round(sum_on_hands)));
  
  
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
    
    if (last_record mod 12) <> 0
    then
      m:= (last_record mod 12)
    else
      m:= 12;
    
    if (last_record - i <= (m + 11))
    then
    begin
      
      if (k = 13)
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
  
  close(f);
  last_record:= i;
  
end;

// Показать предыдущие
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
  DrawRectangle(200, 560, 990, 590);
  
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
  TextOut(220, 570, 'Всего');
  
  TextOut(460, 570, IntToStr(sum_salary));
  TextOut(530, 570, IntToStr(round(sum_tax)));
  TextOut(595, 570, IntToStr(round(sum_soc_ins)));
  TextOut(670, 570, IntToStr(round(sum_pens_fund)));
  TextOut(740, 570, IntToStr(round(sum_sick_list)));
  TextOut(805, 570, IntToStr(round(sum_union)));
  TextOut(880, 570, IntToStr(round(sum_on_hands)));
  
  
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
      
      if (k = 13)
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
  
  close(f);
  last_record:= i;
  
end;

// Подтверждение выхода
Procedure ConfirmExit();
Begin
  menu_status:= 2; // confirm exit;
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 195, 600);
  FillRectangle(205, 20, 985, 585);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Подтвердить');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Отмена');

  
end;

// Подтверждение выхода из админа
Procedure AdminConfirmExit();
Begin
  menu_status:= 12; // admin confirm exit;
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 195, 600);
  FillRectangle(205, 20, 985, 585);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Подтвердить');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Отмена');

  
end;

// Окно добавления записи
Procedure AddRecord();  
Begin
  menu_status:= 13; // admin add record;
  
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 195, 600);
  FillRectangle(205, 20, 985, 585);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Добавить');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Отмена');
  
  SetFontColor(clBlack);
  SetFontSize(12);
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  
  TextOut(210, 20, 'Фамилия: ');
  DrawRectangle(field_x1, field1_y1, field_x2, field1_y2);
  
  TextOut(210, 100, 'Должность: ');
  DrawRectangle(field_x1, field2_y1, field_x2, field2_y2);
  
  TextOut(210, 180, 'Оклад: ');
  DrawRectangle(field_x1, field3_y1, field_x2, field3_y2);
  
end;

// Добавление записи
Procedure CompleteAddRecord();
Var
  f: text;
  amount: integer;
  new_person: person;
  
Begin
  
  if (name = '') or (job = '') or (salary = '')
  then
  begin
    SetFontColor(clRed);
    SetFontSize(12);
    TextOut(520, 20, 'Заполните все поля!');
    exit;
  end;
  
  assign(f, file_amount_name);
  reset(f);
  readln(f, amount);
  close(f);
  
  amount:= amount + 1;
  
  assign(f, file_name);
  append(f);
  
  new_person.surname:= name;
  new_person.job:= job;
  new_person.salary:= StrToInt(salary);
  new_person.tax := (tax_perc * new_person.salary) / 100;
  new_person.soc_ins := (soc_ins_perc * new_person.salary) / 100;
  new_person.pens_fund := (pens_fund_perc * new_person.salary) / 100;
  new_person.sick_list := (sick_list_perc * new_person.salary) / 100;
  new_person.union := (union_perc * new_person.salary) / 100;
  new_person.on_hands := new_person.salary - new_person.tax - new_person.soc_ins - new_person.pens_fund - new_person.sick_list - new_person.union;
  
  writeln(f, new_person.surname);
  writeln(f, new_person.job);
  writeln(f, new_person.salary);
  writeln(f, new_person.tax);
  writeln(f, new_person.soc_ins);
  writeln(f, new_person.pens_fund);
  writeln(f, new_person.sick_list);
  writeln(f, new_person.union);
  writeln(f, new_person.on_hands);
  
  close(f);
  
  assign(f, file_amount_name);
  rewrite(f);
  writeln(f, amount);
  close(f);
  
  AdminMainMenu;
  
  SetFontColor(clBlack);
  SetBrushColor(clWhite);
  SetFontSize(16);
  TextOut(210, 20, 'Запись добавлена');
  
  name:= '';
  job:= '';
  salary:= '';
  
end;

// Окно удаления записи
Procedure DeleteRecord();
Begin
  menu_status:= 14; // admin delete record;
  
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 195, 600);
  FillRectangle(205, 20, 985, 585);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Удалить');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Отмена');
  
  SetFontColor(clBlack);
  SetFontSize(12);
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  
  TextOut(210, 20, 'Фамилия: ');
  DrawRectangle(field_x1, field1_y1, field_x2, field1_y2);
  
  TextOut(210, 100, 'Должность: ');
  DrawRectangle(field_x1, field2_y1, field_x2, field2_y2);
  
  TextOut(210, 180, 'Оклад: ');
  DrawRectangle(field_x1, field3_y1, field_x2, field3_y2);
end;

// Подтверждение удаления записи
Procedure ConfirmDeletion();
Begin
  if (name = '') or (job = '') or (salary = '')
  then
  begin
    SetFontColor(clRed);
    SetFontSize(12);
    TextOut(520, 20, 'Заполните все поля!');
    exit;
  end;
  
  menu_status:= 15; // confirm deletion
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 195, 600);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Подтвердить');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Отмена');
end;

// Удаление записи
Procedure CompleteDelete();
Var
  f: text;
  amount: integer;
  persons: array[1..1000] of person;
  i: integer;
  check_deletion: boolean;

Begin
  check_deletion:= false;
  
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
    
    if (persons[i].surname = name) and (persons[i].job = job) and (persons[i].salary = StrToInt(salary)) and (check_deletion = false)
    then
    begin
      persons[i].surname:= '';
      persons[i].job:= '';
      persons[i].salary:= 0;
      persons[i].soc_ins := 0;
      persons[i].pens_fund := 0;
      persons[i].sick_list := 0;
      persons[i].union := 0;
      persons[i].on_hands := 0;
      check_deletion:= true;
      
    end;
    
  end;
  
  close(f);
  rewrite(f);
  
  for i:= 1 to amount do
  begin
    
    if (persons[i].surname <> '')
    then
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
    
    
  end;
  
  close(f);
    
  if (check_deletion)
  then
  begin
    amount:= amount - 1;
    
    assign(f, file_amount_name);
    rewrite(f);
    writeln(f, amount);
    close(f);
    
    AdminMainMenu;
  
    SetFontColor(clBlack);
    SetBrushColor(clWhite);
    SetFontSize(16);
    TextOut(210, 20, 'Запись удалена');
    
    name:= '';
    job:= '';
    salary:= '';
  end
  else
  begin
    AdminMainMenu;
  
    SetFontColor(clRed);
    SetBrushColor(clWhite);
    SetFontSize(16);
    TextOut(210, 20, 'Запись не найдена');
    
    name:= '';
    job:= '';
    salary:= '';
  end;
  
end;  

// Обработчик нажатия мыши
Procedure MenuMouseDown(x, y, mousebutton: integer);
var
  f: text;
  amount: integer;
  
Begin
  if (mousebutton = 2)
  then
    exit;
  
  case menu_status of
    10: // admin main menu
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            ViewList;
          
          if (y > button2_y1) and (y < button2_y2)
          then
            AddRecord;
          
          if (y > button3_y1) and (y < button3_y2)
          then
            DeleteRecord;
          
          if (y > button4_y1) and (y < button4_y2)
          then
            AdminConfirmExit;
          
        end;
      end;
     
     12: // admin confirm exit
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            halt;
          
          if (y > button2_y1) and (y < button2_y2)
          then
            AdminMainMenu;
       
       end;
     end;
     
     13: // admin add record
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            CompleteAddRecord; //add
          
          if (y > button2_y1) and (y < button2_y2)
          then
             AdminMainMenu;
          
        end;
        
        if (x > field_x1) and (x < field_x2)
        then
        begin        
          
          if (y > field1_y1) and (y < field1_y2)
          then
          begin
            name:= '';
            OnKeyDown:= InputName;
            FillRectangle(field_x1 + 2, field1_y1 + 2, field_x2 - 2, field1_y2 - 2);
            TextOut(field_x1 + 2, field1_y1 + 2, name);
          end;
          
          if (y > field2_y1) and (y < field2_y2)
          then
          begin
            job:= '';
            OnKeyDown:= InputJob;
            SetBrushColor(clWhite);
            FillRectangle(field_x1 + 2, field2_y1 + 2, field_x2 - 2, field2_y2 - 2);
          end;
          
          if (y > field3_y1) and (y < field3_y2)
          then
          begin
            salary:= '';
            OnKeyDown:= InputSalary;
            SetBrushColor(clWhite);
            FillRectangle(field_x1 + 2, field3_y1 + 2, field_x2 - 2, field3_y2 - 2);
          end;
        end;
      end;
     
     14: // admin delete record
       begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            ConfirmDeletion;  
            
          if (y > button2_y1) and (y < button2_y2)
          then
            AdminMainMenu;      
          
        end;
          
          if (x > field_x1) and (x < field_x2)
          then
          begin        
          
          if (y > field1_y1) and (y < field1_y2)
          then
          begin
            name:= '';
            OnKeyDown:= InputName;
            FillRectangle(field_x1 + 2, field1_y1 + 2, field_x2 - 2, field1_y2 - 2);
            TextOut(field_x1 + 2, field1_y1 + 2, name);
          end;
          
          if (y > field2_y1) and (y < field2_y2)
          then
          begin
            job:= '';
            OnKeyDown:= InputJob;
            SetBrushColor(clWhite);
            FillRectangle(field_x1 + 2, field2_y1 + 2, field_x2 - 2, field2_y2 - 2);
          end;
          
          if (y > field3_y1) and (y < field3_y2)
          then
          begin
            salary:= '';
            OnKeyDown:= InputSalary;
            SetBrushColor(clWhite);
            FillRectangle(field_x1 + 2, field3_y1 + 2, field_x2 - 2, field3_y2 - 2);
          end;
        end;
                  
       end;
     
     15: // confirm deletion
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            CompleteDelete;
          
          if (y > button2_y1) and (y < button2_y2)
          then
            AdminMainMenu;
          
        end;
      end;
     
    -11: // input password;
       begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            if (str = password)
            then
              AdminMainMenu
            else
            begin
              SetFontSize(12);
              SetFontColor(clRed);
              TextOut(210, 90, 'Неверный пароль!');
            end;
          end;
          
          if (y > button2_y1) and (y < button2_y2)
          then
          begin
            ClearWindow;
            str:= '';
            SetBrushColor(clWhite);
            FillRectangle(1, 1, 200, 600);
            
            menu_status:= -1; // pre-menu
            SetPenColor(clBlack);
            SetPenWidth(1);
            SetBrushColor(clWhite);
            DrawRectangle(200, 10, 990, 590);
            DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Пользователь');
            DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Администратор');
            ProgName;
          end;
          
       end;
    -1: // pre-menu
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2)
          then
            MainMenu;
          
          if (y > button2_y1) and (y < button2_y2)
          then
            AskPassword;
                    
        end;
      end;
    
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
            ConfirmExit;
                    
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
            if (admin)
            then
              AdminMainMenu
            else
              MainMenu;
          
        end;
        
      end;
    
    2: // confirm exit
      begin
        if (x > button_x1) and (x < button_x2)
        then
        begin
          if (y > button1_y1) and (y < button1_y2) // yes
          then
            halt;
          
          if (y > button2_y1) and (y < button2_y2) // no
          then
            MainMenu

        end;
      
      end;
      
  end;
  
end;

// Меню выбора режима
Procedure PreMenu();
Begin
  SetBrushColor(clWhite);
  FillRectangle(1, 1, 200, 600);
  
  menu_status:= -1; // pre-menu
  SetPenColor(clBlack);
  SetPenWidth(1);
  SetBrushColor(clWhite);
  DrawRectangle(200, 10, 990, 590);
  DrawButton(button_x1, button1_y1, button_x2, button1_y2, 'Пользователь');
  DrawButton(button_x1, button2_y1, button_x2, button2_y2, 'Администратор');
  ProgName;
  
  OnMouseDown:= MenuMouseDown;
  
end;

Begin
  last_record:= 0;
  str:= '';
  name:= '';
  job:= '';
  salary:= '';
  admin:= false;
  sort_salary_up:= true;
  sort_surname_up:= true;
  
  SumAll;
  
end.