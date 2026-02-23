# Przetwornica Boost 10W sterowana przez STM32
Projekt przetwornicy step-up (boost) zaprojektowany w programie Altium Designer. Układ podnosi napięcie z 5V na wyższe (regulowane) i potrafi oddać około 10W mocy. Zamiast dedykowanego układu scalonego do przetwornic, sercem układu jest mikrokontroler STM32, który steruje pętlą sprzężenia zwrotnego.

Parametry:

Topologia: Boost

Szacowana moc: ~10W

Częstotliwość kluczowania: 250 kHz

Mikrokontroler: STM32

EDA: Altium Designer (2 warstwy, ścieżki podwyższonej mocy i wylewki masy)

Sterowanie opiera się na sprzętowym wzmacniaczu błędu podłączonym pod ADC:

Napięcie z wyjścia przetwornicy trafia na dzielnik z potencjometrem wieloobrotowym, którym ustawia się docelowe napięcie.
Sygnał z suwaka potencjometru wchodzi na wejście odwracające wzmacniacza operacyjnego (pracującego w układzie różnicowym).
Na wejście nieodwracające podawane jest stabilne napięcie referencyjne 3.3V.
Wzmacniacz sprzętowo odejmuje te wartości – na jego wyjściu pojawia się tylko sygnał błędu.
Sygnał błędu jest czytany przez ADC w STM32.
Na podstawie tego odczytu algorytm w procesorze dobiera współczynnik wypełnienia dla sygnału PWM (250 kHz).
PWM trafia na driver MOSFET, który zapewnia odpowiedni prąd do szybkiego przeładowania bramki tranzystora kluczującego.

<img width="1097" height="852" alt="image" src="https://github.com/user-attachments/assets/7b984dc8-2806-443e-bba1-1e1183848f11" />



<img width="1361" height="817" alt="image" src="https://github.com/user-attachments/assets/f4cf8d0b-88ee-49f0-9de9-c7f7c7420e7d" />


<img width="1119" height="879" alt="image" src="https://github.com/user-attachments/assets/b08fe512-2074-4396-b947-6084f7c24674" />
<img width="1068" height="834" alt="image" src="https://github.com/user-attachments/assets/4e8adc2e-b532-4f9d-a24c-4deae6a027bb" />

<img width="1072" height="840" alt="image" src="https://github.com/user-attachments/assets/a768c916-47a4-480e-896a-18b1ff4c4ca2" />

<img width="1049" height="819" alt="image" src="https://github.com/user-attachments/assets/e6c1d10d-4cd9-4e2e-ab31-a309e8a68060" />
