﻿{
  Программа "Зарплата"
  Курсовая работа
  студента 935 группы
  Старшинова Виталия
  
  -----------------------------------------------------------------------------------------
  
  Программа по запросу пользователя выдаёт список сотрудников,
  а также информацию об их окладе и различных отчислениях.
  Программа позволяет выполнять сортировку по фамилиям сотрудников или по размеру их оклада.
  Кроме того, программа автоматически производит суммирование денежных полей.
  
  В режиме администратора досутпны также функции добавления и удаления сотрудников.
  
  -----------------------------------------------------------------------------------------
  
  Рязань, 2020

}

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
    
  PreMenu; // Процедура выбора режима (администратор или пользователь)
  
end.