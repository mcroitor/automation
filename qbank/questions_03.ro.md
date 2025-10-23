# Întrebări pe tema "Tehnici avansate de automatizare"

1. Ce procese principale de dezvoltare software pot fi automatizate?
   - [x] Configurarea spațiului de lucru, construirea, implementarea și testarea
   - [ ] Scrierea codului, construirea și compilarea
   - [ ] Evaluarea complexității sarcinii, testarea și monitorizarea
   - [ ] Controlul versiunilor, documentarea și review-ul de cod
2. Ce este Web API în contextul automatizării?
   - [x] Un mecanism de integrare a serviciilor disparate într-un ecosistem unificat
   - [ ] Un program pentru crearea site-urilor web
   - [ ] O bază de date pentru aplicații web
   - [ ] Un instrument pentru dezvoltarea scripturilor
3. Ce înseamnă fiecare câmp în formatul crontab `* * * * * command`?
   - [x] minut oră zi_lunii lună zi_săptămânii comandă
   - [ ] secundă minut oră zi lună comandă
   - [ ] oră minut zi lună an comandă
   - [ ] minut oră lună zi_lunii zi_săptămânii comandă
4. Care comandă este folosită pentru editarea crontab-ului utilizatorului curent?
   - [x] `crontab -e`
   - [ ] `cron -e`
   - [ ] `edit crontab`
   - [ ] `nano /etc/crontab`
5. Ce înseamnă înregistrarea în crontab `0 2 * * * /home/user/backup.sh`?
   - [x] Execuție în fiecare zi la ora 2:00 dimineața
   - [ ] Execuție la fiecare 2 minute
   - [ ] Execuție de 2 ori pe zi
   - [ ] Execuție în fiecare a doua zi
6. Ce date se recomandă să fie incluse în jurnale pentru simplificarea analizei?
   - [x] Marcaj temporal, nivel de importanță, mesaj, identificator proces, metadata
   - [ ] Mesaj de eroare, login utilizator, parolă (dacă se aplică)
   - [ ] Marcaj temporal, identificator proces, identificator commit
   - [ ] Nivel de importanță, nume host, rezultat analizator de cod
7. Ce abordări sunt folosite pentru gestionarea eficientă a erorilor în automatizare?
   - [x] Înregistrarea erorilor, notificări, încercări repetate, soluții de rezervă
   - [ ] Înregistrarea erorilor, interacțiunea cu utilizatorul, încercări repetate
   - [ ] Notificări, încercări repetate, ignorarea erorilor
   - [ ] Soluții de rezervă, ignorarea erorilor
8. În ce cazuri ar trebui folosit Python în loc de Bash pentru automatizare?
   - [x] La lucrul cu structuri complexe de date (JSON, XML), cereri de rețea, gestionarea excepțiilor
   - [ ] Să folosești mereu doar Bash
   - [ ] Pentru dezvoltarea web, testare și monitorizare
   - [ ] Niciodată să nu folosești Python
9. Care modul Python este folosit pentru copierea fișierelor?
   - [x] `shutil`
   - [ ] `os`
   - [ ] `sys`
   - [ ] `datetime`
10. Ce să faci dacă apare o `UnicodeDecodeError` la citirea unui fișier într-un script Python?
    - [x] Să încerci o altă codificare sau să gestionezi excepția
    - [ ] Să sari linia cu eroare, nu este critică
    - [ ] Fișierul va fi șters, așa că trebuie să creezi o copie de rezervă
    - [ ] Să nu faci nimic, eroarea este ignorată
11. Pentru ce este folosită comanda `crontab -l`?
    - [x] Pentru vizualizarea sarcinilor curente
    - [ ] Pentru editarea sarcinilor
    - [ ] Pentru ștergerea tuturor sarcinilor
    - [ ] Pentru pornirea serviciului cron
12. Ce avantaje oferă integrarea prin Web API în CI/CD?
    - [x] Conectarea GitHub, GitLab, Jenkins; integrarea cu instrumente de analiză cod; sincronizarea gestionării proiectelor
    - [ ] Accelerarea dezvoltării, dar doar pentru aplicații web
    - [ ] Automatizarea testării, comunicațiilor și monitorizării
    - [ ] Controlul versiunilor; schimbul de experiență; recomandări de cod
13. Unde caută programatorul cron fișierele crontab?
    - [x] În `/var/spool/cron`, `/etc/anacrontab`, `/etc/cron.d`
    - [ ] În directorul home al utilizatorului
    - [ ] În `/etc/crontab`, `/usr/local/etc/cron`, `/home/cron`
    - [ ] În `/tmp/cron`
14. Care modul Python se potrivește cel mai bine pentru configurarea jurnalizării?
    - [x] `logging`
    - [ ] `print`
    - [ ] `sys`
    - [ ] `os`
15. Ce înseamnă `os.makedirs(path, exist_ok=True)` în Python?
    - [x] Creează directorul cu toate folderele părinte, ignorând dacă există deja
    - [ ] Creează directorul și generează eroare dacă există
    - [ ] Șterge directorul existent
    - [ ] Redenumește directorul
16. Ce instrumente pot fi folosite pentru analiza automată a jurnalelor?
    - [x] `grep`, `awk`, `sed`
    - [ ] Doar editoare de text
    - [ ] `nano`, `vim`, `emacs`
    - [ ] Doar browsere web
17. Ce înseamnă parametrul `sum(1 for _ in f)` în Python la numărarea liniilor unui fișier?
    - [x] Numără eficient liniile fără a încărca întregul fișier în memorie
    - [ ] Însumează conținutul fișierului
    - [ ] Șterge liniile din fișier
    - [ ] Creează o copie a fișierului
18. Ce rol joacă platformele cloud în dezvoltarea în echipă?
    - [x] Instrumente de colaborare, controlul versiunilor, pipeline-uri CI/CD
    - [ ] Stocarea fișierelor, scrierea sarcinilor, planificarea întâlnirilor
    - [ ] Backup, monitorizare, securitate, interacțiunea cu clienții
    - [ ] Hosting site-uri web, review cod, gestionarea proiectelor, interacțiunea cu clienții
19. Ce înseamnă înregistrarea `*/15 * * * *` în crontab?
    - [x] Execuție la fiecare 15 minute
    - [ ] Execuție la fiecare 15 ore
    - [ ] Execuție de 15 ori pe zi
    - [ ] Execuție la ora 15:00 în fiecare zi
20. Care bloc Python este folosit pentru gestionarea corectă a excepțiilor în automatizare?
    - [x] try-except
    - [ ] if-else
    - [ ] while-break
    - [ ] for-continue
21. Care metodă HTTP este folosită în mod obișnuit pentru obținerea datelor prin REST API?
    - [x] GET
    - [ ] POST
    - [ ] PUT
    - [ ] DELETE