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


### Wynik pomiarów:
* **Częstotliwość przełączania:** Zamiast zakładanych 250 kHz uzyskano **235 kHz**.
* **Tętnienia napięcia wyjściowego (ripple voltage):** Wynoszą **228 mVpp**.
<img width="1024" height="600" alt="Vout" src="https://github.com/user-attachments/assets/38be7efa-ac04-4d85-9353-7347566a029a" />
 
* **Praca przy obciążeniu znamionowym (0,6 A):** Napięcie wynosi **23,37 V** i utrzymuje się na stabilnym poziomie dla prądów do 0,6 A. Różnica względem zakładanych 24 V wynika z tolerancji rezystorów w dzielniku sprzężenia zwrotnego.
<img width="1289" height="679" alt="image" src="https://github.com/user-attachments/assets/16b8965c-fb95-4bf8-8f4b-1c5892833354" />
<img width="1283" height="660" alt="image" src="https://github.com/user-attachments/assets/99821b92-70c7-4874-911c-da424ef5d1eb" />
 

* **Praca przy przeciążeniu (0,67 A):** Przy obciążeniu prądem 0,67 A napięcie wyjściowe spada do **22,40 V**.
<img width="1284" height="770" alt="image" src="https://github.com/user-attachments/assets/c2c4e868-5580-4416-84f0-dd48cf285138" />
<img width="1297" height="719" alt="image" src="https://github.com/user-attachments/assets/cc437050-5d2e-4b04-b2cf-b1df4b60e11e" />


