Program salary;

Uses
  GraphABC;
Uses
  actions in 'modules/actions.pas'; // Подключаем созданный модуль
  
Begin
  
  // Задаём настройки окна
  SetWindowHeight(height);
  SetWindowWidth(width);
  CenterWindow;
  SetWindowTitle('Salary');
    
  PreMenu;
  
end.