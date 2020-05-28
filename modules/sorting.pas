Unit sorting;

Uses
  GraphABC;
Uses
  drawing;

Const
  // ---------------------------
  // Пути к файлам
  
  file_name = 'src/data_list.txt';
  file_amount_name = 'src/amount.txt';
  
  // ---------------------------  

Type
  
  // Тип сотрудника
  person = record
    surname: string[20]; // Фамилия
    job: string[20]; // Должность
    salary: integer; // Оклад
    tax: real; // Налог
    soc_ins: real; // Соцстрах
    pens_fund: real; // Пенс. фонд
    sick_list: real; // Больничный лист
    union: real; // Профком
    on_hands: real; // На руки
    
  end;

Var
  sort_salary_up: boolean;
  sort_surname_up: boolean;

// Сортировка по имени
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
  
  if (sort_surname_up)
  then
    for i:= 1 to (amount - 1) do
    begin
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
     end
  else
    for i:= 1 to (amount - 1) do
      for j:= 1 to (amount - 1) do
        if (persons[j].surname < persons[j + 1].surname)
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
  
  if (sort_surname_up)
  then
    sort_surname_up:= false
  else
    sort_surname_up:= true;
  
end;

// Сортировка по окладу
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
  
  if (sort_salary_up)
  then
    for i:= 1 to (amount - 1) do
    begin
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
     end
  else
    for i:= 1 to (amount - 1) do
    begin
      for j:= 1 to (amount - 1) do
        if (persons[j].salary < persons[j + 1].salary)
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
    
  if (sort_salary_up)
  then
    sort_salary_up:= false
  else
    sort_salary_up:= true;
  
end;

Begin
end.