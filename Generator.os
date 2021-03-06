﻿Если АргументыКоманднойСтроки.Количество() = 0 Тогда
	ВызватьИсключение "Argument <Audio collection path> required";
КонецЕсли;
КорневаяПапка1 = АргументыКоманднойСтроки[0]; 
Если СтрДлина(КорневаяПапка1) = 1 Тогда
	КорневаяПапка1 = КорневаяПапка1 + ":";
КонецЕсли;
ПроверочныйФайл = Новый Файл(КорневаяПапка1);
Если Не ПроверочныйФайл.Существует() Тогда
	ВызватьИсключение "Path not exists";
КонецЕсли;
УдалятьСтарыеЛисты = Ложь;
Если АргументыКоманднойСтроки.Количество() > 1 Тогда
	УдалятьСтарыеЛисты = НРег(АргументыКоманднойСтроки[1]) = "r";
КонецЕсли;

//КорневаяПапка1 = "C:\Download\Архивы";
//УдалятьСтарыеЛисты = Истина;

Если УдалятьСтарыеЛисты Тогда
	Для Каждого Файл Из НайтиФайлы(КорневаяПапка1, "*.m3u", Истина) Цикл
		#Если Сервер И Не Сервер Тогда
			Файл = Новый Файл;
		#КонецЕсли
		УдалитьФайлы(Файл.ПолноеИмя);
		Сообщить("Deleted " + Файл.ПолноеИмя);
	КонецЦикла;
КонецЕсли;
ПрефиксПервогоУровня = "_";
ДлинаПрефиксаВторогоУровня = 3;
РасширенияФайлов = Новый Массив;
РасширенияФайлов.Добавить("aac");
РасширенияФайлов.Добавить("ac3");
РасширенияФайлов.Добавить("aif");
РасширенияФайлов.Добавить("aiff");
РасширенияФайлов.Добавить("alac");
РасширенияФайлов.Добавить("ape");
РасширенияФайлов.Добавить("apl");
РасширенияФайлов.Добавить("asf");
РасширенияФайлов.Добавить("cda");
РасширенияФайлов.Добавить("flac");
РасширенияФайлов.Добавить("m2a");
РасширенияФайлов.Добавить("m4a");
РасширенияФайлов.Добавить("mp3");
РасширенияФайлов.Добавить("mp2");
РасширенияФайлов.Добавить("mpa");
РасширенияФайлов.Добавить("ogg");
РасширенияФайлов.Добавить("oga");
РасширенияФайлов.Добавить("ra");
РасширенияФайлов.Добавить("wav");
РасширенияФайлов.Добавить("wma");
КорневыеПапки = Новый Массив;
КорневыеПапки.Добавить(КорневаяПапка1);
Для Каждого КорневаяПапка Из КорневыеПапки Цикл
	Для Каждого ПапкаЖанра Из НайтиФайлы(КорневаяПапка, "*", Ложь) Цикл
		#Если Сервер И Не Сервер Тогда
			ПапкаЖанра = Новый Файл;
		#КонецЕсли
		Если ПапкаЖанра.ЭтоКаталог() Тогда
			СписокФайлов = Новый СписокЗначений;
			Для Каждого РасширениеФайла Из РасширенияФайлов Цикл
				Для Каждого Файл Из НайтиФайлы(ПапкаЖанра.ПолноеИмя, "*." + РасширениеФайла, Истина) Цикл
					#Если Сервер И Не Сервер Тогда
						Файл = Новый Файл;
					#КонецЕсли
					СписокФайлов.Добавить(Файл, Файл.Имя);
				КонецЦикла;
			КонецЦикла;
			СписокФайлов.СортироватьПоПредставлению();
			Если СписокФайлов.Количество() = 0 Тогда
				Продолжить;
			КонецЕсли;
			Текст = Новый ТекстовыйДокумент;
			Текст.ДобавитьСтроку("#EXTM3U");
			Для Каждого ЭлементСписка Из СписокФайлов Цикл
				Файл = ЭлементСписка.Значение;
				#Если Сервер И Не Сервер Тогда
					Файл = Новый Файл;
				#КонецЕсли
				Текст.ДобавитьСтроку("#EXTINF:-1," + Файл.ИмяБезРасширения);
				ПутьКПапке = Лев(Файл.Путь, СтрДлина(Файл.Путь) - 1);
				//ИмяПапки = ирОбщий.ПолучитьПоследнийФрагментЛкс(ПутьКПапке, "\");
				Фрагменты = СтрРазделить(ПутьКПапке, "\");
				ИмяПапки = Фрагменты[Фрагменты.ВГраница()];
				Текст.ДобавитьСтроку(Сред(Файл.ПолноеИмя, СтрДлина(ПапкаЖанра.ПолноеИмя) + 2));
			КонецЦикла;
			ИмяФайлаЛиста = ПапкаЖанра.ПолноеИмя + "\" + ПрефиксПервогоУровня + ПапкаЖанра.Имя + ".m3u";
			ЗТ = Новый ЗаписьТекста(ИмяФайлаЛиста, КодировкаТекста.ANSI);
			ЗТ.Закрыть();
			ЗТ = Новый ЗаписьТекста(ИмяФайлаЛиста,,, Истина);
			ЗТ.Записать(Текст.ПолучитьТекст());
			ЗТ.Закрыть();
			Сообщить("Created " + ИмяФайлаЛиста);
			Для Каждого ПапкаАльбома Из НайтиФайлы(ПапкаЖанра.ПолноеИмя, "*", Ложь) Цикл
				#Если Сервер И Не Сервер Тогда
					ПапкаАльбома = Новый Файл;
				#КонецЕсли
				Если ПапкаАльбома.ЭтоКаталог() Тогда
					СписокФайлов = Новый СписокЗначений;
					Для Каждого РасширениеФайла Из РасширенияФайлов Цикл
						Для Каждого Файл Из НайтиФайлы(ПапкаАльбома.ПолноеИмя, "*." + РасширениеФайла, Истина) Цикл
							#Если Сервер И Не Сервер Тогда
								Файл = Новый Файл;
							#КонецЕсли
							СписокФайлов.Добавить(Файл, Файл.Имя);
						КонецЦикла;
					КонецЦикла;
					СписокФайлов.СортироватьПоПредставлению();
					Если СписокФайлов.Количество() = 0 Тогда
						Продолжить;
					КонецЕсли;
					Текст = Новый ТекстовыйДокумент;
					Текст.ДобавитьСтроку("#EXTM3U");
					Для Каждого ЭлементСписка Из СписокФайлов Цикл
						Файл = ЭлементСписка.Значение;
						#Если Сервер И Не Сервер Тогда
							Файл = Новый Файл;
						#КонецЕсли
						Текст.ДобавитьСтроку("#EXTINF:-1," + Файл.ИмяБезРасширения);
						Текст.ДобавитьСтроку(Сред(Файл.ПолноеИмя, СтрДлина(ПапкаАльбома.ПолноеИмя) + 2));
					КонецЦикла;
					ИмяФайлаЛиста = ПапкаАльбома.ПолноеИмя + "\" + Лев(ПапкаЖанра.Имя, ДлинаПрефиксаВторогоУровня) + ". " + ПапкаАльбома.Имя + ".m3u";
					ЗТ = Новый ЗаписьТекста(ИмяФайлаЛиста, КодировкаТекста.ANSI);
					ЗТ.Закрыть();
					ЗТ = Новый ЗаписьТекста(ИмяФайлаЛиста,,, Истина);
					ЗТ.Записать(Текст.ПолучитьТекст());
					ЗТ.Закрыть();
					Сообщить("Created " + ИмяФайлаЛиста);
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
	КонецЦикла;
КонецЦикла;
