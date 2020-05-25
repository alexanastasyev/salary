Program filler;

Uses
  unit1;
  
Var
  f: text;
  persons: array[1..50] of person;
  i: integer;
  
Begin
  assign(f, file_name);
  rewrite(f);
  
  for i:= 1 to 50 do
  begin
  
  case (i mod 5) of
    
    1:
    begin
      persons[i].surname := 'Питонов';
      persons[i].job := 'Программист';
      persons[i].salary := 50000;
    end;
    
    2:
    begin
      persons[i].surname := 'Считалова';
      persons[i].job := 'Бухгалтер';
      persons[i].salary := 25000;
    end;
    
    3:
    begin
      persons[i].surname := 'Заслоняев';
      persons[i].job := 'Охранник';
      persons[i].salary := 15000;
    end;
    
    4:
    begin
      persons[i].surname := 'Джонсон';
      persons[i].job := 'Переводчик';
      persons[i].salary := 50000;
    end;
    
    0:
    begin
      persons[i].surname := 'Боссович';
      persons[i].job := 'Директор';
      persons[i].salary := 100000;
    end;
  
  end;
  end;
  
  for i:= 1 to 50 do
  begin
    persons[i].tax := (tax_perc * persons[i].salary) / 100;
    persons[i].soc_ins := (soc_ins_perc * persons[i].salary) / 100;
    persons[i].pens_fund := (pens_fund_perc * persons[i].salary) / 100;
    persons[i].sick_list := (sick_list_perc * persons[i].salary) / 100;
    persons[i].union := (union_perc * persons[i].salary) / 100;
    persons[i].on_hands := persons[i].salary - persons[i].tax - persons[i].soc_ins - persons[i].pens_fund - persons[i].sick_list - persons[i].union;
    
  end;
  
  for i:= 1 to 50 do
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
  
  assign(f, file_amount_name);
  rewrite(f);
  writeln(f, 50);
  close(f);
  
  halt;
  
end.