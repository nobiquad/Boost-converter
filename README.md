# Boost-converter
### Cel i specyfikacja projektu

Celem projektu było zaprojektowanie oraz analiza przetwornicy DC-DC typu Boost pracującej w trybie CCM (*Continuous Conduction Mode*).

**Główne parametry pracy:**
* **Kontroler PWM:** UC3843N
* **Napięcie wejściowe ($V_{in}$):** 12 V
* **Napięcie wyjściowe ($V_0$):** 24 V
* **Prąd wyjściowy ($I_0$):** 0,6 A
* **Częstotliwość przełączania ($f_{sw}$):** 250 kHz
* **Maksymalne tętnienia napięcia wyjściowego ($\Delta V_0$):** < 0,1 V

**Skrypt MATLAB realizuje:**

* **Wyznaczenie parametrów pracy oraz tętnień** przetwornicy DC-DC (Boost).
* **Projekt obwodu kompensacji nachylenia** (*slope compensation*).
* **Analizę stabilności** pętli sprzężenia zwrotnego.
* **Dobór elementów elektronicznych** na podstawie założonych parametrów pracy układu oraz pętli sprzężenia.
<img width="1135" height="609" alt="image" src="https://github.com/user-attachments/assets/886e1d9d-0ffe-4ade-b46a-4c26318f4c74" />
<img width="1011" height="573" alt="image" src="https://github.com/user-attachments/assets/5248602e-2ffb-43b5-87ba-0e29384ea916" />
<img width="1208" height="679" alt="image" src="https://github.com/user-attachments/assets/12e7e9ec-ec99-4bb4-901c-05105fefa35a" />

<img width="1179" height="670" alt="image" src="https://github.com/user-attachments/assets/f0ffd8bc-015d-4971-af88-e17f7d6aec61" />


Wynik pomiarów:
Z zamierzonych 250kHz uzyskano 235kHz a Ripple voltage wynosi 228Vpp.
<img width="1024" height="600" alt="Vout" src="https://github.com/user-attachments/assets/38be7efa-ac04-4d85-9353-7347566a029a" />

Przy obciążeniem 0.6A napiecie wynosi 23.37V i utrzymuje sie stabilnie na tym poziomie dopóki obciazenie jest mniejsze niż 0.6A. Napiecie 23.37V zamiast 24 wynika pewnie z niedokładności rezystancji rezystorów sprzeżenia zwrotnego.
Przy obciążeniem 0.67A napiecie siada do 22.40V 


