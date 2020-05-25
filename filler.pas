Program filler;

Uses
  unit1;
  
Var
  f: text;
  persons: array[1..5] of person;
  i: integer;
  
Begin
  assign(f, file_name);
  rewrite(f);
  
  persons[1].surname := 'Питонов';
  persons[1].job := 'Программист';
  persons[1].salary := 50000;
  
  persons[2].surname := 'Считалова';
  persons[2].job := 'Бухгалтер';
  persons[2].salary := 25000;
  
  persons[3].surname := 'Заслоняев';
  persons[3].job := 'Охранник';
  persons[3].salary := 15000;
  
  persons[4].surname := 'Джонсон';
  persons[4].job := 'Переводчик';
  persons[4].salary := 50000;
  
  persons[5].surname := 'Боссович';
  persons[5].job := 'Директор';
  persons[5].salary := 100000;
  
  for i:= 1 to 5 do
  begin
    persons[i].tax := (tax_perc * persons[i].salary) / 100;
    persons[i].soc_ins := (soc_ins_perc * persons[i].salary) / 100;
    persons[i].pens_fund := (pens_fund_perc * persons[i].salary) / 100;
    persons[i].sick_list := (sick_list_perc * persons[i].salary) / 100;
    persons[i].union := (union_perc * persons[i].salary) / 100;
    persons[i].on_hands := persons[i].salary - persons[i].tax - persons[i].soc_ins - persons[i].pens_fund - persons[i].sick_list - persons[i].union;
    
  end;
  
  for i:= 1 to 5 do
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
  writeln(f, 5);
  close(f);
  
end.